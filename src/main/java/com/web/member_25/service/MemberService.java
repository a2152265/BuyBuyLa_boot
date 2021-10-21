package com.web.member_25.service;

import java.util.List;

import com.web.member_25.model.MemberBean;
import com.web.member_25.model.membershipInformationBean;



public interface MemberService {

	boolean existsById(String id);

	void save(membershipInformationBean mb);

	List<MemberBean> findAll();

	membershipInformationBean findById(int id);

	void delete(int pk);
	//更新會員資料
	void update(membershipInformationBean mb);
	//更新會員資料(沒圖片)
	void updateWithNoImage(membershipInformationBean mb);
	
	int login(String userEmail, String userPwd);
	
	int overlappedAccount(String userEmail);
	
	membershipInformationBean getMemberData(String userEmail);
	membershipInformationBean getMemberData2(String userEmail);

	void deleteByName(String userEmail);
	int findIdByEmail(String userEmail);
	//管理者判斷
	Boolean memberOrManager(int id);
	
	//用ID找會員資料
	membershipInformationBean getMemberById(int id);
	
	//管理者介面展示會元
	List<membershipInformationBean> selectAllUsers();

	
//	//前置下拉選單 
//	List<membershipInformationBean>  getIdentificationList();


}