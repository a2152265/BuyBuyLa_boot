package com.web.forum_32.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.web.forum_32.dao.ForumLikeRepository;
import com.web.forum_32.dao.ForumRepository;
import com.web.forum_32.model.ForumBean;
import com.web.forum_32.model.ForumLikeBean;



@Service
public class ForumService implements IForumService {
	
	@Autowired
	ForumRepository forumRepository;
	@Autowired
	ForumLikeRepository forumLikeRepository;
	
	@Override
	public List<ForumBean> getAll() {
		return forumRepository.findByOrderById();
	}

	@Override
	public List<ForumBean> getAllArticlesByPage(int page, int size) {
        Page<ForumBean> pageResult = forumRepository.findAll(
                PageRequest.of(
                		page,size,Sort.by("topArticle").descending().and(Sort.by("id").descending()))); 
        pageResult.getNumberOfElements(); // 本頁筆數
        pageResult.getSize();             // 每頁筆數 
        pageResult.getTotalElements();    // 全部筆數
        pageResult.getTotalPages();       // 全部頁數
        List<ForumBean> articleList =  pageResult.getContent();
        return articleList;
	}
	@Override
	public List<ForumBean> getAllArticlesByHotByPage(int page, int size) {
        Page<ForumBean> pageResult = forumRepository.findAll(
                PageRequest.of(
                		page,size,Sort.by("topArticle").descending().and(Sort.by("likeQty").descending()))); 
        pageResult.getNumberOfElements(); // 本頁筆數
        pageResult.getSize();             // 每頁筆數 
        pageResult.getTotalElements();    // 全部筆數
        pageResult.getTotalPages();       // 全部頁數
        List<ForumBean> articleList =  pageResult.getContent();
        return articleList;
	}
	@Override
	public List<ForumBean> getAllByTag(
			String tag,int page, int size) {
		Page<ForumBean> pageResult = forumRepository.findByTagContaining(
				tag,
				PageRequest.of(page,  // 查詢的頁數，從0起算
						size, // 查詢的每頁筆數
						Sort.by("topArticle").descending().and(Sort.by("id").descending())
						)); // 依CREATE_TIME欄位降冪排序
		pageResult.getNumberOfElements(); // 本頁筆數
		pageResult.getSize();             // 每頁筆數 
		pageResult.getTotalElements();    // 全部筆數
		pageResult.getTotalPages();       // 全部頁數
		List<ForumBean> articleList =  pageResult.getContent();
		return articleList;
	}


	@Override
	public void addOrEdit(ForumBean content) {
		forumRepository.save(content);
	}
	
	@Override
	public ForumBean getContentById(Integer id) {
		return forumRepository.getById(id);
	}
	
	@Override
	public void delete(Integer id) {
		forumRepository.deleteById(id);
	}
	


	@Override
	public List<ForumBean> findUserNameContaining(String userName) {
		return forumRepository.findByUserNameContaining(userName);
	}

	@Override
	public List<ForumBean> getAllByTag(String tag) {
		return forumRepository.findByTag(tag);
	}


	@Override  // 熱門文章
	public List<ForumBean> findTop4ByOrderByViewQtyDesc() {
		return forumRepository.findTop4ByOrderByViewQtyDesc();
	}

	@Override  // 最新帖子
	public List<ForumBean> findTop4ByOrderByIdDesc() {
		return forumRepository.findTop4ByOrderByIdDesc();
	}

	@Override
	public void likeSave(ForumLikeBean flb) {
		forumLikeRepository.save(flb);
	}

	@Override
	public ForumLikeBean findAllByForumIdAndLoginUserName(Integer forumId,String loginUserName) {
		return forumLikeRepository.findByForumIdAndLoginUserName(forumId, loginUserName);
	}

	@Override
	public List<ForumLikeBean> findByForumIdAndStatus(Integer forumId,boolean status) {
		return forumLikeRepository.findByForumIdAndStatus(forumId,status);
	}





	
	

}
