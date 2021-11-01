package com.web.forum_32.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.web.forum_32.dao.ForumRepository;
import com.web.forum_32.model.ForumBean;



@Service
public class ForumService implements IForumService {
	
	@Autowired
	ForumRepository forumRepository;
	
	@Override
	public List<ForumBean> getAllTopArticles() {
		return forumRepository.findByTopArticleLikeOrderByIdDesc("置頂");
	}
	
	@Override
	public List<ForumBean> getAllArticles() {
		return forumRepository.findByTopArticleLikeOrderByIdDesc("general");
	}
	
	@Override
	public List<ForumBean> getPagedArticles(int page, int size) {
        Page<ForumBean> pageResult = forumRepository.findAll(
                PageRequest.of(page,  // 查詢的頁數，從0起算
                                size, // 查詢的每頁筆數
                                Sort.by("id").descending())); // 依CREATE_TIME欄位降冪排序
        
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
	public Optional<ForumBean> findContentById(Integer id) {
		return forumRepository.findById(id);
	}

	@Override
	public List<ForumBean> getAllContentsByAnnouncement() {
		return forumRepository.findByTagLikeOrderById("官方最新公告");
	}

	@Override
	public List<ForumBean> getAllContentsByNoviceSeller() {
		return forumRepository.findByTagLikeOrderById("新手賣家發問");
	}

	@Override
	public List<ForumBean> getAllContentsBySellerChat() {
		return forumRepository.findByTagLikeOrderById("賣家閒聊討論");
	}





	
	

}
