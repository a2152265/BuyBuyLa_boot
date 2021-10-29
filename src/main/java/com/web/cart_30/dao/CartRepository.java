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
	
	 @Query(nativeQuery = true,value="select * from Cart  where pid=?1 AND buyer=?2")
	 public List<Cart> existsByIdAndBuyer(Integer pid,String buyer) ;
		 
	
	
	
	
	@Transactional
	@Modifying
    @Query(nativeQuery = true,value="update Cart set count = ?1 where pid=?2")
	public void add(Integer count,Integer pid);	
	
	
	
	@Query(nativeQuery = true, value = "select * from Cart where buyer=?1")
    public  List<Cart> findAllByBuyer(String buyer);
	
}
