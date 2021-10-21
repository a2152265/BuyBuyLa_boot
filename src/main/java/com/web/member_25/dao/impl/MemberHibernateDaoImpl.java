package com.web.member_25.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.member_25.dao.MemberDao;
import com.web.member_25.model.MemberBean;
import com.web.member_25.model.membershipInformationBean;


//import ch01.dao.MemberDao;
//import ch01.model.MemberBean;

//實作介面或繼承父類別,程式使用時直接寫父類別/介面名稱
@Repository
public class MemberHibernateDaoImpl implements MemberDao {

	SessionFactory factory;

	@Autowired
	public MemberHibernateDaoImpl(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public boolean existsById(String id) {
		Session session = factory.getCurrentSession();
		boolean result = false;

		String hql = "FROM MemberBean m WHERE m.id = :mid";
//		List<MemberBean> beans = session.createQuery(hql, MemberBean.class)
//				                        .setParameter("mid", id)
//				                        .getResultList();
//		if (beans.size() > 0) {
//			result = true;
//		} else {
//			result = false;
//		}
		try {
			session.createQuery(hql, MemberBean.class).setParameter("mid", id).getSingleResult();
			result = true;
		} catch (NoResultException e) {
			result = false;
		} catch (NonUniqueResultException e) {
			result = true;
		}

		return result;
	}

	@Override
	public void save(membershipInformationBean mb) {
		Session session = factory.getCurrentSession();
		mb.setIdentification("member");
		session.save(mb);
	}

	@Override
	public List<MemberBean> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean";
		List<MemberBean> beans = session.createQuery(hql, MemberBean.class).getResultList();
		return beans;
	}

	@Override
	public membershipInformationBean findById(int id) {
		Session session = factory.getCurrentSession();
		membershipInformationBean mb = session.get(membershipInformationBean.class, id);
		System.out.println("hi thiss findById-----------------");
//		membershipInformationBean mb=session.get(membershipInformationBean.class, userEmail);
		return mb;
	}

	@Override
	public void delete(int pk) {
		Session session = factory.getCurrentSession();
		MemberBean mb = new MemberBean();
		mb.setPk(pk);
		session.delete(mb);
	}

	@Override
	public void update(membershipInformationBean mb) {
		String hql="UPDATE membershipInformationBean m "
				+ "set m.userPhone=:userPhone,"
				+ "m.userName=:userName,"
				+ "m.userGender=:userGender,"
				+ "m.address=:address,"   //,head_shot=:head_shot
				+ "m.head_shot=:head_shot," 
				+ "m.fileName=:fileName " 
				+ "WHERE m.userEmail=:userEmail"; 
		  System.out.println("進入update------mb.getUserEmail----->"+mb.getUserEmail());
		  System.out.println("進入update------mb.getUserPhone----->"+mb.getUserPhone());
		  System.out.println("進入update------mb.getUserName----->"+mb.getUserName());
		  System.out.println("進入update------mb.getUserGender----->"+mb.getUserGender());
		  System.out.println("進入update------mb.getAddress----->"+mb.getAddress());
		  System.out.println("進入update------mb.getHead_shot----->"+mb.getHead_shot());
		  System.out.println("進入update------mb.getFileName----->"+mb.getFileName());
		
			try {
				Session session = factory.getCurrentSession();
				Query query = session.createQuery(hql)
						.setParameter("userEmail", mb.getUserEmail())
						.setParameter("userPhone", mb.getUserPhone())
						.setParameter("userName", mb.getUserName())
						.setParameter("userGender", mb.getUserGender())
						.setParameter("address", mb.getAddress())
						.setParameter("head_shot", mb.getHead_shot())
						.setParameter("fileName", mb.getFileName());
						query.executeUpdate();
						System.out.println("更新成功拉");
				} catch (Throwable t) {
				  System.out.println("出錯拉");
				  throw t;
				}
		
		System.out.println("update完畢");

	}
	
	
	
	
	@Override
	public void updateWithNoImage(membershipInformationBean mb) {
		String hql="UPDATE membershipInformationBean m "
				+ "set m.userPhone=:userPhone,"
				+ "m.userName=:userName,"
				+ "m.userGender=:userGender,"
				+ "m.address=:address "   //,head_shot=:head_shot
				+ "WHERE m.userEmail=:userEmail"; 
		  System.out.println("進入update------mb.getUserEmail----->"+mb.getUserEmail());
		  System.out.println("進入update------mb.getUserPhone----->"+mb.getUserPhone());
		  System.out.println("進入update------mb.getUserName----->"+mb.getUserName());
		  System.out.println("進入update------mb.getUserGender----->"+mb.getUserGender());
		  System.out.println("進入update------mb.getAddress----->"+mb.getAddress());
		  System.out.println("進入update with no image------mb.getHead_shot----->"+mb.getHead_shot());
		  System.out.println("進入update with no image------mb.getFileName----->"+mb.getFileName());
		
			try {
				Session session = factory.getCurrentSession();
				Query query = session.createQuery(hql)
						.setParameter("userEmail", mb.getUserEmail())
						.setParameter("userPhone", mb.getUserPhone())
						.setParameter("userName", mb.getUserName())
						.setParameter("userGender", mb.getUserGender())
						.setParameter("address", mb.getAddress());
						query.executeUpdate();
						System.out.println("更新成功拉");
				} catch (Throwable t) {
				  System.out.println("出錯拉");
				  throw t;
				}
		
		System.out.println("update with no image 完畢");
		
	}
	
	

