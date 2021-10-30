package com.web.record_30.controller;

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
	
	
	

	
	@GetMapping("/select")
    public String getAddNewMemberForm1(@RequestParam Integer id,Model model) {		


		System.out.println("buyer2 =" +id);		
		List<RecordBean> list = recordservice.getAllRecord(id);
		model.addAttribute("select", list);

		return "record_30/select2";
    }

	
	@GetMapping("/selectLsit")
	public String list(@ModelAttribute("loginSession") membershipInformationBean mb ,Model model) {
//		String buyer= record.getBuyer();
		String account = mb.getUserEmail();
		System.out.println("buyer2 =" +account);		
		List<RecordList> list = recordservice.getAllRecordList(account);
		model.addAttribute("selectlist", list);
		return "record_30/select";	
	}
	
	
	
	
//	@GetMapping("/delete")
//	public String delete(@ModelAttribute("delete") RecordBean record,Model model) {
////		model.addAttribute("delete",record);
//		return "record_30/delete";
//		
//	}
	
	@GetMapping("/delete")
	public String delete2(@RequestParam Integer rid,@RequestParam Integer pid ,Model model) {

		System.out.println("rid2 =" +rid);	
		recordservice.deleteRecord(rid,pid);
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
        
//		recordBean.setRecord_id(20);;
//		recordBean.setPid(2);
//		recordBean.setPcount(100);
//		System.out.println("rid = "+ recordBean.getRecord_id()+",pid = "+recordBean.getPid()+",cnt = "+recordBean.getPcount());
		return "record_30/update";
		
	}
	
	@PostMapping("/update30")
	public String update2(@ModelAttribute("updatebean") RecordBean record,Model model) {
		int pid =record.getPid();
		int rid =record.getRecord_id();
		String transport_status= record.getTransport_status();
		recordservice.update(rid, pid, transport_status);
		System.out.println("rid = "+ rid+",pid = "+pid+"TS = "+transport_status+"+++++++++++++++++++++++");
		
		return "record_30/update2";
		
	}
	
	@GetMapping("/selectBydate")
	public String selectBydate() {
		return "record_30/user";
	}
	
	

}
