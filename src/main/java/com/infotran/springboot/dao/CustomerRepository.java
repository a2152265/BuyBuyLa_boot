package com.infotran.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infotran.springboot.model.CustomerBean;

public interface CustomerRepository 
		extends JpaRepository<CustomerBean, Integer> {
	
	

}