	public int login(String userEmail, String userPwd) {
		Session session = factory.getCurrentSession();

		int loginState = 0;
		System.out.println("===================loginDAO執行中=");

		try {
//			 Query query=session.createQuery(hql);
//                   .getSingleResult();

			Query query = session.createQuery(
					"FROM membershipInformationBean where userEmail=:userEmail and userPwd=:userPwd",
					membershipInformationBean.class);
			query.setParameter("userEmail", userEmail);
			query.setParameter("userPwd", userPwd);
			System.out.println("===================HQL執行完畢query=" + query);
			System.out.println("===================HQL執行完畢=");

			System.out.println("query.getSingleResult()-------------> " + query.getSingleResult());
			loginState = 1;
		} catch (NoResultException e) {
			System.out.println("沒帳號拉");
			loginState = 2;
		} catch (NonUniqueResultException e) {
			System.out.println("多筆帳號拉");
			loginState = 3;
		}

		return loginState;

	}

	@Override
	public int overlappedAccount(String userEmail) {
		Session session = factory.getCurrentSession();
		int loginState = 0;
		System.out.println("===================overlappedAccount執行中=");

		try {
			
			Query query = session.createQuery(
					"FROM membershipInformationBean where userEmail=:userEmail",
					membershipInformationBean.class);
			query.setParameter("userEmail", userEmail);
			System.out.println("query.getSingleResult()-------------> " + query.getSingleResult());
			
			loginState = 1;
		} catch (NoResultException e) {
			System.out.println("沒人使用此帳號");
			loginState = 2;
		} catch (NonUniqueResultException e) {
			System.out.println("多筆帳號拉 怎麼可能!! 一定是菸捲搞的鬼");
			loginState = 3;
		}

		return loginState;
	}
	
	
	@Override    //找會員資料
	public membershipInformationBean getMemberData(String userEmail) {
		Session session = factory.getCurrentSession();
		membershipInformationBean mb=new membershipInformationBean();
		System.out.println("DAO--------getMemberData---------->"+userEmail);	
		
		String sql = "select userEmail,userPwd,userPhone,userName,userGender,address,head_shot,Identification "
				+ "from membershipInformation where userEmail=:userEmail";
		// addEntity()可以告訴Hibernate你想要封裝成物件的型別，然後自動為你封裝
		Query query = session.createQuery(sql,membershipInformationBean.class);
				query.setParameter("userEmail", userEmail);			

			System.out.println("DAO--------getMemberData---------->Query done ");
//		for(membershipInformationBean mbBean : list){
//		System.out.println("+DAO++  getMemberData  ++++getUserPwd+++++++++++"+mbBean.getUserPwd());
//		System.out.println("+DAO++  getMemberData  ++++getUserPhone+++++++++++"+mbBean.getUserPhone());
//		}
		
//		System.out.println("DAO--------getMemberData---------->for done ");
		
		return (membershipInformationBean) query;
	}
	
