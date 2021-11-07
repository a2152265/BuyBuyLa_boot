package com.web.product_11.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.web.product_11.model.Product;


public interface ProductRepository extends JpaRepository<Product, Integer> {
	
//	List<String> findCategory();
	@Query("select distinct category from Product")
	List<String>  getAllCategories();
	
	@Query("from Product where productName like %:productName%")
	List<Product> findByProductName(@Param("productName") String productName);
	
	@Query("from Product p where p.category=:category")
	List<Product> getProductsByCategory(String category);

	Product findByProductId(int productId);
	
	@Query("from Product p where p.status='上架中' order by p.insertTime ASC")
	List<Product>productOrderByInsertTime();
	
	
	@Query("from Product p where p.status='待審核'")
	List<Product> findByStatus();
	
	@Transactional
	@Modifying
	@Query("update Product set productName=:name,price=:price,category=:category,insertTime=:insertTime,stock=:stock,productNo=:no,status=:status where productId=:id")
	void updateProductNoImg(@Param("name") String name,@Param("price") Double price,@Param("category")String category,@Param("insertTime")String insertTime,@Param("stock")Integer stock,@Param("no") String no,@Param("status") String status,@Param("id")Integer id);
	
	List<Product> findBySeller(String seller);
	
	@Transactional
	@Modifying
	@Query("update Product set status=:status where productId=:id")
	void updateProductStatus(String status,int id);
	
	
	@Transactional
	@Modifying
	@Query("update Product set stock=:stock where productId=:pid")
	void updateStock(int pid, int stock);
	
}
