package com.web.product_11.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.product_11.model.Product;


public interface ProductRepository extends JpaRepository<Product, Integer> {
	
//	List<String> findCategory();
	@Query("select distinct category from Product")
	List<String>  getAllCategories();
	
	@Query("from Product where productName like '%:productName%'")
	List<Product> findByProductName(String productName);
	
	@Query("from Product p where p.category=:category")
	List<Product> getProductsByCategory(String category);

	Product findByProductId(int productId);

	
	
	
}
