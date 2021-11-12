package com.web.cart_30.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.web.cart_30.model.BuyerAddress;



public interface BuyerAddressRepository extends JpaRepository<BuyerAddress,Integer> {
	@Query(nativeQuery = true, value = "select * from BuyerAddress where buyer=?1")
    public  List<BuyerAddress> selectAllBuyerAddressByBuyer(String buyer);

	@Query(nativeQuery = true, value = "select * from BuyerAddress where record_id=?1")
	public BuyerAddress findByRecord_id(String rid);
	
	@Transactional
	@Modifying
	@Query(nativeQuery = true, value = "delete from BuyerAddress where record_id=?1")
	public void deleteAddress(String rid);
}
