package com.web.product_11.service;

import java.util.List;
import com.web.product_11.model.Product;

public interface ProductService {
		//查詢全部商品
		List<Product>  getAllProducts(); 
			
		//依商品名稱查詢商品
		List<Product> getProductByName(String name);
		
		//查詢商品類別
		List<String>  getAllCategories();
		
		//獲取類別商品
		List<Product>  getProductsByCategory(String category);
		
		//ID查詢商品
		Product getProductById(int productId);
		
		//依照商品新增時間查詢商品
		List<Product>productOrderByInsertTime();
		
		//狀態查詢商品
		List<Product> findByStatus(String status);
		
		//新增商品
		void  addProduct(Product product);
		
		//更新商品
		void updateProduct(int productId,Product product);
		
		//更新商品(無照片)
		void updateProductNoImg(Integer productId,Product product);
		
		//更新商品狀態
		void updateProductStatus(String status,int productId);
		
		//刪除商品
		void  deleteProduct(int productId);
		
		//查詢賣家商品
		List<Product> getProductBySeller(String seller);
}
