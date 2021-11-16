package com.web.product_11.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.cart_30.model.Cart;
import com.web.cart_30.service.CartService;
import com.web.celebrations_36.model.Campaign;
import com.web.celebrations_36.service.CampaignService;
import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;
import com.web.product_11.model.Product;
import com.web.product_11.model.ProductComment;
import com.web.product_11.model.ProductFavorite;
import com.web.product_11.service.ProductCommentService;
import com.web.product_11.service.ProductFavoriteService;
import com.web.product_11.service.ProductService;

@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData","OrderItemCount" })
public class ProductController {

	ProductService productservice;
	ProductCommentService productCommentService;
	ProductFavoriteService productFavoriteService;
	MemberService memberService;
	ServletContext servletContext;
	CartService cartService;
	CampaignService campaignService;
	JavaMailSender mailSender;
	



	@Autowired
	public ProductController(ProductService productservice, ProductCommentService productCommentService,
			ProductFavoriteService productFavoriteService, MemberService memberService, ServletContext servletContext,
			CartService cartService, JavaMailSender mailSender,
			CampaignService campaignService) {
		this.productservice = productservice;
		this.productCommentService = productCommentService;
		this.productFavoriteService = productFavoriteService;
		this.memberService = memberService;
		this.servletContext = servletContext;
		this.cartService = cartService;
		this.mailSender = mailSender;
		this.campaignService = campaignService;
	}

	
	public ProductController() {
	}


	//顯示所有商品
	@GetMapping("/allProducts")
	public String productList(Model model) {
		List<Product> allProducts = productservice.productOrderByInsertTime();
		model.addAttribute("allProducts", allProducts);
		return "product_11/products_all";
	}
	
	
	
	//管理頁面-商品(只顯示未審核商品)
		@GetMapping("/manage/products/{status}")
		public String managelist(
				@PathVariable String status
				,Model model) {
				System.out.println("@@@@@@@@@@@"+status);
				if(status=="待審核") {
					model.addAttribute("status", "待審核");
				}
				
				List<Product> beans = productservice.findByStatus(status);
				model.addAttribute("products", beans);
				
				//商品種類圖表
				String[] categoryArray=new String[] {"手機平板與周邊","運動健身","生活用品","寵物","其他"};
				String c = "";

				for (String category : categoryArray) {
					Long countByCategory = productservice.countByCategory(category);
					c += countByCategory+",";	
				}
				
				model.addAttribute("category",c);

				
				//商品狀態圖表
				String[] statusArray=new String[] {"上架中","待審核","審核失敗"};
				String s = "";
				for (String pStatus : statusArray) {
					Long countByStatus = productservice.countByStatus(pStatus);
					s += countByStatus+",";	
				}
				model.addAttribute("productStatus",s);
				
				//商品會賣家圖表
				String seller="";
				System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
				List<String> productSeller = productservice.getProductSeller();
				System.out.println("!!!!!!!!");
				String[] sellerArray=new String[] {productSeller.get(0),productSeller.get(1),productSeller.get(2)};
				System.out.println("~~~~~~~~~~~"+sellerArray[0]);
				for(String pSeller:sellerArray) {
					Long countBySeller = productservice.countBySeller(pSeller);
					seller+=countBySeller+",";
				}
				model.addAttribute("sellerNo1", productSeller.get(0));
				model.addAttribute("sellerNo2", productSeller.get(1));
				model.addAttribute("sellerNo3", productSeller.get(2));
				model.addAttribute("seller", seller);
				
				
			return "product_11/manage/products";
					
		}
		
	//商品上架成功(管理者)
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
		
