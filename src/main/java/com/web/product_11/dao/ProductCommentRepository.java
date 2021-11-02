package com.web.product_11.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.product_11.model.ProductComment;

public interface ProductCommentRepository extends JpaRepository<ProductComment, Integer> {

	@Query("from ProductComment p where p.userEmail=:userEmail and p.productId=:productId ")
	ProductComment findByUserEmailandProductId(String userEmail,Integer productId);
	
	List<ProductComment> findByProductId(Integer productId);
}
