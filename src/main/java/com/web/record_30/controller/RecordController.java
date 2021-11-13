package com.web.record_30.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.SessionAttributes;


import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.cart_30.model.BuyerAddress;
import com.web.member_25.model.membershipInformationBean;

import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;
import com.web.record_30.service.IRecordService;


@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData" })
public class RecordController {
	
	IRecordService recordservice;

	@Autowired
	public RecordController(IRecordService recordservice) {
		
		this.recordservice = recordservice;
	}
	
	
	

//查購物紀錄細項	
	@GetMapping("/select")
    public String getAddNewMemberForm1(@RequestParam String id,Model model) {		


		System.out.println("buyer2 =" +id);		
		List<RecordBean> list = recordservice.getAllRecord(id);
		model.addAttribute("select", list);

		return "record_30/select2";
    }

//查詢購物紀錄	
	@GetMapping("/selectLsit")
	public String list(@ModelAttribute("loginSession") membershipInformationBean mb ,Model model) {
//		String buyer= record.getBuyer();
		String account = mb.getUserEmail();
		System.out.println("buyer2 =" +account);		
		List<RecordList> list = recordservice.getAllRecordList(account);
		model.addAttribute("selectlist", list);
		return "record_30/select";	
	}
	
	
	
	//買家退款
			@GetMapping("/refund")
			public String refund(@RequestParam String id,Model model) {
				recordservice.refundByBuyer(id);
				return "redirect:/selectLsit";
			}
	
	//查買家資料	
		@GetMapping("/selectbuyer")
	    public String selectBuyerInfo(@RequestParam String rid,Model model) {		
			BuyerAddress buyerAddress =new BuyerAddress();
			buyerAddress = recordservice.getBuyerInfo(rid);
			System.out.println("======================================");
			System.out.println(buyerAddress.getRecord_id());
			model.addAttribute("BuyerAddress",buyerAddress);
			System.out.println("8888888888");		
//			System.out.println(buyerAddress.getUserName()+","+mb.getUserGender()+","+mb.getUserPhone()+","+mb.getUserEmail());
			return "record_30/manage/buyerInfo";
	    }

		

	
//	@GetMapping("/delete")
//	public String delete(@ModelAttribute("delete") RecordBean record,Model model) {
////		model.addAttribute("delete",record);
//		return "record_30/delete";
//		
//	}
	
		
//賣家刪掉單筆商品賣出紀錄
	@GetMapping("/delete")
	public String delete2(@RequestParam String rid,@RequestParam Integer pid ,Model model) {
		
	
		
		System.out.println("rid2 =" +rid);	
		recordservice.updateRecordListTotalPrice(rid, pid);
		recordservice.deleteRecord(rid,pid);
		List<RecordBean> list = recordservice.getAllRecord(rid);
		if(list.size()==0) {
			recordservice.deleteRecordListById(rid);
		}
		
		return "record_30/delete2";
		
	}
	
	
	
//到管理紀錄頁面
	@GetMapping("/update30")
	public String update(@ModelAttribute("loginSession") membershipInformationBean mb,@ModelAttribute("updatebean") RecordBean record ,Model model ) {
		RecordBean recordBean =new RecordBean();
		model.addAttribute("update",record);
		
		String account = mb.getUserEmail();
		System.out.println("buyer2 =" +account);		
		List<RecordBean> list = recordservice.getAllSellerRecords(account);
		
		model.addAttribute("updateRecord", list);
        System.out.println("buyer= "+record.getPid());
        
		return "record_30/update";
		
	}
//	
//	@PostMapping("/update30")
//	public String update2(@ModelAttribute("updatebean") RecordBean record,Model model) {
//		int pid =record.getPid();
//		int rid =record.getRecord_id();
//		String transport_status= record.getTransport_status();
//		recordservice.update(rid, pid, transport_status);
//		System.out.println("rid = "+ rid+",pid = "+pid+"TS = "+transport_status+"+++++++++++++++++++++++");
//		
//		return "record_30/update2";
//		
//	}
	
	//賣家更改單筆商品出貨狀態
	@GetMapping("/updatevalue30")
	public String updatestatus(@ModelAttribute("loginSession") membershipInformationBean mb,
			@RequestParam("rid") String rid,
			@RequestParam("pid") Integer pid,
			@RequestParam("ts") String ts,
			Model model ) {
		RecordBean recordBean =new RecordBean();
//		model.addAttribute("update",record);
		recordservice.update(rid, pid, ts);
		String account = mb.getUserEmail();
		System.out.println("buyer2 =" +account);		
		List<RecordBean> list = recordservice.getAllSellerRecords(account);
		
		model.addAttribute("updateRecord", list);
//        System.out.println("buyer= "+record.getPid());
	
		return "record_30/update2";
		
	}
	

	
////////////////////////////////////////////////////////////
	
//以下為管理者功能
	
