package com.web.product_11.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.product_11.dao.ProductRepository;
import com.web.product_11.model.Product;
import com.web.product_11.service.ProductService;

@Service
public class ProductSerivceImpl_boot implements ProductService{
	
	@Autowired
	ProductRepository productRepositoryDao;

	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return productRepositoryDao.findAll();
	}

	@Override
	public List<Product> getProductByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getAllCategories() {
		// TODO Auto-generated method stub
		return productRepositoryDao.getAllCategories();
	}

	@Override
	public List<Product> getProductsByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product getProductById(int productId) {
		
		return productRepositoryDao.getById(productId);
	}

	@Override
	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProduct(int productId, Product product) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProductNoImg(int productId, Product product) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProduct(int productId) {
		// TODO Auto-generated method stub
		
	}

}
