package com.web.celebrations_36.service;

import java.util.List;

import com.web.celebrations_36.model.Redeem;

public interface RedeemService {

	void save(Redeem redeem);

	List<Redeem> findAll();
	
	List<Redeem> findAllByUseremail(String userEmail);
}
