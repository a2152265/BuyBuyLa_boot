package com.web.member_25.dao;

import java.sql.Blob;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.web.member_25.model.membershipInformationBean;


public interface MembertRepository extends JpaRepository<membershipInformationBean, Integer> {
	
//	List<String> findCategory();
	@Query("select distinct category from Product")
	List<String>  getAllCategories();
	
	//登入   //select membershipInformationBean where UserEmail=XX and UserPwd=XXX
	membershipInformationBean findByUserEmailAndUserPwd(String userEmail,String userPwd);
	//管理者or會員
	membershipInformationBean findIdentificationByUserEmail(String userEmail);
	
	membershipInformationBean findByUserEmail(String userEmail);
	//用ID找會員資料 (for 讀取圖片)
	membershipInformationBean findById(int i);
	
	//刪除帳號
	@Transactional
	void deleteByUserEmail(String userEmail);
	
	//更新會員資料測試
//	membershipInformationBean update(membershipInformationBean mb);
	//更新會員資料
	@Transactional
	  @Modifying
  @Query("UPDATE membershipInformationBean m "
			+ "set m.userPhone=:userPhone,"
			+ "m.userName=:userName,"
			+ "m.userGender=:userGender,"
			+ "m.address=:address,"   //,head_shot=:head_shot
			+ "m.head_shot=:head_shot," 
			+ "m.fileName=:fileName " 
			+ "WHERE m.userEmail=:userEmail") 
  void upadteMemberData(
		  @Param("userPhone") String userPhone,
		  @Param("userName") String userName,
		  @Param("userGender") String userGender,
		  @Param("address") String address,
		  @Param("head_shot") Blob blob,
		  @Param("fileName") String fileName,
		  @Param("userEmail") String userEmail);
	
	
	
	//更新會員資料(無圖片)
	@Transactional
	  @Modifying
  @Query("UPDATE membershipInformationBean m "
			+ "set m.userPhone=:userPhone,"
			+ "m.userName=:userName,"
			+ "m.userGender=:userGender,"
			+ "m.address=:address "   //,head_shot=:head_shot
			+ "WHERE m.userEmail=:userEmail") 
  void upadteMemberDataWithNoImg(
		  @Param("userPhone") String userPhone,
		  @Param("userName") String userName,
		  @Param("userGender") String userGender,
		  @Param("address") String address,
		  @Param("userEmail") String userEmail);
	
	
	
	
	
	//只搜包含某些關鍵字
//	List<Registration> findByPlaceContaining(String place);

}
