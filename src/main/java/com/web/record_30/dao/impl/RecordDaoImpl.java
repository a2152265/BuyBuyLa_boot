//package com.web.record_30.dao.impl;
//
//import java.util.List;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.query.Query;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.web.record_30.dao.IRecordDao;
//import com.web.record_30.model.RecordBean;
//
//
//
//
//@Repository
//public class RecordDaoImpl implements IRecordDao {
//	
//	SessionFactory factory;
//	
//	@Autowired
//	public RecordDaoImpl(SessionFactory factory) {
//		this.factory=factory;
//	}
//
//	
//	@Override
//	public List<RecordBean> getAllRecords(String buyer){
//		Session session = factory.getCurrentSession();
//		String hql = "FROM RecordBean rb WHERE rb.buyer = :buyer order by record_id";
//		
//		return session.createQuery(hql,RecordBean.class)
//				.setParameter("buyer", buyer)
//				.getResultList();
//		
//		
//	}
//
//
//	@Override
//	public void deleteById(int record_id) {
//		Session session = factory.getCurrentSession();
//		RecordBean rb = new RecordBean();
//		System.out.println("rid3 = "+record_id);
//		String hql="delete from RecordBean r where r.record_id=:record_id";
//		
//		Query queryupdate=session.createQuery(hql)
//					.setParameter("record_id", record_id);
//		queryupdate.executeUpdate();
//		
//	}
//
//
//	@Override
//	public RecordBean update(RecordBean recordBean) {
//		Session session = factory.getCurrentSession();
//		String hql="update RecordBean set pcount=:pcount where record_id=:record_id AND PID=:PID";	
//		int count = session.createQuery(hql)
//		.setParameter("pcount", recordBean.getPcount())
//		.setParameter("PID", recordBean.getPid())
//		.setParameter("record_id", recordBean.getRecord_id())
//		.executeUpdate();
//	
//		if(count>0) {
//			return recordBean;
//		}
//			return null;
//	}
//
//
//	
//	
//}
