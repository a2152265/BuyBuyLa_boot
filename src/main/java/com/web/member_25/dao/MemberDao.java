package com.web.member_25.dao;

import java.util.List;

import com.web.member_25.model.MemberBean;
import com.web.member_25.model.membershipInformationBean;


public interface MemberDao {

	boolean existsById(String id);

	//註冊
	void save(membershipInformationBean mb);

	List<MemberBean> findAll();

	membershipInformationBean findById(int id);

	void delete(int pk);

	void update(membershipInformationBean mb);
	//更新會員資料(沒圖片)
	void updateWithNoImage(membershipInformationBean mb);
	
	
	//登入
	int login(String userEmail, String userPwd);
	
	//帳號重複判斷
	int overlappedAccount(String userEmail);
	
	//找會員資料
	membershipInformationBean getMemberData(String userEmail);
	membershipInformationBean getMemberData2(String userEmail);

	void deleteByName(String userEmail);
	
	int findIdByEmail(String userEmail);
	
	//管理者判斷
		Boolean memberOrManager(int id);
		
	//用ID找會員資料
		membershipInformationBean getMemberById(int id);

		List<membershipInformationBean> selectAllUsers();
		
//	//前置下拉選單 
//		List<membershipInformationBean>  getIdentificationList();

}