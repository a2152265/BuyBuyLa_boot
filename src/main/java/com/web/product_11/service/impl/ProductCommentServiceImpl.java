package com.web.product_11.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.product_11.dao.ProductCommentRepository;
import com.web.product_11.model.ProductComment;
import com.web.product_11.service.ProductCommentService;

@Service
public class ProductCommentServiceImpl implements ProductCommentService {

	
	ProductCommentRepository productCommentRepository;
	
	
	@Autowired
	public ProductCommentServiceImpl(ProductCommentRepository productCommentRepository) {
		this.productCommentRepository = productCommentRepository;
	}


	//新增評論
	@Override
	public void addProductComment(ProductComment productComment) {
		productCommentRepository.save(productComment);
	}




	@Override
	public List<ProductComment> findByProductId(Integer productId) {
		return productCommentRepository.findByProductId(productId);
	}


	@Override
	public ProductComment findByUserEmailandProductId(String userEmail, Integer productId) {
		return productCommentRepository.findByUserEmailandProductId(userEmail, productId);
	}




	@Override
	public Integer countAllCommentByPid(Integer productId) {
		return productCommentRepository.countAllCommentByPid(productId);
	}


	@Override
	public ProductComment findByProductIdAndUserEmail(Integer productId, String userEmail) {
		return productCommentRepository.findByProductIdAndUserEmail(productId, userEmail);
	}





	@Override
	public Long countAllComment() {
		return productCommentRepository.countAllComment();
	}


	@Override
	public Long countByStar(Integer star, Integer productId) {
		return productCommentRepository.countByStar(star, productId);
	}


	@Override
	public Long SumAllStar(Integer productId) {
		return productCommentRepository.SumAllStar(productId);
	}






}