		//商品上架未通過(管理者)
				@PostMapping("/manage/launchedfail")
				public ResponseEntity<String> productlaunchedfail(
						Model model,
						 @RequestParam("productIds") String productIds) {
					String[] productIds_line = productIds.split(",");
					

					for(int i=0;i<productIds_line.length;i++) {
						int pId = Integer.parseInt(productIds_line[i]);
						productservice.updateProductStatus("審核失敗",pId);
						
					}
					
					return new ResponseEntity<String>(HttpStatus.OK) ;
					

							
				}
		
		
		//商品上架成功(管理者)寄信
		@GetMapping("/launched_addaddress")
		public ResponseEntity<String> launchedEmail(
				@ModelAttribute("loginSession") membershipInformationBean mb2,
				 @RequestParam("productIds") String productIds

				) {
			System.out.println("準備寄信---------------------------------");
		
			String[] productIds_line = productIds.split(",");
			

			SimpleMailMessage message =new SimpleMailMessage();
			for(int i=0;i<productIds_line.length;i++) {
				int pId = Integer.parseInt(productIds_line[i]);
				Product productById = productservice.getProductById(pId);
				message.setTo(productById.getSeller());  //測試用我的
				message.setSubject("BuyBuyLa  最懂你的購物商城");
				message.setText(
				"您好 : "+mb2.getUserName()+"\r\n歡迎光臨BuyByLA購物商城 "+"\r\n"
				+"您的商品已經審核成功。"+"\r\n"
				+ "商品資訊如下:"+"\r\n"
				+ "商品代號:"+productById.getProductId()+"\r\n"
				+ "商品名稱:"+productById.getProductName()+"\r\n"+"\r\n"
				+ "提醒您，商品資訊請照實填寫"+"\r\n"
				+ "如對商品上下架審核結果有疑問，請聯絡客服，謝謝您，祝您生意興榮。"
						);
				
			}
			
			
			
			mailSender.send(message);
			System.out.println("------------------已寄出------------------ --->code=");
			 return new ResponseEntity<String>(HttpStatus.OK);
			
		}
		
		
		//商品上架失敗(管理者)寄信
				@GetMapping("/launched_addaddressfail")
				public ResponseEntity<String> launchedEmailfail(
						@ModelAttribute("loginSession") membershipInformationBean mb2,
						@RequestParam("productIds") String productIds
						) {
					SimpleMailMessage message =new SimpleMailMessage();
					String[] productIds_line = productIds.split(",");
					for(int i=0;i<productIds_line.length;i++) {
						int pId = Integer.parseInt(productIds_line[i]);
						Product productById = productservice.getProductById(pId);
						message.setTo(productById.getSeller());  //測試用我的
						message.setSubject("BuyBuyLa  最懂你的購物商城");
						message.setText(
						"您好 : "+mb2.getUserName()+"\r\n歡迎光臨BuyByLA購物商城 "+"\r\n"
						+"您的商品已經審核失敗。"+"\r\n"
						+ "商品資訊如下:"+"\r\n"
						+ "商品代號:"+productById.getProductId()+"\r\n"
						+ "商品名稱:"+productById.getProductName()+"\r\n"+"\r\n"
						+ "提醒您，商品資訊請照實填寫"+"\r\n"
						+ "如對商品上下架審核結果有疑問，請聯絡客服，謝謝您，祝您生意興榮。"
								);
						
					}

					mailSender.send(message);
					System.out.println("------------------已寄出------------------ --->code=");
					 return new ResponseEntity<String>(HttpStatus.OK);
					
				}
	//顯示賣家商品
		@GetMapping("/products/seller")
		public String productBySeller(
				@ModelAttribute("loginSession") membershipInformationBean loginMb,
				Model model) {
			if(loginMb==null) {
				return "index";
			}
			String userEmail = loginMb.getUserEmail();
			List<Product> beans = productservice.getProductBySeller(userEmail);
			model.addAttribute("sellerproducts", beans);
			
			//商品瀏覽次數排行
			List<Product> viewProductList = productservice.getViewBySeller(userEmail);
			model.addAttribute("viewProductList", viewProductList);
			
			//商品銷售量排行
			List<Product> salesProductList = productservice.getSalesBySeller(userEmail);
			model.addAttribute("salesProductList", salesProductList);
			
			//商品收藏排名
			List<Product> favoriteProductList = productservice.getFavoriteCountBySeller(userEmail);
			model.addAttribute("favoriteProductList", favoriteProductList);
			
			return "product_11/seller/productBySeller";		
			
		}
	

