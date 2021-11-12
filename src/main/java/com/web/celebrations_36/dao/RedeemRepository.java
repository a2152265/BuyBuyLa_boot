package com.web.celebrations_36.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.celebrations_36.model.Redeem;

public interface RedeemRepository extends JpaRepository<Redeem, Integer> {
	 
	@Query("from Redeem c where c.userEmail=:userEmail ")
	 List<Redeem> findAllByUseremail(String userEmail);
}
