package com.web.product_11.service.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.web.product_11.dao.ProductFavoriteRepository;
import com.web.product_11.model.ProductFavorite;
import com.web.product_11.service.ProductFavoriteService;

@Service
public class ProductFavoriteServiceImpl implements ProductFavoriteService {
	
	ProductFavoriteRepository productFavoriteRepository;
	
	
	public ProductFavoriteServiceImpl(ProductFavoriteRepository productFavoriteRepository) {
		super();
		this.productFavoriteRepository = productFavoriteRepository;
	}


	@Override
	public void addFavoriteProduct(ProductFavorite productFavorite) {
		productFavoriteRepository.save(productFavorite);
	}


	@Override
	public ProductFavorite findByMidAndPid(Integer memberId, Integer productId) {
		return productFavoriteRepository.findByMidAndPid(memberId, productId);
	}


	@Override
	public List<ProductFavorite> findByMemberId(Integer memberId) {
		return productFavoriteRepository.findByMemberId(memberId);
	}


	@Override
	public void deleteByMidAndPid(Integer memberId, Integer productId) {
		productFavoriteRepository.deleteByMidAndPid(memberId, productId);
	}


	

}
