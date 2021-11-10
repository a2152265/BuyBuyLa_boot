package com.web.cart_30.service;

import java.util.List;

import com.web.cart_30.model.BuyerAddress;
import com.web.cart_30.model.Cart;
import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;




public interface CartService {
	public void addItemByid(int pid,String buyer);
	public int add(int pid,String buyer);
	public void sub(int pid,String buyer);
	public void deletecart(int pid,String buyer);
	public  List<Cart> addToRecord(String buyer);
	public void addToRecord2(RecordBean rb);
	public int getRidCount(int id);
	public void addRidCount();
	
	public void deleteAll(String buyer);
	
	public void addToRecordList(RecordList rl); 
	public void insertAddress(BuyerAddress address);
	
	//折扣
	public int getDiscount(String discountCode);
	public void addDiscountToCart(int discount,String buyer);
	public boolean discountRepeat(String buyer);
	
	
	//賣出時扣庫存數量
	public void updateStock(int pid,int count);
	
	//地址管理
	public List<BuyerAddress> selectAllBuyerAddressByBuyer(String buyer);
	public void deleteAddress(int aid);
}