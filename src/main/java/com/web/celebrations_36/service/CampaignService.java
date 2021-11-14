package com.web.celebrations_36.service;

import java.util.List;

import com.web.celebrations_36.model.Campaign;

public interface CampaignService {
	
	List<String>  getAllCategories();
	
	void save(Campaign campaign);

	List<Campaign> findAll();

	Campaign findById(int campaignId);

	void delete(int campaignId);
	//void deleteCampaignById(int campaignId);
	void deleteCampaignById(int campaignId);
	void update(Campaign campaign);
	
	void updateCampaignWithoutImg(Integer campaignId,Campaign campaign);
	//獲取類別商品
//	List<Campaign>getCampaignsByCategory(String category);
	List<Campaign> getCampaignsByCategory(String category,String campaignStatus);
	List<Campaign> getCampaignsByCampaignstatus(String campaignStatus);
    void updateCampaignstatus(String campaignStatus,Integer id);
    void updateViews(int campaignId);
}

