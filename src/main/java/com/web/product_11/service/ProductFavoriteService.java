package com.web.product_11.service;


import java.util.List;

import com.web.product_11.model.ProductFavorite;

public interface ProductFavoriteService {
	void addFavoriteProduct(ProductFavorite productFavorite);
	
	ProductFavorite findByMidAndPid(Integer memberId,Integer productId);
	
	List<ProductFavorite> findByMemberId(Integer memberId);
	
	void deleteByMidAndPid(Integer memberId,Integer productId);
	
	
}