	//到紀錄管理頁面
	@GetMapping("/recordManage")
	public String recordManage(Model model) {
		List<RecordList> recordList = recordservice.getAllMemberRecord();

		model.addAttribute("allreocrd", recordList);
		return "record_30/manage/recordManage";
	}
	
	
	//更新購物資料
	@GetMapping("/updateRecordList")
	public String updateRecordList(@RequestParam String rid,Model model) {
		RecordList recordList = recordservice.getRecordByRid(rid);
		model.addAttribute("RecordList",recordList);

		return "record_30/manage/updateRecordList2";
	}
	
	@Autowired
	JavaMailSender mailSender;
	
	//更新購物資料
	@PostMapping("/updateRecordList")
	public String updateRecordList(@ModelAttribute("RecordList") RecordList recordList,Model model) {
	
		String rid =recordList.getRecord_id();
		String buyer = recordList.getBuyer();
		double totalprice = recordList.getTotalprice();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		String now = dtf.format(LocalDateTime.now());
		String buytime =recordList.getBuy_time();
		String buyeraddress = recordList.getBuyeraddress();
		String transport_status= recordList.getTransport_status();
		String pay_status= recordList.getPay_status();
		recordList.setLast_update_time(now);
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq");
		System.out.println(rid+","+buyer+","+totalprice+","+buyeraddress+","+buytime+","+pay_status+","+transport_status);
//		recordservice.update(rid, pid, transport_status);
//		System.out.println("rid = "+ rid+",pid = "+pid+"TS = "+transport_status+"+++++++++++++++++++++++");
		recordservice.updateRecordList(recordList);
//		return "record_30/manage/updateRecordList";
	
		
		String buyTime = recordList.getBuy_time();

		
		SimpleMailMessage message =new SimpleMailMessage();
		message.setTo(buyer);
		message.setSubject("BuyBuyLa Verification 最懂你的購物商城");
		message.setText("您已於"+buyTime+"，完成訂單編號為"+rid+"之交易，現在"+transport_status+"\n"
		+"謝謝您的惠顧，祝您有愉快的一天 :)");
		
		mailSender.send(message); 
		System.out.println("------------------已寄出------------------ --->");
		
		return "record_30/manage/updateRecordSuccess";
		
	}
	
//刪除時，會刪訂單跟該訂單的細項	
	@GetMapping("/deleteRecordList")
	public String deleteRecordList(@RequestParam String rid,Model model) {
		List<RecordList> recordList = recordservice.getAllMemberRecord();
		recordservice.deleteRecordList(rid);
		recordservice.deleteAddress(rid);
		recordservice.deleteAllRecordByRid(rid);
		model.addAttribute("allreocrd", recordList);
		return "record_30/manage/deleteRecordSuccess";
	}

	//分析圖
	@GetMapping("/recordanalyze")
	public String recordanalyze(Model model) {
		Double female = recordservice.findFemaleRecord();
		Double male = recordservice.findMaleRecord();
		Double pet = recordservice.findPetRecord();
		Double fit = recordservice.findFitRecord();
		Double other = recordservice.findOtherRecord();
		System.out.println("00000000000000000000000000000000000");
		System.out.println(female+","+male+","+pet+","+fit+","+other);
		model.addAttribute("female",female);
		model.addAttribute("male",male);
		model.addAttribute("pet",pet);
		model.addAttribute("fit",fit);
		model.addAttribute("other",other);
			return "record_30/manage/recordAnalyze";
	}
	//退款畫面
	@GetMapping("/refundManage")
	public String refundManage(Model model) {
		List<RecordList> recordList = recordservice.getAllRefundRecord();

		model.addAttribute("allRefund", recordList);
		
		return "record_30/manage/refundManage";
	}
	
	//確定退款
	@GetMapping("/refundRecord")
	public String refundRecord(@RequestParam String rid,@RequestParam String buyer,Model model) {
		List<RecordList> recordList = recordservice.getAllRefundRecord();
		recordservice.deleteRecordList(rid);
		recordservice.deleteAddress(rid);
		recordservice.deleteAllRecordByRid(rid);
		SimpleMailMessage message =new SimpleMailMessage();
		message.setTo(buyer);
		message.setSubject("BuyBuyLa Verification 最懂你的購物商城");
		message.setText("您訂單編號為"+rid+"之交易，已退款成功\n"
		+"謝謝您的惠顧，祝您有愉快的一天 :)");
		
		mailSender.send(message); 
		model.addAttribute("allRefund", recordList);
		return "record_30/manage/refundSuccess";
	}
	
	//駁回退款
		@GetMapping("/refundRefuse")
		public String refundRefuse(@RequestParam String rid,Model model) {
			List<RecordList> recordList = recordservice.getAllRefundRecord();
			recordservice.refundRefuse(rid);
			model.addAttribute("allRefund", recordList);
			return "record_30/manage/refuseSuccess";
		}
		
	
	
}
