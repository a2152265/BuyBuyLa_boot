package com.web.product_11.service;

import java.util.List;

import com.web.product_11.model.ProductComment;

public interface ProductCommentService {
	
	void  addProductComment(ProductComment productComment);
	
	
	ProductComment findByUserEmailandProductId(String userEmail,Integer productId);
	
	List<ProductComment>findByProductId(Integer productId);
}
