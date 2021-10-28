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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.member_25.model.membershipInformationBean;
import com.web.product_11.model.Product;
import com.web.product_11.service.ProductService;

@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData" })
public class ProductController {

	ProductService productservice;
	ServletContext servletContext;

	@Autowired
	public ProductController(ProductService productservice, ServletContext servletContext) {
		super();
		this.productservice = productservice;
		this.servletContext = servletContext;
	}

	public ProductController() {
	}

	//顯示所有商品
	@GetMapping("/products")
	public String list(Model model) {

		List<Product> beans = productservice.getAllProducts();
		model.addAttribute("products", beans);
		return "product_11/products";
		
		
	}
	
	//管理頁面-商品
		@GetMapping("/manage/products")
		public String managelist(Model model) {

			List<Product> beans = productservice.getAllProducts();
			model.addAttribute("products", beans);
			return "product_11/manage/products";
			
			
		}
		
	//顯示賣家商品
		@GetMapping("/products/seller")
		public String productBySeller(
				@ModelAttribute("loginSession") membershipInformationBean loginMb,
				Model model) {

			List<Product> beans = productservice.getProductBySeller(loginMb.getUserEmail());
			model.addAttribute("sellerproducts", beans);
			return "product_11/productBySeller";		
			
		}
	
	
	
	//個別商品頁面
		@GetMapping("/product")
		public String getProductById(
			@RequestParam("id") Integer id, // 查詢字串
			 Model model) {
			model.addAttribute("product", productservice.getProductById(id));
			return "product_11/product";
		}
		
	//商品名稱查詢
		@RequestMapping("/queryproduct")
		public String processQueryProduct(
				@RequestParam("productName") String productName,
				Model model
				) {
			List<Product> bean = productservice.getProductByName(productName);
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
		   Long timeStamp = System.currentTimeMillis();  //获取当前时间戳
	       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	       String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp)))); 

	       p.setSeller(loginMb.getUserEmail());
	       
	       
	       p.setInsertTime(sd);
		// ----------------------------------------
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

		return "redirect:/manage/products";
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
				@ModelAttribute("product") Product p,
				 Model model) {
			
			
				p.setProductId(productId);
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!p.getProductImage()==="+p.getProductImage());
				
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
					
				
				
				
//				// 取出副檔名，.png、.jpg
//				String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//				// 找到應用系統根目錄 /mvcExercise
//				String rootDirectory = servletContext.getRealPath("/");
//				try {
//					// 在根目錄下建立images資料夾
//					File imageFolder = new File(rootDirectory, "images");
//					if (!imageFolder.exists())
//						imageFolder.mkdirs();
//					File file = new File(imageFolder, "Product_" + p.getProductId() + ext);
//					productImage.transferTo(file);
//				} catch (Exception e) {
//					e.printStackTrace();
//					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//				}
				
				
		
			return "redirect:/manage/products";
		}
		
		
		
//刪除表單		
		@GetMapping("/delete/{productId}")
		public String getDeleteProductForm(@PathVariable("productId") Integer productId, Model model) {
			productservice.deleteProduct(productId);
			
			return "redirect:/manage/products";
		}
		
		

//表單只接受下列欄位，其他欄位丟出例外
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields("productName", "price", "category", "stock", "productInfo", "productNo",
				"productImage");
	}

//
//	@GetMapping({"/","index.html"}) //請求路徑
//	public String index000() {
//		return "index";   //視圖邏輯名稱， /WEB-INF/views/index.jsp
//	}
	
}
