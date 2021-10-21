package com.web.forum_32.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.forum_32.model.ForumBean;

@Repository
public class ForumDao implements IForumDao {
	
	SessionFactory factory;

	@Autowired
	public ForumDao(SessionFactory factory) {
		this.factory=factory;
	}

	@Override
	public List<ForumBean> getAllContents() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ForumBean order by id DESC";
		return session.createQuery(hql,ForumBean.class).getResultList();
	}

	@Override
	public ForumBean getContentByUsername(String userName) {
		Session session = factory.getCurrentSession();
		ForumBean fb = session.get(ForumBean.class, userName);
		if(fb==null) {
		}
		return fb;
	}

	@Override
	public void addContent(ForumBean content) {
		Session session = factory.getCurrentSession();
		session.save(content);
		
	}

	@Override
	public ForumBean getContentById(int id) {
		Session session = factory.getCurrentSession();
		ForumBean fb = session.get(ForumBean.class, id);
//		if (fb == null) {
//			throw new ProductNotFoundException("產品編號：" + id + "找不到");
//		}
		return fb;
	}

	@Override
	public void deleteContent(int id) {
		Session session = factory.getCurrentSession();
		ForumBean fb= new ForumBean();
		fb.setId(id);
		session.delete(fb);
	}

	@Override
	public void updateContent(ForumBean fb) {
        Session session = factory.getCurrentSession();
        String hql = "UPDATE ForumBean c SET c.content =:content , c.coverImage =:coverImage , c.date =:date , c.tag=:tag , c.userName=:userName WHERE c.id =:id";
        session.createQuery(hql).setParameter("content", fb.getContent())
        						.setParameter("coverImage", fb.getCoverImage())
        						.setParameter("date", fb.getDate())
        						.setParameter("tag", fb.getTag())
        						.setParameter("userName", fb.getUserName())
						        .setParameter("id", fb.getId())
						        .executeUpdate();
	}
	@Override
	public void updateContent2(ForumBean fb) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE ForumBean c SET c.content =:content , c.date =:date , c.tag=:tag , c.userName=:userName WHERE c.id =:id";
		session.createQuery(hql).setParameter("content", fb.getContent())
		.setParameter("date", fb.getDate())
		.setParameter("tag", fb.getTag())
		.setParameter("userName", fb.getUserName())
		.setParameter("id", fb.getId())
		.executeUpdate();
	}

	@Override
	public List<ForumBean> getAllContentsByChat() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ForumBean WHERE TAG='忙裡偷閒聊' order by date DESC";
		return session.createQuery(hql,ForumBean.class).getResultList();
	}

	@Override
	public List<ForumBean> getAllContentsByBox() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ForumBean WHERE TAG='開箱文' order by date DESC";
		return session.createQuery(hql,ForumBean.class).getResultList();
	}

	@Override
	public List<ForumBean> getAllContentsByOther() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ForumBean WHERE TAG='其他' order by date DESC";
		return session.createQuery(hql,ForumBean.class).getResultList();
	}

}
