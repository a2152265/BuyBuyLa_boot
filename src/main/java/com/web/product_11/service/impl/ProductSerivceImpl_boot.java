package com.web.product_11.service.impl;

import java.util.List;
import java.util.Optional;

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
	public List<Product> getProductByName(String productname) {
		return productRepositoryDao.findByProductName(productname);
	}

	@Override
	public List<String> getAllCategories() {
		// TODO Auto-generated method stub
		return productRepositoryDao.getAllCategories();
	}

	@Override
	public List<Product> getProductsByCategory(String category) {
		return productRepositoryDao.getProductsByCategory(category);
	}

	@Override
	public Product getProductById(int productId) {
		return productRepositoryDao.findByProductId(productId);
	}

	@Override
	public void addProduct(Product product) {
		productRepositoryDao.save(product);
	}

	@Override
	public void updateProduct(int productId, Product product) {
		productRepositoryDao.saveAndFlush(product);
	}

	@Override
	public void updateProductNoImg(Integer productId, Product product) {
	
		productRepositoryDao.updateProductNoImg(product.getProductName(), product.getPrice(), product.getCategory(), product.getStock(), product.getProductNo(), productId);
	}

	@Override
	public void deleteProduct(int productId) {
		productRepositoryDao.deleteById(productId);
	}

}
