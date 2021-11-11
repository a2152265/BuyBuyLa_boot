package com.web.cart_30.service.impl;



import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.cart_30.dao.BuyerAddressRepository;
import com.web.cart_30.dao.CartRepository;
import com.web.cart_30.dao.RecordListRepository;
import com.web.cart_30.dao.RidCountRepository;
import com.web.cart_30.model.BuyerAddress;
import com.web.cart_30.model.Cart;

import com.web.cart_30.model.RidCount;
import com.web.cart_30.service.CartService;
import com.web.product_11.dao.ProductRepository;
import com.web.product_11.model.Product;
import com.web.record_30.dao.RecordRepository;
import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;




@Service
public class CartServiceImpl implements CartService {
	
	RecordRepository  recordRepository;
	CartRepository cartRepository;
	ProductRepository productRepository;
	RidCountRepository ridCountRepository;
	RecordListRepository recordListRepository;
	BuyerAddressRepository buyerAddressRepository;
	
	
	@Autowired
	public CartServiceImpl(RecordRepository recordRepository, CartRepository cartRepository,
			ProductRepository productRepository, RidCountRepository ridCountRepository,
			RecordListRepository recordListRepository,BuyerAddressRepository buyerAddressRepository) {
	
		this.recordRepository = recordRepository;
		this.cartRepository = cartRepository;
		this.productRepository = productRepository;
		this.ridCountRepository = ridCountRepository;
		this.recordListRepository = recordListRepository;
		this.buyerAddressRepository=buyerAddressRepository;
	}







	@Override
	public void addItemByid(int pid,String buyer) {
		System.out.println("serviceqqqqqqqqqqqqqqqqqqqqqqqqq");		
		Optional<Product> product = productRepository.findById(pid);
		Cart carta= cartRepository.existsByIdAndBuyer(pid,buyer);
		System.out.println(carta+"-------------------------------");
		if(carta!=null) {
			System.out.println("****************************");
			System.out.println(carta);
			Cart cart =cartRepository.findByPidAndBuyer(pid,buyer);
			int count = cart.getCount()+1;
			cartRepository.add(count,pid);
			
		}else {
			System.out.println("///////////////////////////");
			System.out.println(carta);
			Cart cart = new Cart(1,buyer,product.get(),0);				
			cartRepository.save(cart);
		}
		

	
	}






	@Override
	public int add(int pid,String buyer) {
		Cart cart= cartRepository.existsByIdAndBuyer(pid,buyer);
		int count = cart.getCount()+1;
		cartRepository.add(count,pid);
		
		return count;
		
	}



	@Override
	public void sub(int pid,String buyer) {
		Cart cart= cartRepository.existsByIdAndBuyer(pid,buyer);
		if(cart.getCount()>1) {
			int count = cart.getCount()-1;
			cartRepository.add(count,pid);
		}
		
		
	}



	@Override
	public void deletecart(int pid,String buyer) {
		cartRepository.deleteByPidAndBuyer(pid,buyer);
		
	}
//
//
	@Transactional
	@Override
	public List<Cart> addToRecord(String buyer) {

		List<Cart> cart =cartRepository.findAllByBuyer(buyer);
	
		return cart;
	
	}

	@Transactional
	@Override
	public void addToRecord2(RecordBean rb) {
			
		recordRepository.insert(
				rb.getRecord_id(),
				rb.getPid(),
				rb.getP_name(),
				rb.getP_price(),
				rb.getPcount(),
				rb.getBuyer(),
				rb.getSeller(),
				rb.getBuy_time(),
				rb.getTransport_status(),
				rb.getCategory(),
				rb.getBuyeraddress());

	}


	@Override
	public void deleteAll(String buyer) {
		cartRepository.deleteAllByBuyer(buyer);
		

		
	}




	@Transactional
	@Override
	public int getRidCount(int id) {

		RidCount rc=ridCountRepository.getById(1);
		
		System.out.println(rc+"************************************");
		
		return rc.getRidcount();
		
	}


	@Transactional
	@Override
	public void addRidCount() {
		RidCount rc =ridCountRepository.getById(1);
		int cnt = rc.getRidcount()+1;
		ridCountRepository.add(cnt,1);
		
	}




	@Override
	public void addToRecordList(RecordList rl) {
		recordListRepository.save(rl);
	}







	@Override
	public void insertAddress(BuyerAddress address) {
		buyerAddressRepository.save(address);
		
	}





	@Override
	public List<BuyerAddress> selectAllBuyerAddressByBuyer(String buyer) {
		
		return buyerAddressRepository.selectAllBuyerAddressByBuyer(buyer);
	}






	@Transactional
	@Override
	public void deleteAddress(int aid) {
		buyerAddressRepository.deleteById(aid);		
	}






	//賣出時扣庫存數量
	@Override
	public void updateStock(int pid, int count) {
		productRepository.updateStock(pid,count);
		
	}






//抓折扣碼
	@Override
	public int getDiscount(String discountCode) {
//		return discount;
		return 0;
	}






//把折扣價進資料庫
@Override
public void addDiscountToCart(int discount,String buyer) {
	cartRepository.addDiscountToCart(discount,buyer);
	
}






//判斷是否重複使用折扣
@Override
public boolean discountRepeat(String buyer) {
	 List<Cart> cc =cartRepository.discountRepeat(buyer);
	 System.out.println(cc.size()+"cccccccccccccc");
	 if(cc.size()>0) {
		 return true;
	 }
	return false;
}











}
