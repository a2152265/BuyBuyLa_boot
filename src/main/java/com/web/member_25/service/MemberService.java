package com.web.member_25.service;

import java.util.List;
import java.util.Optional;


import com.web.member_25.model.membershipInformationBean;



public interface MemberService {

	boolean existsById(String id);




	Optional<membershipInformationBean> findById(int id);

	void delete(int pk);
	//更新會員資料(有圖)
	void update(membershipInformationBean mb);
	//更新會員資料(沒圖片)
	void updateWithNoImage(membershipInformationBean mb);
	
	//登入
	int login(String userEmail, String userPwd);
	//管理者判斷
	Boolean memberOrManager(String userEmail); 
	//重複帳號
	Boolean overlappedAccount(String userEmail);
	//註冊
	void save(membershipInformationBean mb);
	
	membershipInformationBean getMemberData(String userEmail);
	membershipInformationBean getMemberData2(String userEmail);
	membershipInformationBean findMemberDataAll(String userEmail);

	//刪除帳號
	void deleteByName(String userEmail);
	void deleteMemberByPrimaryKey(int id);
	int findIdByEmail(String userEmail);
	
	
	
	//管理者UI展示會員
	List<membershipInformationBean> selectAllUsers();


	membershipInformationBean findMemberData(String userEmail);

	
//	//前置下拉選單 
//	List<membershipInformationBean>  getIdentificationList();
	
	//測試security的登入
	int loginByEmail(String userEmail);
	


}