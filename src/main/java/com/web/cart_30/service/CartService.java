package com.web.cart_30.service;

import java.util.List;

import com.web.cart_30.model.BuyerAddress;
import com.web.cart_30.model.Cart;
import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;




public interface CartService {
	
	//首頁加入購物車
	public void addItemByid(int pid,String buyer);
	//單向商品加入購物車
	public void addItemByidAndQty(int pid,String buyer,int qty);
	
	public int add(int pid,String buyer);
	public void sub(int pid,String buyer);
	public void deletecart(int pid,String buyer);
	public  List<Cart> addToRecord(String buyer);
	public void addToRecord2(RecordBean rb);


	
	
	public void deleteAll(String buyer);
	
	public void addToRecordList(RecordList rl); 
	public void insertAddress(BuyerAddress address);
	
	//折扣
	public int getDiscount(String discountCode);
	public void addDiscountToCart(int discount,String buyer);
	public boolean discountRepeat(String buyer);
	
	
	//賣出時扣庫存數量
	public void updateStock(int pid,int count);
	
	//用記錄ID查該筆紀錄資料
	public RecordList findRecordByRecordId(String rid);
	
	
	
	//地址管理
	public List<BuyerAddress> selectAllBuyerAddressByBuyer(String buyer);
	public void deleteAddress(int aid);
}