package com.web.product_11.service;

import java.util.List;
import java.util.Optional;

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
		
		//新增商品
		void  addProduct(Product product);
		
		//更新商品
		void updateProduct(int productId,Product product);
		
		
		void updateProductNoImg(int productId,Product product);
		
		//刪除商品
		void  deleteProduct(int productId);
}
