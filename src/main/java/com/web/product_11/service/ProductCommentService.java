package com.web.product_11.service;

import java.util.List;

import com.web.product_11.model.ProductComment;

public interface ProductCommentService {
	
	void  addProductComment(ProductComment productComment);
	
	
	ProductComment findByUserEmailandProductId(String userEmail,Integer productId);
	
	List<ProductComment>findByProductId(Integer productId);
	
	Long countByStar(Integer star,Integer productId);
	
	Integer countAllCommentByPid(Integer productId);
	
	Long countAllComment();
	
	ProductComment findByProductIdAndUserEmail(Integer productId,String userEmail);
	
	Long SumAllStar(Integer productId);
}
