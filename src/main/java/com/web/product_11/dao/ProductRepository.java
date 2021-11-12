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
	

	@Query("from Product where point>0")
	List<Product> getAllPoints();
	
	@Query("from Product where productName like %:productName% and status='上架中'and stock>0 and point=0" )

	List<Product> findByProductName(@Param("productName") String productName);
	
	@Query("from Product p where p.category=:category and status='上架中'and stock>0 and point=0 ")
	List<Product> getProductsByCategory(String category);

	@Query("from Product  where category=:category and status='上架中'and stock>0 order by price DESC ")
	List<Product> getByCategoryOrderByPrice(String category);
	
	@Query("from Product  where seller=:seller order by views DESC ")
	List<Product> getViewBySeller(String seller);
	
	@Query("from Product  where seller=:seller order by sales DESC ")
	List<Product> getSalesBySeller(String seller);
	
	@Query("from Product  where seller=:seller order by favoriteCount DESC ")
	List<Product> getFavoriteCountBySeller(String seller);
	
	Product findByProductId(int productId);
	
	@Query("from Product p where p.status='上架中'and p.stock>0 and point=0 order by p.insertTime DESC")
	List<Product>productOrderByInsertTime();
	
	@Query("from Product p where p.status=:status")
	List<Product> findByStatus(String status);
	
	
	@Transactional
	@Modifying
	@Query("update Product set productName=:name,price=:price,category=:category,insertTime=:insertTime,stock=:stock,productNo=:no,status=:status where productId=:id")
	void updateProductNoImg(@Param("name") String name,@Param("price") Double price,@Param("category")String category,@Param("insertTime")String insertTime,@Param("stock")Integer stock,@Param("no") String no,@Param("status") String status,@Param("id")Integer id);
	
	List<Product> findBySeller(String seller);
	
	List<Product> findBySellerAndStatus(String seller,String status);
	
	@Transactional
	@Modifying
	@Query("update Product set status=:status where productId=:id")
	void updateProductStatus(String status,int id);
	
	
	@Transactional
	@Modifying
	@Query("update Product set stock=:stock where productId=:pid")
	void updateStock(int pid, int stock);
	
	
	@Transactional
	@Modifying
	@Query("update Product set views=views+1 where productId=:pid")
	void updateViews(int pid);
	
	
	//更新銷售量
	@Transactional
	@Modifying
	@Query("update Product set sales=:sales where productId=:pid")
	void updateSales(int pid,int sales);

	//更新收藏量(增加)
	@Transactional
	@Modifying
	@Query("update Product set favoriteCount=favoriteCount+1 where productId=:pid")
	void plusFavoriteCount(int pid);
	
	//更新收藏量(減少)
	@Transactional
	@Modifying
	@Query("update Product set favoriteCount=favoriteCount-1 where productId=:pid")
	void subFavoriteCount(int pid);
	
	
	@Transactional
	@Modifying
	@Query("update Product set discount=:discount where category=:category")
	void updateProductDiscount(Double discount,String category);
	

	Long countByCategory(String category);
	
	Long countByStatus(String status);
	
	
	
}
