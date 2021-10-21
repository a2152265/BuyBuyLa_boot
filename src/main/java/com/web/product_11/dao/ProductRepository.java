package com.web.product_11.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.product_11.model.Product;


public interface ProductRepository extends JpaRepository<Product, Integer> {
	
//	List<String> findCategory();
	@Query("select distinct category from Product")
	List<String>  getAllCategories();
	

}