	//個別商品頁面
		@GetMapping("/product")
		public String getProductById(
			@RequestParam("id") Integer id, // 查詢字串
			 Model model) {
		
			Product product = productservice.getProductById(id);
			
			if((membershipInformationBean) model.getAttribute("loginSession")!=null) {
				
				membershipInformationBean mb=(membershipInformationBean) model.getAttribute("loginSession");
				membershipInformationBean member = memberService.findMemberData(mb.getUserEmail());			
				membershipInformationBean mBean=memberService.findMemberData(product.getSeller());
				System.out.println("!!!!!!!!!!!!!"+product.getProductId());
				if(productFavoriteService.findByMidAndPid(member.getId(), product.getProductId())!=null) {
					ProductFavorite producrFavorite = productFavoriteService.findByMidAndPid(member.getId(), product.getProductId());
					model.addAttribute("producrFavorite", producrFavorite); 
					
					
					
				}
	
				model.addAttribute("memberUiDefault",mBean);
				
				
			
			}else {
				
				membershipInformationBean mBean=memberService.findMemberData(product.getSeller());
				model.addAttribute("memberUiDefault",mBean);
				
				
				
			}
			
			
			model.addAttribute("productComment",productCommentService.findByProductId(id));
			model.addAttribute("product", product);

			List<Product> productBySellerList= new ArrayList<>();
			
			for(Product p:productservice.findBySellerAndStatus(product.getSeller(), "上架中")) {
				if(p.getProductId()==id) {
					continue;
				}
				productBySellerList.add(p);
			}
			model.addAttribute("sellerProduct", productBySellerList);
			productservice.updateViews(id);
			
			//商品狀態圖表
			Integer[] starArray=new Integer[] {5,4,3,2,1};
			ArrayList<Long> arrayList = new ArrayList<>();
		
			for (Integer star : starArray) {
				
				
					Long countByStar = productCommentService.countByStar(star,id);
					arrayList.add(countByStar);
					System.out.println("^^^^^^^^^^^"+countByStar);
					
				
			}
			
			//總星星平價計算
			System.out.println("countAllComment"+productCommentService.countAllComment());
			if(productCommentService.SumAllStar(id)!=null) {
				
				Long sumAllStar = productCommentService.SumAllStar(id);
				if(productCommentService.countAllCommentByPid(id)!=0) {
					Long starScore = sumAllStar/productCommentService.countAllCommentByPid(id);
					System.out.println("sumAllStar"+sumAllStar);
					System.out.println("starScore"+starScore);
					model.addAttribute("starScore", starScore);	
					
				}
			}
			model.addAttribute("starcount", productCommentService.countAllCommentByPid(id));	
			model.addAttribute("star", arrayList);	
			
			//顯示兌換商品
			List<Product> productByPoint= new ArrayList<>();
			
			for(Product p:productservice.getAllPoints()) {
				if(p.getProductId()==id) {
					continue;
				}
				productByPoint.add(p);
			}
			
					model.addAttribute("allPoints", productByPoint);
				
			
			
			return "product_11/product";
		}
		
	//商品名稱查詢
		@GetMapping("/queryproduct")
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
		       //商品銷售量
		       p.setSales(0);
		       
		       p.setViews(0);
		       
		       p.setDiscount(1.0);
	
		       p.setFavoriteCount(0);
		       
		       p.setPoint(0);
		       
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
		
		@GetMapping("/rank/{category}") // 路徑變數{category}
		public String getProductsByCategoryRank(@PathVariable("category") String category, Model model) {
			List<Product> products = productservice.getProductsByCategory(category);
			model.addAttribute("products", products);
			return "product_11/products_category";
		}
		
