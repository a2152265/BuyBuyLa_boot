package com.web.celebrations_36.service.Impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.celebrations_36.dao.CampaignDao;
import com.web.celebrations_36.model.Campaign;
import com.web.celebrations_36.service.CampaignService;

@Service
@Transactional
public class CampaignServiceImpl implements CampaignService {
	
	SessionFactory factory;
	CampaignDao campaignDao;
	
	@Autowired
	public CampaignServiceImpl(SessionFactory factory, CampaignDao campaignDao) {
		this.factory = factory;
		this.campaignDao = campaignDao;
	}
	
	@Override
	public void save(Campaign campaign) {
		campaignDao.save(campaign);
	}

	@Override
	public List<Campaign> findAll() {
		return campaignDao.findAll();
	}

	@Override
	public Campaign findById(int campaignId) {
		return campaignDao.findById(campaignId);
	}

	@Override
	public void delete(int campaignId) {
		campaignDao.delete(campaignId);
	}

	@Override
	public void update(Campaign campaign) {
		campaignDao.update(campaign);
	}

	@Override
	public void updateWithoutImg(Campaign campaign) {
		campaignDao.updateWithoutImg(campaign);
		
	}

}
