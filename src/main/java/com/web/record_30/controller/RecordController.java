package com.web.record_30.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.SessionAttributes;


import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
    public String getAddNewMemberForm1(@RequestParam Integer id,Model model) {		


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
	
	//查購物紀錄細項	
		@GetMapping("/selectbuyer")
	    public String selectBuyerInfo(@RequestParam String buyer,Model model) {		
			membershipInformationBean mb=new membershipInformationBean();
			mb=recordservice.getBuyerInfo(buyer);
			model.addAttribute("member",mb);
			System.out.println("======================================");		
			System.out.println(mb.getUserName()+","+mb.getUserGender()+","+mb.getUserPhone()+","+mb.getUserEmail());
			return "record_30/buyerInfo";
	    }

	
	
//	@GetMapping("/delete")
//	public String delete(@ModelAttribute("delete") RecordBean record,Model model) {
////		model.addAttribute("delete",record);
//		return "record_30/delete";
//		
//	}
	
		
//賣家刪掉單筆商品賣出紀錄
	@GetMapping("/delete")
	public String delete2(@RequestParam Integer rid,@RequestParam Integer pid ,Model model) {
		
	
		
		System.out.println("rid2 =" +rid);	
		recordservice.updateRecordListTotalPrice(rid, pid);
		recordservice.deleteRecord(rid,pid);
		List<RecordBean> list = recordservice.getAllRecord(rid);
		if(list.size()==0) {
			recordservice.deleteRecordListById(rid);
		}
		
		return "record_30/delete2";
		
	}
	
	
	

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
			@RequestParam("rid") Integer rid,
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
	
	@GetMapping("/updateRecordList")
	public String updateRecordList(@RequestParam Integer rid,Model model) {
		RecordList recordList = recordservice.getRecordByRid(rid);
		model.addAttribute("RecordList",recordList);

		return "record_30/manage/updateRecordList";
	}
	
	
	@PostMapping("/updateRecordList")
	public String updateRecordList(@ModelAttribute("RecordList") RecordList recordList,Model model) {
	
		int rid =recordList.getRecord_id();
		String buyer = recordList.getBuyer();
		double totalprice = recordList.getTotalprice();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		String now = dtf.format(LocalDateTime.now());
		recordList.setBuy_time(now);
		String buyeraddress = recordList.getBuyeraddress();
		String transport_status= recordList.getTransport_status();
		String pay_status= recordList.getPay_status();
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq");
		System.out.println(rid+","+buyer+","+totalprice+","+buyeraddress+","+now+","+transport_status+","+pay_status);
//		recordservice.update(rid, pid, transport_status);
//		System.out.println("rid = "+ rid+",pid = "+pid+"TS = "+transport_status+"+++++++++++++++++++++++");
		recordservice.updateRecordList(recordList);
//		return "record_30/manage/updateRecordList";
		return "record_30/manage/updateRecordSuccess";
		
	}
	
	
	@GetMapping("/deleteRecordList")
	public String deleteRecordList(@RequestParam Integer rid,Model model) {
		List<RecordList> recordList = recordservice.getAllMemberRecord();
		recordservice.deleteRecordList(rid);
		model.addAttribute("allreocrd", recordList);
		return "record_30/manage/deleteRecordSuccess";
	}

	

}
