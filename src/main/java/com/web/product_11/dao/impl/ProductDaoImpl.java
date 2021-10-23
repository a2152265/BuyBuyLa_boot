//package com.web.product_11.dao.impl;
//
//import java.util.List;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.query.Query;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.web.product_11.dao.ProductDao;
//import com.web.product_11.model.Product;
//
//@Repository
//public class ProductDaoImpl implements ProductDao {
//
//	SessionFactory factory;
//	
//	
//	@Autowired
//	public ProductDaoImpl(SessionFactory factory) {
//		this.factory = factory;
//	}
//
//	public ProductDaoImpl() {
//	}
//
//	//查詢全部商品
//	@Override
//	public List<Product> getAllProducts() {
//		Session session=factory.getCurrentSession();
//		String hql="from Product";
//		return session.createQuery(hql, Product.class)
//				.getResultList();
//	}
//
//	//查詢商品類別
//	@Override
//	public List<String> getAllCategories() {
//		Session session=factory.getCurrentSession();
//		String hql="select distinct category from Product";
//		return session.createQuery(hql, String.class)
//				.getResultList();
//	}
//
//	//獲取類別商品
//	@Override
//	public List<Product> getProductsByCategory(String category) {
//		Session session=factory.getCurrentSession();
//		String hql="from Product p where p.category=:cate";
//		
//		return session.createQuery(hql,Product.class)
//				.setParameter("cate",category)
//				.getResultList();
//	}
//
//	//依主鍵查詢商品
//	@Override
//	public Product getProductById(int productId) {
//		Session session=factory.getCurrentSession();
//		return session.get(Product.class, productId);
//	}
//
//	//新增商品
//	@Override
//	public void addProduct(Product product) {
//		Session session=factory.getCurrentSession();
//		session.save(product);
//	}
//	
//	//更新商品(全)
//	@Override
//	public void updateProduct(int productId, Product product) {
//		Session session=factory.getCurrentSession();
//		
//			session.saveOrUpdate(product);
//	
//	}
//	
//	
//	//依商品名稱查詢
//	@Override
//	public List<Product> getProductByName(String name) {
//		Session session=factory.getCurrentSession();
//		String hql="from Product where productName like '%"+name+"%'";
//		return session.createQuery(hql, Product.class)
//					.getResultList();
//	}
//
//	@Override
//	public void deleteProduct(int productId) {
//		Session session=factory.getCurrentSession();
//		Product product=new Product();
//		product.setProductId(productId);
//		
//		session.delete(product);
//	}
//
//	@Override
//	public void updateProductNoImg(int productId, Product product) {
//		Session session=factory.getCurrentSession();
//		String hql="update Product set productName=:name,price=:price,category=:category,"
//				+ "stock=:stock,productNo=:no where productId=:id";
//		session.createQuery(hql)
//		.setParameter("name", product.getProductName())
//		.setParameter("price", product.getPrice())
//		.setParameter("category", product.getCategory())
//		.setParameter("stock",product.getStock())
//		.setParameter("no", product.getProductNo())
//		.setParameter("id", productId)
//		.executeUpdate();
//		
//		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//	}
//	
//}
