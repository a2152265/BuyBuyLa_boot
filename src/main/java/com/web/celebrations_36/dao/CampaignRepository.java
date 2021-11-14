package com.web.celebrations_36.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.web.celebrations_36.model.Campaign;

public interface CampaignRepository extends JpaRepository<Campaign, Integer> {
	Campaign findCampaignById(int campaignId);
//	void deleteCampaignById(int productId);
//	void delete(int campaignId);
//	 void updateWithoutImg(Campaign campaign);
	 @Query("from Campaign c where c.category=:category and c.campaignStatus=:campaignStatus")
	 List<Campaign> getCampaignsByCategory(String category,String campaignStatus);
	 
	 @Query("from Campaign c where c.campaignStatus=:campaignStatus")
	 List<Campaign> getCampaignsByCampaignstatus(String campaignStatus);
	
	 @Modifying(clearAutomatically = true)
	 @Transactional
     @Query(value = "delete from Campaign where id = :campaignId",nativeQuery = true)
	 void deleteCampaignById(int campaignId);
	 
	 @Modifying(clearAutomatically = true)
	 @Transactional
     @Query("update Campaign set name=:name,url=:url,description=:description,date1=:date1,category=:category,note=:note where id = :campaignId")
	 void updateCampaigWithoutImg(String name,String url,String description,String date1,String category,String note,Integer campaignId);

	 @Query("select distinct category from Campaign")
	 List<String>  getAllCategories();

	 @Modifying(clearAutomatically = true)
	 @Transactional
     @Query("update Campaign set campaignStatus=:campaignStatus where id = :id")
	 void updateCampaignstatus(String campaignStatus,Integer id);


	 @Transactional
	 @Modifying
	 @Query("update Campaign set views=views+1 where id = :campaignId")
	 void updateViews(int campaignId);

}

