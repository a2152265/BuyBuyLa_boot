package com.web.celebrations_36.service.Impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.celebrations_36.dao.CampaignRepository;
import com.web.celebrations_36.model.Campaign;
import com.web.product_11.model.Product;
import com.web.celebrations_36.service.CampaignService;

@Service
public class CampaignServiceImpl implements CampaignService {
	
	CampaignRepository campaignRepository;
	
	@Autowired
	public CampaignServiceImpl(CampaignRepository campaignRepository) {
		this.campaignRepository = campaignRepository;
	}

	@Override
	public void save(Campaign campaign) {
		campaignRepository.save(campaign);
	}

	@Override
	public List<Campaign> findAll() {
		return campaignRepository.findAll();
	}

	@Override
	public Campaign findById(int campaignId) {
		return campaignRepository.findCampaignById(campaignId);
	}
	
	@Override
	public void delete(int campaignId) {
		campaignRepository.deleteById(campaignId);
	
	}

	@Override
	public void update(Campaign campaign) {
		campaignRepository.save(campaign);
	}

	


	@Override
	public void deleteCampaignById(int campaignId) {
		campaignRepository.deleteCampaignById(campaignId);
	}
	
	@Override
	public List<Campaign> getCampaignsByCategory(String category) {
		return campaignRepository.getCampaignsByCategory(category);
	}

	@Override
	public void updateCampaignWithoutImg(Integer campaignId, Campaign campaign) {
		campaignRepository.updateCampaigWithoutImg(campaign.getName(), campaign.getUrl(), campaign.getDescription(), campaign.getDate1(),campaign.getCategory(),campaign.getNote(), campaignId);
		
	}

	@Override
	public List<String> getAllCategories() {
		
		return campaignRepository.getAllCategories();
	}

//	@Override
//	public void deleteCampaignById(int campaignId) {
//		campaignRepository.deleteCampaignById(campaignId);
//		
//	}


}
