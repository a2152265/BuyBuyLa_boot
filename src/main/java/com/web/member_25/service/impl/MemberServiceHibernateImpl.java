//package com.web.member_25.service.impl;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.web.member_25.dao.MemberDao;
//import com.web.member_25.model.MemberBean;
//import com.web.member_25.model.membershipInformationBean;
//import com.web.member_25.service.MemberService;
//
//
//
//
//@Transactional
//@Service
//public class MemberServiceHibernateImpl implements MemberService {
//
//	MemberDao dao;
//	
//	@Autowired
//	public MemberServiceHibernateImpl(MemberDao dao) {
//		this.dao = dao;
//	}
//	
//	@Override
//	public boolean existsById(String id) {
//		return dao.existsById(id);
//	}
//
//	@Override
//	public void save(membershipInformationBean mb) {
////		MemberDao dao = new MemberJdbcDaoImpl();
//		dao.save(mb);
//	}
//
//	@Override
//	public List<MemberBean> findAll() {
//		return dao.findAll();
//	}
//
//	@Override
//	public membershipInformationBean findById(int id) {
//		return dao.findById(id);
//	}
//
//	@Override
//	public void delete(int ipk) {
//		dao.delete(ipk);
//	}
//
//	@Override
//	public void update(membershipInformationBean mb) {
//		dao.update(mb);
//	}
//
//	@Override
//	public int login(String userEmail, String userPwd) {
//		return dao.login(userEmail, userPwd);
//		
//	}
//
//	@Override
//	public int overlappedAccount(String userEmail) {
//		return dao.overlappedAccount(userEmail);
//		
//	}
//
//	@Override
//	public membershipInformationBean getMemberData(String userEmail) {
//		return dao.getMemberData(userEmail);
//	}
//
//	@Override
//	public membershipInformationBean getMemberData2(String userEmail) {
//		return dao.getMemberData2(userEmail);
//	}
//
//	@Override
//	public void deleteByName(String userEmail) {
//		dao.deleteByName(userEmail);
//	}
//
//	@Override
//	public int findIdByEmail(String userEmail) {
//		return dao.findIdByEmail(userEmail);
//		
//	}
//
//	@Override
//	public Boolean memberOrManager(int id) {
//		
//		return dao.memberOrManager(id);
//	}
//
//	@Override
//	public membershipInformationBean getMemberById(int id) {
//		
//		return dao.getMemberById(id);
//	}
//
//	@Override
//	public void updateWithNoImage(membershipInformationBean mb) {
//		 dao.updateWithNoImage(mb);
//	}
//
//	@Override
//	public List<membershipInformationBean> selectAllUsers() {
//		
//		return dao.selectAllUsers();
//	}
//
////	@Override   //下拉選單
////	public List<membershipInformationBean> getIdentificationList() {
////		return dao.getIdentificationList();
////	}
//
//}
