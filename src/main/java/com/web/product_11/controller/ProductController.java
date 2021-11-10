package com.web.product_11.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.cart_30.service.CartService;
import com.web.celebrations_36.model.Campaign;
import com.web.celebrations_36.service.CampaignService;
import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;
import com.web.product_11.model.Product;
import com.web.product_11.model.ProductComment;
import com.web.product_11.service.ProductCommentService;
import com.web.product_11.service.ProductService;

@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData" })
public class ProductController {

	ProductService productservice;
	ProductCommentService productCommentService;
	MemberService memberService;
	ServletContext servletContext;
	CartService cartService;
	CampaignService campaignService;

//	@Autowired
//	public ProductController(ProductService productservice, ProductCommentService productCommentService,
//			MemberService memberService, ServletContext servletContext, CartService cartService) {
//		super();
//		this.productservice = productservice;
//		this.productCommentService = productCommentService;
//		this.memberService = memberService;
//		this.servletContext = servletContext;
//		this.cartService = cartService;
//	}
	

	public ProductController() {
	}

	@Autowired
	public ProductController(ProductService productservice, ProductCommentService productCommentService,
		MemberService memberService, ServletContext servletContext, CartService cartService,
		CampaignService campaignService) {
	super();
	this.productservice = productservice;
	this.productCommentService = productCommentService;
	this.memberService = memberService;
	this.servletContext = servletContext;
	this.cartService = cartService;
	this.campaignService = campaignService;
}


	//顯示所有商品
	@GetMapping("/products")
	public String productList(Model model) {

		List<Product> beans = productservice.getAllProducts();
		model.addAttribute("products", beans);
		return "index";
		
		
	}
	
	
	
	//管理頁面-商品(只顯示未審核商品)
		@GetMapping("/manage/products")
		public String managelist(Model model) {

			List<Product> beans = productservice.findByStatus();
			model.addAttribute("products", beans);
			return "product_11/manage/products";
					
		}
		
	//商品上架(管理者)
		@PostMapping("/manage/launched")
		public ResponseEntity<String> productlaunched(
				Model model,
				 @RequestParam("productIds") String productIds) {
			String[] productIds_line = productIds.split(",");
			
			for(int i=0;i<productIds_line.length;i++) {
				int pId = Integer.parseInt(productIds_line[i]);
				productservice.updateProductStatus("上架中",pId);
				
			}

			return new ResponseEntity<String>(HttpStatus.OK) ;
					
		}
		
	//顯示賣家商品
		@GetMapping("/products/seller")
		public String productBySeller(
				@ModelAttribute("loginSession") membershipInformationBean loginMb,
				Model model) {

			List<Product> beans = productservice.getProductBySeller(loginMb.getUserEmail());
			model.addAttribute("sellerproducts", beans);
			return "product_11/seller/productBySeller";		
			
		}
	

	//個別商品頁面
		@GetMapping("/product")
		public String getProductById(
			@RequestParam("id") Integer id, // 查詢字串
			 Model model) {
			Product product = productservice.getProductById(id);
			

			 membershipInformationBean mBean=memberService.findMemberData(product.getSeller());
			
			model.addAttribute("product", product);
			model.addAttribute("productComment",productCommentService.findByProductId(id));
			model.addAttribute("memberUiDefault",mBean);
			
			
			
			return "product_11/product";
		}
		
	//商品名稱查詢
		@RequestMapping("/queryproduct")
		public String processQueryProduct(
				@RequestParam("productName") String productName,
				Model model
				) {
			List<Product> bean = productservice.getProductByName(productName);
			model.addAttribute("productName", productName);
			model.addAttribute("products", bean);
			return "product_11/products_query";
			
		}
		
	// 新增空白表單
	@GetMapping("/products/add")
	public String getAddNewProductForm(Model model) {
		Product p = new Product();
		model.addAttribute("productBean", p);
		return "product_11/addProduct";
	}

	//表單填寫，寫入資料庫
	@PostMapping("/products/add")
	public String processAddNewProductForm(@ModelAttribute("productBean") Product p,
			@ModelAttribute("loginSession") membershipInformationBean loginMb,
			BindingResult result // 父:Errors(表單如有錯誤放置)
	) {
		// 判斷是否有不合法欄位
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
			// 陣列裡面元素以逗號隔開，並轉成字串
		}
		System.out.println("p=" + p);
		
