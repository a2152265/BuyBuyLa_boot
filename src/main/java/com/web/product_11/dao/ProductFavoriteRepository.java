package com.web.product_11.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.product_11.model.ProductFavorite;

public interface ProductFavoriteRepository extends JpaRepository<ProductFavorite, Integer> {
	
	@Query("from ProductFavorite where fk_member_id=:memberId and fk_product_id=:productId ")
	ProductFavorite findByMidAndPid(Integer memberId,Integer productId);
}
