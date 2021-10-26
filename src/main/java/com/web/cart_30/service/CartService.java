package com.web.cart_30.service;

import java.util.List;

import com.web.cart_30.model.Cart;
import com.web.record_30.model.RecordBean;




public interface CartService {
	public void addItemByid(int pid,boolean exists);
//	public  List<Cart> cartList();
	public void add(int pid);
	public void sub(int pid);
	public void deletecart(int pid);
	public  List<Cart> addToRecord();
	public void addToRecord2(RecordBean rb);
	public int getRidCount(int id);
	public void addRidCount();
	public void deleteAll();
	
}