		//新增商品時間戳記
		   Long timeStamp = System.currentTimeMillis();  //获取当前时间戳
	       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	       String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp)))); 
	       p.setInsertTime(sd);
	       //獲取賣家帳號
	       p.setSeller(loginMb.getUserEmail());
	       
	       //商品狀態
	       p.setStatus("待審核");
	       p.setDiscount(1.0);

		if(!p.getProductImage().isEmpty()) {
		// 於productImage取得照片
		MultipartFile productImage = p.getProductImage();
		// 使用者照片檔名
		String originalFilename = productImage.getOriginalFilename();
		p.setFileName(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		// 不是空的and位元組不為空
		if (productImage != null && !productImage.isEmpty()) {
			try {
				// 取所有位元組
				byte[] b = productImage.getBytes();
				// 放置Blob
				Blob blob = new SerialBlob(b);
				// blob放到bean-Blob coverImage;
				p.setCoverImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
	       
	       productservice.addProduct(p);
		}else {
			
			productservice.addProduct(p);
		}
		
		
		// ----------------------------------------
//		// 取出副檔名，.png、.jpg
//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		// 找到應用系統根目錄 /mvcExercise
//		String rootDirectory = servletContext.getRealPath("/");
//		try {
//			// 在根目錄下建立images資料夾
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists())
//				imageFolder.mkdirs();
//			File file = new File(imageFolder, "Product_" + p.getProductId() + ext);
//			productImage.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}

		return "redirect:/products/seller";
	}

	//獲取類別List
	@ModelAttribute("categoryList")
	public List<String> getCategoryList() {
		return productservice.getAllCategories();
	}
	


	//讀取照片
		@GetMapping("/getPicture/{productId}")
		//位元組陣列，回應本體型態byte[]
		public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer productId) {
			//預設圖片字串，找不到圖片顯示
			String filePath = "/resources/images/NoImage.jpg";
			//裝圖片的位元
		    byte[] media = null;
		    //回應標頭
		    HttpHeaders headers = new HttpHeaders();
		    //檔名
		    String filename = "";
		    int len = 0;
		    //依照bookid取得bean物件
		    Product bean = productservice.getProductById(productId);
		    if (bean != null) {
		    	//取得bean圖片
		        Blob blob = bean.getCoverImage();
		        //取得檔案名稱
		        filename = bean.getFileName();
		        if (blob != null) {
		            try {
		            	//取位元長度
		                len = (int) blob.length();
		                //從第一個位元組取到最後一個位元(全部取出來)，不能寫0(與jdbc有關，從1開頭)
		                media = blob.getBytes(1, len);
		            } catch (SQLException e) {
		                throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
		            }
		        } else {
		        	//blob == null，直接顯示預設圖片
		        	System.out.println("預設path--->filePath======="+filePath);
		            media = toByteArray(filePath);
		            filename = filePath;
		        }
		    } else {
		    	//bean == null
		    	//直接把預設檔案轉成位元組陣列放入media變數內，直接顯示預設圖片
		    	System.out.println("預設path--->filePath=======---"+filePath);            
		        media = toByteArray(filePath);
		        filename = filePath;
		    }
		    //CacheControl不要放到快取區
		    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		    //由檔名傳回對應MIMETYPE ，MIMETYPE ://image/jpeg
		    String mimeType = servletContext.getMimeType(filename);
		    //標準字串轉成mediaType
		    MediaType mediaType = MediaType.valueOf(mimeType);
		    System.out.println("mediaType =" + mediaType);
		    //mediaType放入headers
		    headers.setContentType(mediaType);
		    ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		    return responseEntity;
		}
		
	//照片路徑轉換成位元組陣列方法
		private byte[] toByteArray(String filepath) {
		    byte[] b = null;
		    //getRealPath取出在servlet真實路徑
		    String realPath = servletContext.getRealPath(filepath);
		    try {
		    	//建立檔案
		        File file = new File(realPath);
		        long size = file.length();
		        //建立位元組陣列(file.length()=b)
		        b = new byte[(int) size];
		        InputStream fis = servletContext.getResourceAsStream(filepath);
		        fis.read(b);
		    } catch (FileNotFoundException e) {
		        e.printStackTrace();
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    return b;
		}
	

		@GetMapping("/products/{category}") // 路徑變數{category}
		public String getProductsByCategory(@PathVariable("category") String category, Model model) {
			List<Product> products = productservice.getProductsByCategory(category);
			model.addAttribute("products", products);
			return "product_11/products_category";
		}
		
//		@GetMapping("/campaigns/shippingVoucher2/{category}") // 路徑變數{category}
//		public String getProductsByCategory1(@PathVariable("category") String category, Model model) {
//			List<Product> products = productservice.getProductsByCategory(category);
//			model.addAttribute("products", products);
//			return "celebrations_36/shippingVoucher2";
//		}
		
		//限時活動
		@GetMapping("/campaigns/countdownSales")
		public String productList1(Model model) {
			
			List<Campaign> campaignsByCategory = campaignService.getCampaignsByCategory("限時活動", "已結束");
			String category="寵物";
			if(campaignsByCategory.size()==0) {
			
//			System.out.println("12w12w12w12sqwxq"+campaignsByCategory.size());
      		
			productservice.updateProductDiscount(0.8, category);
			List<Product> beans = productservice.getProductsByCategory(category);

			model.addAttribute("products", beans);
			
			}
//			System.out.println("12w12w12w12sqwxq"+campaignsByCategory.size());

				productservice.updateProductDiscount(1.0, category);
				List<Product> beans = productservice.getProductsByCategory(category);

				model.addAttribute("products", beans);
			
			return "celebrations_36/countdownSales";
		}
		
	//更新表單
		@GetMapping("/update")
		public String getUpdateProductForm(@RequestParam("productId") Integer productId, Model model) {
			Product product = productservice.getProductById(productId);
			model.addAttribute("product",product);
			return "product_11/updateForm";
		}
		
		@PostMapping("/update")
		public String processUpdateProductForm(
			
				@RequestParam("productId") Integer productId,
				@RequestParam("insertTime") String insertTime,
				@ModelAttribute("product") Product p,
				@ModelAttribute("loginSession") membershipInformationBean loginMb,
				
				 Model model) {
			
			
				p.setProductId(productId);
				p.setInsertTime(insertTime);
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!p.getProductImage()==="+p.getProductImage());
				p.setSeller(loginMb.getUserEmail());
			       //商品狀態
			       p.setStatus("待審核");
				if(!p.getProductImage().isEmpty()) {
					
					
					
					// 於productImage取得照片
					MultipartFile productImage = p.getProductImage();
					// 使用者照片檔名
					String originalFilename = productImage.getOriginalFilename();
					p.setFileName(originalFilename);
					// 建立Blob物件，交由 Hibernate 寫入資料庫
					// 不是空的and位元組不為空
					if (productImage != null && !productImage.isEmpty()) {
						try {
							// 取所有位元組
							byte[] b = productImage.getBytes();
							// 放置Blob
							Blob blob = new SerialBlob(b);
							// blob放到bean-Blob coverImage;
							p.setCoverImage(blob);
						} catch (Exception e) {
							e.printStackTrace();
							throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
						}
					}
					
					productservice.updateProduct(productId, p);
					
				}else if(p.getProductImage().isEmpty()){
					System.out.println("****************************");
					productservice.updateProductNoImg(productId, p);
					System.out.println("-------------------------------");
				}
					
			
		
			return "redirect:/products/seller";
		}
		
		
		
		
		
	//刪除表單		
		@GetMapping("/delete/{productId}")
		public String getDeleteProductForm(Model model,@PathVariable("productId") String productId ) {
			
			productservice.deleteProduct(Integer.parseInt(productId));
			return "redirect:/products/seller";
		}
		
		
	
		

	//表單只接受下列欄位，其他欄位丟出例外
		@InitBinder
		public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields("productName", "price", "category", "stock", "productInfo", "productNo",
				"productImage");
		}

//-----------------------------------商品評論-----------------------------------------
		
		//商品評論	
				@PostMapping("/comment")
				public ResponseEntity<String> insertProductComment( 
						@RequestParam("userEmail") String userEmail,
						@RequestParam("content") String content,
						@RequestParam("productId") String productId,
						Model model) {
					ProductComment productComment = new ProductComment();
					productComment.setContent(content);
					productComment.setUserEmail(userEmail);
					productComment.setProductId(Integer.parseInt(productId));
					
					ProductComment comment = productCommentService.findByUserEmailandProductId(userEmail, Integer.parseInt(productId));
					if(comment !=null) {
						return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
					}
					
					//新增留言時間戳記
					   Long timeStamp = System.currentTimeMillis();  //获取当前时间戳
				       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				       String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp)))); 
				       productComment.setCommentTime(sd);
					
					productCommentService.addProductComment(productComment);
					return new ResponseEntity<String>(HttpStatus.OK);
				}
		
	
}
