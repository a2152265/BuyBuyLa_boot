package com.web.celebrations_36.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.celebrations_36.dao.RedeemRepository;
import com.web.celebrations_36.model.Redeem;
import com.web.celebrations_36.service.RedeemService;

@Service
public class RedeemServiceImpl implements RedeemService {

	RedeemRepository redeemRepository;
	
	
	
	@Autowired
	public RedeemServiceImpl(RedeemRepository redeemRepository) {
		super();
		this.redeemRepository = redeemRepository;
	}

	@Override
	public void save(Redeem redeem) {
		redeemRepository.save(redeem);
	}

	@Override
	public List<Redeem> findAll() {
		return redeemRepository.findAll();
	}

	@Override
	public List<Redeem> findAllByUseremail(String userEmail) {
		return redeemRepository.findAllByUseremail(userEmail);
	}

}
