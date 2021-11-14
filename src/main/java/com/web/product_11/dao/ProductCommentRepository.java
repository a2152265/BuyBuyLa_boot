package com.web.product_11.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.product_11.model.ProductComment;

public interface ProductCommentRepository extends JpaRepository<ProductComment, Integer> {

	@Query("from ProductComment p where p.userEmail=:userEmail and p.productId=:productId ")
	ProductComment findByUserEmailandProductId(String userEmail,Integer productId);
	
	List<ProductComment> findByProductId(Integer productId);
	
	@Query("Select Count(*) from ProductComment where star=:star and productId=:productId ")
	Long countByStar(Integer star,Integer productId);
	
	@Query("Select Count(*) from ProductComment where productId=:productId ")
	Integer countAllCommentByPid(Integer productId);
	
	@Query("Select Count(*) from ProductComment  ")
	Long countAllComment();
	
	@Query("SELECT SUM(star) FROM ProductComment where productId=:productId ")
	Long SumAllStar(Integer productId);
	

	ProductComment findByProductIdAndUserEmail(Integer productId,String userEmail);
	
}
