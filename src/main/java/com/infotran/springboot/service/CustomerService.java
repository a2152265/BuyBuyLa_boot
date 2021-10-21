package com.infotran.springboot.service;

import java.util.List;
import java.util.Optional;

import com.infotran.springboot.model.CustomerBean;

public interface CustomerService {
	Optional<CustomerBean> getCustomerById(int id);
	
//	Optional<CustomerBean> findById(Integer id);

	List<CustomerBean> getCustomers();

	CustomerBean save(CustomerBean bean);
	
	CustomerBean updateCustomer(CustomerBean bean); 

	void deleteCustomerByPrimaryKey(int key);
	
}