	@Override
	public membershipInformationBean getMemberData2(String userEmail) {
		
		Session session = factory.getCurrentSession();
		System.out.println("DAO---------getMemberData2 開始拉");
		membershipInformationBean mb = session.get(membershipInformationBean.class, userEmail);
		System.out.println("DAO---------getMemberData2 做完拉");
//		membershipInformationBean mb=session.get(membershipInformationBean.class, userEmail);
		return mb;
	}

	@Override
	public void deleteByName(String userEmail) {
//		Session session = factory.getCurrentSession();
		String sql = "DELETE FROM membershipInformationBean WHERE userEmail=:userEmail";
		// addEntity()可以告訴Hibernate你想要封裝成物件的型別，然後自動為你封裝
//		Query query = session.createQuery(sql,membershipInformationBean.class);
//				query.setParameter("userEmail", userEmail);		
				
				try {
					Session session = factory.getCurrentSession();
					  // your code
					Query query = session.createQuery(sql);
					query.setParameter("userEmail", userEmail);		
					  System.out.println(query.executeUpdate());
					  // your code end

					} catch (Throwable t) {
					  System.out.println("出錯拉");
					  throw t;
					}
	}

	@Override
	public int findIdByEmail(String userEmail) {
		String sql = "SELECT id FROM membershipInformationBean WHERE userEmail=:userEmail";
		int pk=0;
		membershipInformationBean mb=new membershipInformationBean();
		try {
			Session session = factory.getCurrentSession();
			System.out.println("開始進行email找ID---------------------->");
			Query query = session.createQuery(sql,Integer.class);
			query.setParameter("userEmail", userEmail);		
				query.getResultList();   //must
				pk=(int) query.getSingleResult();
			  System.out.println("getSingleResult======================>"+query.getSingleResult());
			  //  code end
			  return pk;
			} catch (Throwable t) {
			  System.out.println("出錯拉!!!!!!!!!!!");
			  throw t;
			
			}
		
	}

	@Override
	public Boolean memberOrManager(int id) {
		String m="";
		
		String sql = "SELECT Identification FROM membershipInformationBean WHERE id=:id";
		membershipInformationBean mb=new membershipInformationBean();
		try {
			Session session = factory.getCurrentSession();
			Query query = session.createQuery(sql,String.class);
			query.setParameter("id", id);		
				query.getResultList();   //must
				m=(String) query.getSingleResult();
			 
			  if (m.equals("manager")) {
				  return false;
			  }
			  return true;
			} catch (Throwable t) {
			  System.out.println("出錯拉!!!!66!!!!!!!");
			  throw t;
			}
		
	}
	
	
	
	@Override
	public membershipInformationBean getMemberById(int id) {
//		// 2.實作
//		Session session=factory.getCurrentSession();
//		String hql="";
//		//用主鍵查用get就可以了
//		return session.get(BookBean.class,productId);
		
		//加入例外處裡
		Session session = factory.getCurrentSession();
		membershipInformationBean bb = session.get(membershipInformationBean.class, id);
		if (bb == null) {
//			throw new ProductNotFoundException("會員編號：" + id + "找不到");
		}
		System.out.println("bb="+bb);
		return bb;
	}
	
	
	@Override
	 public List<membershipInformationBean> selectAllUsers() {

	  Session session = factory.getCurrentSession();
	  String hql = "FROM membershipInformationBean";

	  List<membershipInformationBean> list = session.createQuery(hql, membershipInformationBean.class).getResultList();
	  return list;
	}

	
	

//	//前置的下拉選單
//	@Override
//	public List<membershipInformationBean> getIdentificationList() {
//		Session session = factory.getCurrentSession();
//		System.out.println("前置的下拉選單功能在此 getIdentificationList");
//	    String hql = "FROM MembershipInformationBean";
//	    List<membershipInformationBean> list = session.createQuery(hql, membershipInformationBean.class)
//	    		                        .getResultList();
//	    return list;
//	}
}
