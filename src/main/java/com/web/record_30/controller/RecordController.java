package com.web.record_30.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.record_30.model.RecordBean;
import com.web.record_30.service.IRecordService;


@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData" })
public class RecordController {
	
	IRecordService recordservice;

	@Autowired
	public RecordController(IRecordService recordservice) {
		
		this.recordservice = recordservice;
	}
	
	
	
	@GetMapping({"/user"})
	public String record(Model model) {
		System.out.println("************************");
		 return "record_30/user";
	}
	
	@GetMapping("/select")
    public String getAddNewMemberForm1(@ModelAttribute("RecordBean") RecordBean record ,Model model) {		
//		record.setBuyer("asd123");
		model.addAttribute("record",record);
        System.out.println("buyer= "+record.getBuyer());
		return "record_30/select";
    }

	
	@PostMapping("/select")
	public String list(@ModelAttribute("record") RecordBean record ,Model model) {
		String buyer= record.getBuyer();
		System.out.println("buyer2 =" +buyer);		
		List<RecordBean> list = recordservice.getAllRecords(buyer);
		model.addAttribute("select", list);
		return "record_30/select2";	
	}
	
	
	
	
	@GetMapping("/delete")
	public String delete(@ModelAttribute("delete") RecordBean record,Model model) {
//		model.addAttribute("delete",record);
		return "record_30/delete";
		
	}
	
	@PostMapping("/delete")
	public String delete2(@ModelAttribute("delete") RecordBean record ,Model model) {
		Integer rid= record.getRecord_id();
		System.out.println("rid2 =" +rid);	
		recordservice.deleteById(rid);
		return "record_30/delete2";
		
	}
	
	
	
	
	@GetMapping("/update30")
	public String update(@ModelAttribute("RecordBean") RecordBean record ,Model model ) {
		RecordBean recordBean =new RecordBean();
		model.addAttribute("update",record);
		recordBean.setRecord_id(20);;
		recordBean.setPid(2);
		recordBean.setPcount(100);
		System.out.println("rid = "+ recordBean.getRecord_id()+",pid = "+recordBean.getPid()+",cnt = "+recordBean.getPcount());
		return "record_30/update";
		
	}
	
	@PostMapping("/update30")
	public String update2(@ModelAttribute("update") RecordBean record ,Model model) {
		Integer record_id = record.getRecord_id();
		Integer pid = record.getPid();
		Integer pcount = record.getPcount();
		System.out.println("rid = "+ record_id+",pid = "+pid+",cnt = "+pcount);
		recordservice.update(record);
		return "record_30/update2";
		
	}

	
	

}
