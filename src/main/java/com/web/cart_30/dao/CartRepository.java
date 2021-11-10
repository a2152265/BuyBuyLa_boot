package com.web.cart_30.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.transaction.annotation.Transactional;

import com.web.cart_30.model.BuyerAddress;
import com.web.cart_30.model.Cart;
import com.web.product_11.model.Product;


public interface CartRepository extends JpaRepository<Cart, Integer> {
	
	 @Query(nativeQuery = true,value="select * from Cart  where ProductId_FK=?1 AND buyer=?2")
	 public Cart existsByIdAndBuyer(Integer pid,String buyer) ;
		 	
		
	
	@Transactional
	@Modifying
    @Query(nativeQuery = true,value="update Cart set count = ?1 where ProductId_FK=?2")
	public void add(Integer count,Integer pid);	
	
	
	
	@Query(nativeQuery = true, value = "select * from Cart where buyer=?1")
    public  List<Cart> findAllByBuyer(String buyer);
	
	
	@Transactional
	@Modifying
	 @Query(nativeQuery = true,value="delete from Cart where ProductId_FK=?1 AND buyer=?2")
	public void deleteByPidAndBuyer(int pid,String buyer);	
	 
	
	@Transactional
	@Modifying
	 @Query(nativeQuery = true,value="delete from Cart where buyer=?1")
	public void deleteAllByBuyer(String buyer);	
	 
	

	 @Query(nativeQuery = true,value="select * from Cart  where ProductId_FK=?1 AND buyer=?2")
	 public Cart findByPidAndBuyer(int pid,String buyer) ;
	

	@Transactional
	@Modifying
	@Query(nativeQuery = true,value="update Cart set discount = ?1 where buyer=?2")
	public void addDiscountToCart(int discount,String buyer);
	
	 @Query(nativeQuery = true,value="select * from Cart  where buyer=?1 AND discount>0")
	 public  List<Cart> discountRepeat(String buyer) ;
	
	
}
