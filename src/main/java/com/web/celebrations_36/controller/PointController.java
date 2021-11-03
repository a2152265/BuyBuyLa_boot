package com.web.celebrations_36.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.celebrations_36.service.PointService;
import com.web.member_25.model.membershipInformationBean;

@Controller
@SessionAttributes("loginSession")
public class PointController {
	
	PointService pointService;
	
	@Autowired
	public PointController(PointService pointService) {
	this.pointService = pointService;
}

	@GetMapping("/campaigns/login")
    public ResponseEntity<String> processUserCheckAction(@ModelAttribute("loginSession") membershipInformationBean loginMb){
		System.out.println("*****************"+loginMb.getUserEmail());
		if(loginMb.getUserEmail()!=null) {
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
    }
	
	@GetMapping("/campaigns/spinningwheel") // 路徑變數{category}
	public String spinningWheel(Model model) {
		return "celebrations_36/spinningwheel";
	}
	
	@GetMapping("/campaigns/insertPoint")
    public ResponseEntity<String> insertPoint(
    							@RequestParam ("point")String point,
    							@RequestParam ("userEmail")String userEmail
    			){
		int point1 =Integer.valueOf(point);
		pointService.addPointByUseremail(point1, userEmail);
		return new ResponseEntity<String>(HttpStatus.OK);
		
    }
	
}
