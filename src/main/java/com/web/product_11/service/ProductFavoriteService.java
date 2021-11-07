package com.web.product_11.service;


import com.web.product_11.model.ProductFavorite;

public interface ProductFavoriteService {
	void addFavoriteProduct(ProductFavorite productFavorite);
	
	ProductFavorite findByMidAndPid(Integer memberId,Integer productId);
	
	
	
}
