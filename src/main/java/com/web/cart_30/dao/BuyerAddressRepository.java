package com.web.cart_30.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.cart_30.model.BuyerAddress;



public interface BuyerAddressRepository extends JpaRepository<BuyerAddress,Integer> {
	@Query(nativeQuery = true, value = "select * from BuyerAddress where buyer=?1")
    public  List<BuyerAddress> selectAllBuyerAddressByBuyer(String buyer);
}
