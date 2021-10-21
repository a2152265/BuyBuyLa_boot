package com.infotran.springboot.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.CustomerRepository;
import com.infotran.springboot.model.CustomerBean;
import com.infotran.springboot.service.CustomerService;

@Repository
@Transactional
public class CustomerServiceImpl implements CustomerService {
	
	CustomerRepository customerRepository;
	

	@Autowired
	public CustomerServiceImpl(CustomerRepository customerRepository) {
		this.customerRepository = customerRepository;
	}





	@Override
	public Optional<CustomerBean> getCustomerById(int id) {
		// TODO Auto-generated method stub
		return customerRepository.findById(id);
	}

	@Override
	public List<CustomerBean> getCustomers() {
		// TODO Auto-generated method stub
		return customerRepository.findAll();
	}

	@Override
	public CustomerBean save(CustomerBean bean) {
		// TODO Auto-generated method stub
		return customerRepository.save(bean);
	}

	@Override
	public CustomerBean updateCustomer(CustomerBean bean) {
		// TODO Auto-generated method stub
		return customerRepository.save(bean);
	}

	@Override
	public void deleteCustomerByPrimaryKey(int key) {
		// TODO Auto-generated method stub
		 customerRepository.deleteById(key);
	}

}