		//限時活動
		@GetMapping("/campaigns/countdownSales")
		public String productList1(Model model) {
			List<Campaign> findAll = campaignService.findAll();
			campaignService.updateViews(findAll.get(6).getId());

			List<Campaign> campaignsByCategory = campaignService.getCampaignsByCategory("限時活動", "已結束");
			String category="寵物";
			int size = campaignsByCategory.size();
			if(size==0) {
			
//			System.out.println("12w12w12w12sqwxq"+campaignsByCategory.size());
      		
			productservice.updateProductDiscount(0.8, category);
			List<Product> beans = productservice.getProductsByCategory(category);

			model.addAttribute("products", beans);
			return "celebrations_36/countdownSales";
			
			}else {
//			System.out.println("12w12w12w12sqwxq"+campaignsByCategory.size());

				productservice.updateProductDiscount(1.0, category);
				List<Product> beans = productservice.getProductsByCategory(category);

				model.addAttribute("products", beans);
			
			return "celebrations_36/countdownSales";}
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
				@RequestParam("discount") String discount,
				@RequestParam("views") String views,
				@RequestParam("favoriteCount") String favoriteCount,
				@RequestParam("point") String point,
				@ModelAttribute("product") Product p,
				@ModelAttribute("loginSession") membershipInformationBean loginMb,
				
				 Model model) {
			
			
				p.setProductId(productId);
				p.setInsertTime(insertTime);
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!p.getProductImage()==="+p.getProductImage());
				p.setSeller(loginMb.getUserEmail());
			       //商品狀態
			       p.setStatus("待審核");
			       p.setDiscount(Double.parseDouble(discount));
			       p.setViews(Integer.parseInt(views));
			       p.setFavoriteCount(Integer.parseInt(favoriteCount));
			       p.setFavoriteCount(Integer.parseInt(point));
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
		@GetMapping("delete/{productId}")
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
						@RequestParam("star") String star,
						Model model) {
					ProductComment productComment = new ProductComment();
					productComment.setContent(content);
					productComment.setUserEmail(userEmail);
					productComment.setProductId(Integer.parseInt(productId));
					productComment.setStar(Integer.parseInt(star));
					
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
		
//-----------------------------------商品我的最愛-----------------------------------------
		//新增我的最愛
				@GetMapping("/favorite")
				public ResponseEntity<String> addFavoriteProduct(
						@RequestParam("productId") String id
						,Model model) {
			
					membershipInformationBean mb=(membershipInformationBean) model.getAttribute("loginSession");
					int pId = Integer.parseInt(id);
					System.out.println("!!!!!!!!!!!"+mb.getUserEmail());
					System.out.println("!!!!!!!!!!!"+mb.getIdentification());
					
					ProductFavorite productFavorite = new ProductFavorite();
					Product product = productservice.getProductById(pId);
					
					membershipInformationBean member = memberService.findMemberData(mb.getUserEmail());
					
					productFavorite.setMembershipInformationBean(member);
					productFavorite.setProduct(product);
					ProductFavorite producrFavorite = productFavoriteService.findByMidAndPid(member.getId(), product.getProductId());
					if(producrFavorite == null) {
						productFavoriteService.addFavoriteProduct(productFavorite);
						productservice.plusFavoriteCount(pId);
					}
					
					return new ResponseEntity<String>(HttpStatus.OK);

				}
				
				
		//刪除我的最愛
				@GetMapping("/deletefavorite")
				public ResponseEntity<String> deleteFavoriteProduct(
						@RequestParam("productId") String id
						,Model model) {
					System.out.println("############"+id);
					membershipInformationBean mb=(membershipInformationBean) model.getAttribute("loginSession");
					int pId = Integer.parseInt(id);
		

					System.out.println("############"+mb.getUserEmail());
					membershipInformationBean member = memberService.findMemberData(mb.getUserEmail());
					
					productFavoriteService.deleteByMidAndPid(member.getId(),pId);
					productservice.subFavoriteCount(pId);
					
					return new ResponseEntity<String>(HttpStatus.OK);

				}
				
		//依照會員取得我的最愛
				@GetMapping("/member/favorite")
				public String getFavoriteProduct(Model model) {
					
					membershipInformationBean mb=(membershipInformationBean) model.getAttribute("loginSession");
					membershipInformationBean member = memberService.findMemberData(mb.getUserEmail());
					List<Product> pList= new ArrayList<>();
					System.out.println(member.getId());
					List<ProductFavorite> productFavorite = productFavoriteService.findByMemberId(member.getId());
					for(ProductFavorite p:productFavorite) {
						Product product = p.getProduct();
						Integer productId = product.getProductId();
						Product favoriteproduct = productservice.getProductById(productId);
						pList.add(favoriteproduct);
					}
						model.addAttribute("favoriteList", pList);
					
							return "product_11/buyer/product_favorite";
					
				}
				

		//匯出資料
				@GetMapping("/productCsv")
			     public ResponseEntity<String> exportProduct() throws SQLException, IOException {
			      
			      FileOutputStream fos=new FileOutputStream(new File("C:/CSV/products.json"));
			      OutputStreamWriter osw=new OutputStreamWriter(fos);
			      BufferedWriter fileWriter = new BufferedWriter(osw);
			         fileWriter.write("商品代號,商品名稱,新增時間,商品價格,商品描述,商品銷售量,商品賣家,商品狀態,商品庫存,商品瀏覽");
			         List<Product> pBean= productservice.getAllProducts();
			         for ( Product p: pBean) {
			          String line = String.format("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s",
			           p.getProductId(),p.getProductName(),p.getInsertTime(),p.getPrice(),p.getProductInfo(),p.getSales(),p.getSeller(),p.getStatus(),p.getStock(),p.getViews());
			           System.out.println("@@@@@@@@@@@@@@@@12346"+p.getProductName());
			                   fileWriter.newLine();
			                   fileWriter.write(line);                         
			      }
			         fileWriter.close();
			         osw.close();
			         return new ResponseEntity<String>(HttpStatus.OK);
			     }
				
				
}
