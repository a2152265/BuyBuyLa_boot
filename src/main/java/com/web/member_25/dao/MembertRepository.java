package com.web.member_25.dao;

import java.sql.Blob;
import java.util.List;

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
	//找會員data
	membershipInformationBean findByUserEmail(String userEmail);
	
	//忘記密碼驗證
	@Query("from membershipInformationBean m where m.member_pwdToken=:member_pwdToken")
	membershipInformationBean findByMember_pwdToken1(@Param("member_pwdToken") String member_pwdToken);
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
			+ "m.userNickname=:userNickname,"
			+ "m.birthday=:birthday,"
			+ "m.userGender=:userGender,"
			+ "m.address=:address,"   //,head_shot=:head_shot
			+ "m.head_shot=:head_shot," 
			+ "m.fileName=:fileName " 
			+ "WHERE m.userEmail=:userEmail") 
  void upadteMemberData(
		  @Param("userPhone") String userPhone,
		  @Param("userName") String userName,
		  @Param("userNickname") String userNickname,
		  @Param("birthday") String birthday,
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
			+ "m.userNickname=:userNickname,"
			+ "m.birthday=:birthday,"
			+ "m.userGender=:userGender,"
			+ "m.address=:address "   //,head_shot=:head_shot
			+ "WHERE m.userEmail=:userEmail") 
  void upadteMemberDataWithNoImg(
		  @Param("userPhone") String userPhone,
		  @Param("userName") String userName,
		  @Param("userNickname") String userNickname,
		  @Param("birthday") String birthday,
		  @Param("userGender") String userGender,
		  @Param("address") String address,
		  @Param("userEmail") String userEmail);

	
	
	
//	@Modifying
//	@Query("update User u set u.firstname = ?1, u.lastname = ?2 where u.id = ?3")
//	void setUserInfoById(String firstname, String lastname, Integer userId);
//	
	//只搜包含某些關鍵字
//	List<Registration> findByPlaceContaining(String place);

}
