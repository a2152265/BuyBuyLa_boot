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
		return productRepositoryDao.findAll();
	}

	@Override
	public List<Product> getProductByName(String productname) {
		return productRepositoryDao.findByProductName(productname);
	}

	@Override
	public List<String> getAllCategories() {
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
	
		productRepositoryDao.updateProductNoImg(product.getProductName(), product.getPrice(), product.getCategory(),product.getInsertTime(), product.getStock(), product.getProductNo(),product.getStatus(), productId);
	}

	@Override
	public void deleteProduct(int productId) {
		productRepositoryDao.deleteById(productId);
	}

	@Override
	public List<Product> getProductBySeller(String seller) {
		return productRepositoryDao.findBySeller(seller);
	}

	@Override
	public void updateProductStatus(String status,int productId) {
		productRepositoryDao.updateProductStatus(status, productId);
		
	}



	@Override
	public List<Product> productOrderByInsertTime() {
		return productRepositoryDao.productOrderByInsertTime();
	}

	@Override
	public List<Product> findByStatus(String status) {
		
		return productRepositoryDao.findByStatus(status);
	}


	@Override
	public List<Product> productOrderBySales() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void updateViews(int pid) {
		productRepositoryDao.updateViews(pid);
	}


	public void updateProductDiscount(Double discount, String category) {
		productRepositoryDao.updateProductDiscount(discount, category);
		
	}

	@Override
	public List<Product> findBySellerAndStatus(String seller, String status) {
		return productRepositoryDao.findBySellerAndStatus(seller, status);
	}

	@Override
	public List<Product> getByCategoryOrderByPrice(String category) {
		return productRepositoryDao.getByCategoryOrderByPrice(category);
	}

	@Override
	public Long countByCategory(String category) {
		return productRepositoryDao.countByCategory(category);
	}

	@Override
	public Long countByStatus(String status) {
		return productRepositoryDao.countByStatus(status);
	}

	@Override
	public List<Product> getViewBySeller(String seller) {
		return productRepositoryDao.getViewBySeller(seller);
	}

	@Override
	public List<Product> getSalesBySeller(String seller) {
		return productRepositoryDao.getSalesBySeller(seller);
	}

	@Override
	public void plusFavoriteCount(int pid) {
		productRepositoryDao.plusFavoriteCount(pid);
	}

	@Override
	public void subFavoriteCount(int pid) {
		productRepositoryDao.subFavoriteCount(pid);
	}

	@Override
	public List<Product> getFavoriteCountBySeller(String seller) {
		return productRepositoryDao.getFavoriteCountBySeller(seller);
	}

	@Override
	public void updateSales(int pid, int sales) {
		productRepositoryDao.updateSales(pid, sales);
	}

	
	



	@Override
	public List<Product> getAllPoints() {
		
		return productRepositoryDao.getAllPoints();
	}











}
