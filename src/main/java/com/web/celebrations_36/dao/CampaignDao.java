package com.web.celebrations_36.dao;

import java.util.List;

import com.web.celebrations_36.model.Campaign;


public interface CampaignDao {
	
	
	void save(Campaign campaign);

	List<Campaign> findAll();

	Campaign findById(int campaignId);

	void delete(int campaignId);

	void update(Campaign campaign);
	
	void updateWithoutImg(Campaign campaign);
}
