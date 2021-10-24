package com.web.member_25.service.impl;

import java.util.List;
import java.util.Optional;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.stereotype.Service;

import com.web.member_25.dao.MembertRepository;
import com.web.member_25.model.MemberBean;
import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;
import com.web.product_11.dao.ProductRepository;
import com.web.product_11.model.Product;
import com.web.product_11.service.ProductService;

@Service
public class MemberSerivceImpl_boot implements MemberService{

	
	@Autowired
	MembertRepository membertRepository;

	@Override
	public boolean existsById(String id) {
	
		return false;
	}

	@Override
	public List<MemberBean> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public membershipInformationBean findById(int id) {
		membershipInformationBean mb=new membershipInformationBean();
		mb=membertRepository.findById(id);
		return mb;
	}

	@Override
	public void delete(int pk) {
		// TODO Auto-generated method stub
		
	}
	//更新會員資料(有頭貼)
	@Override
	public void update(membershipInformationBean mb) {
		System.out.println("update區--------->getFileName--------->"+mb.getFileName());
		membertRepository.upadteMemberData(mb.getUserPhone(), mb.getFileName(), mb.getUserGender(), mb.getAddress(), mb.getHead_shot(), mb.getFileName(), mb.getUserEmail());
		System.out.println("update更新完畢 準備重新導向zzzz");
		//測試
//		membertRepository.update(mb);
	}
		//更新會員資料(無頭貼)
	@Override
	public void updateWithNoImage(membershipInformationBean mb) {
		System.out.println("updateWithNoImage區--------->getFileName--------->"+mb.getFileName());
		membertRepository.upadteMemberDataWithNoImg(mb.getUserPhone(), mb.getFileName(), mb.getUserGender(), mb.getAddress(),  mb.getUserEmail());
		System.out.println("updateWithNoImage更新完畢 準備重新導向zzzz");
		
	}

	@Override
	public int login(String userEmail, String userPwd) {
		int loginState=0;
			System.out.println("login中......");
			
			
			
			try {
				System.out.println("findByUserEmailAndUserPwd------------------->"+membertRepository.findByUserEmailAndUserPwd(userEmail, userPwd));
				System.out.println("findByUserEmailAndUserPwd--getemail----------------->"+(membertRepository.findByUserEmailAndUserPwd(userEmail, userPwd)).getUserEmail());
				
				if (membertRepository.findByUserEmailAndUserPwd(userEmail, userPwd)==null) {
					loginState=2;
				}else {
					loginState=1; System.out.println("serverImpl成功登入");				
				}
		} catch (NullPointerException e) {
			e.printStackTrace();
			
			System.out.println("查無帳號  ----->");
			loginState=2;
		}catch (IncorrectResultSizeDataAccessException e) {
			System.out.println("帳號重複多筆--Inco ----->");
			loginState=3;
		}
		
		return loginState;
	}

	@Override    //頁面導向判斷
	public Boolean memberOrManager(String userEmail) {
		
		if (membertRepository.findIdentificationByUserEmail(userEmail).getIdentification().equals("manager")) {
			return false;
		}
		return true;
	}
	
	//會員介面載入後的預設值
	@Override
	public membershipInformationBean findMemberData(String userEmail) {
		membershipInformationBean mb=new membershipInformationBean();
		mb=membertRepository.findByUserEmail(userEmail);
		return mb;
	}
	
	
	//重複帳號   
	@Override  
	public Boolean overlappedAccount(String userEmail) {
		Boolean overlapped=true;
		membertRepository.findByUserEmail(userEmail);
		System.out.println("-----overlappedAccount---------------------------"+membertRepository.findByUserEmail(userEmail));
		
		
			if (membertRepository.findByUserEmail(userEmail)!=null) {
				overlapped=false;
				System.out.println("try-----------");
			}
			
//			try {
//				
//	} catch (NullPointerException e) {
//		e.printStackTrace();
//		
//		System.out.println("查無帳號  ----->");
//		overlapped=true;
//	}catch (IncorrectResultSizeDataAccessException e) {
//		System.out.println("帳號重複多筆--Inco ----->");
//		overlapped=true;
//	}
//		
		return overlapped;
	}

	//註冊
	@Override
	public void save(membershipInformationBean mb) {
		membertRepository.save(mb);
		
	}
	
	
	@Override
	public membershipInformationBean getMemberData(String userEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public membershipInformationBean getMemberData2(String userEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	//刪除帳號
	@Override
	public void deleteByName(String userEmail) {
		System.out.println("---------deleteByName DAO 進入ing---------");
		membertRepository.deleteByUserEmail(userEmail);
		System.out.println("---------deleteByName DAO 搞定---------");
	}

	@Override
	public int findIdByEmail(String userEmail) {
	
		return 0;
	}


	//讀取圖片
	@Override
	public membershipInformationBean getMemberById(int id) {
		
		return null;
	}

	@Override
	public List<membershipInformationBean> selectAllUsers() {
		
		return membertRepository.findAll();
	}

	@Override
	public membershipInformationBean findMemberDataAll(String userEmail) {
		membershipInformationBean mb=new membershipInformationBean();
		mb=membertRepository.findByUserEmail(userEmail);
		return mb;
	}


	

}
