//package com.web.product_11.service.impl;
//
//import java.util.List;
//
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.web.product_11.dao.ProductDao;
//import com.web.product_11.model.Product;
//import com.web.product_11.service.ProductService;
//
//
//@Service
//@Transactional
//public class ProductSerivceImpl implements ProductService {
//
//	SessionFactory factory;
//	ProductDao productDao;
//	
//
//	@Autowired
//	public ProductSerivceImpl(SessionFactory factory, ProductDao productDao) {
//		super();
//		this.factory = factory;
//		this.productDao = productDao;
//	}
//
//	public ProductSerivceImpl() {
//	}
//
//	@Override
//	public List<Product> getAllProducts() {
//		
//		return productDao.getAllProducts();
//	}
//
//	@Override
//	public List<String> getAllCategories() {
//		
//		return productDao.getAllCategories();
//	}
//
//	@Override
//	public List<Product> getProductsByCategory(String category) {
//		
//		return productDao.getProductsByCategory(category);
//	}
//
//	@Override
//	public Product getProductById(int productId) {
//		
//		return productDao.getProductById(productId);
//	}
//
//	@Override
//	public void addProduct(Product product) {
//		productDao.addProduct(product);
//
//	}
//
//	@Override
//	public void updateProduct(int productId, Product product) {
//		productDao.updateProduct(productId, product);
//	}
//
//	@Override
//	public List<Product> getProductByName(String name) {
//		return productDao.getProductByName(name);
//	}
//
//	@Override
//	public void deleteProduct(int productId) {
//		productDao.deleteProduct(productId);
//	}
//
//	@Override
//	public void updateProductNoImg(int productId, Product product) {
//		productDao.updateProductNoImg(productId, product);		
//	}
//
//}
