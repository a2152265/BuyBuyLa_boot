package com.web.cart_30.service.impl;


import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	public void addItemByid(int pid,boolean exists,String buyer) {
		System.out.println("serviceqqqqqqqqqqqqqqqqqqqqqqqqq");		
		Optional<Product> product = productRepository.findById(pid);
		List<Cart> carta= cartRepository.existsByIdAndBuyer(pid,buyer);
		if(carta.size()!=0) {
			System.out.println("****************************");
			System.out.println(carta);
			exists =true;
		}else {
			System.out.println("****************************");
			System.out.println(carta);
			exists=false;
		}
		
		System.out.println("serviceqqqqqqqqqqqqqqqqqqqqqqqqq"+exists);	
		
		
		if(exists!=true) {
			Cart cart = new Cart(
					product.get().getProductId(),
					product.get().getProductName(),
					product.get().getPrice(),
					1,
					buyer,
					product.get().getSerller(),
					product.get().getCoverImage());
			cartRepository.save(cart);
		}else if(exists==true){
			Optional<Cart> cart =cartRepository.findById(pid);
			int count = cart.get().getCount()+1;
			cartRepository.add(count,pid);
		}

	}






	@Override
	public void add(int pid) {
		Optional<Cart> cart =cartRepository.findById(pid);
		int count = cart.get().getCount()+1;
		cartRepository.add(count,pid);
		
	}



	@Override
	public void sub(int pid) {
		Optional<Cart> cart =cartRepository.findById(pid);
		if(cart.get().getCount()>1) {
			int count = cart.get().getCount()-1;
			cartRepository.add(count,pid);
		}
		
		
	}



	@Override
	public void deletecart(int pid) {
		cartRepository.deleteById(pid);
		
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
				rb.getTransport_status());
		
	}

	@Transactional
	@Override
	public void deleteAll() {
		cartRepository.deleteAll();
		
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











}
