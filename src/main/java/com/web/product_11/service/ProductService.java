package com.web.product_11.service;

import java.util.List;
import com.web.product_11.model.Product;

public interface ProductService {
		//查詢全部商品
		List<Product>  getAllProducts(); 
			
		List<Product> getAllProductOrderBySales();
		//依商品名稱查詢商品
		List<Product> getProductByName(String name);
		
		//查詢商品類別
		List<String>  getAllCategories();
		
		//依照商品類別價格排序
		List<Product> getByCategoryOrderByPrice(String category);
		
		//獲取類別商品
		List<Product>  getProductsByCategory(String category);
		
		//會員、狀態查詢商品
		List<Product> findBySellerAndStatus(String seller,String status);
		
		//ID查詢商品
		Product getProductById(int productId);
		
		//依照商品銷售量查詢產品
		List<Product>productOrderBySales();
		
		//依照商品新增時間查詢商品
		List<Product>productOrderByInsertTime();
		
		//狀態查詢商品
		List<Product> findByStatus(String status);
		
		//依會員找瀏覽排行
		List<Product> getViewBySeller(String seller);
		
		//依會員找銷售排行
		List<Product> getSalesBySeller(String seller);
		
		//依會員找收藏排行
		List<Product> getFavoriteCountBySeller(String seller);
		
		//新增商品
		void  addProduct(Product product);
		
		//更新商品
		void updateProduct(int productId,Product product);
		
		//更新瀏覽次數
		void updateViews(int pid);
		
		//更新商品(無照片)
		void updateProductNoImg(Integer productId,Product product);
		
		//更新商品狀態
		void updateProductStatus(String status,int productId);
		

		//更新商品銷售量
		void updateSales(int pid,int sales);

		
		//更新商品收藏量(新增)
		void plusFavoriteCount(int pid);
		
		//更新商品收藏量(減少)
		void subFavoriteCount(int pid);
		
		//刪除商品
		void  deleteProduct(int productId);
		
		//查詢賣家商品
		List<Product> getProductBySeller(String seller);
		
		void updateProductDiscount(Double discount,String category);


		//種類計數
		Long countByCategory(String category);
		
		//狀態計數
		Long countByStatus(String status);

		
		List<Product>  getAllPoints();
		
		Long countBySeller(String seller);
		
		List<String> getProductSeller();

}
