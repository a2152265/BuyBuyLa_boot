package com.web.celebrations_36.service;


import com.web.celebrations_36.model.Point;

public interface PointService {
	
	public void addPointByUseremail(int point,String userEmail);
	
	Point findByUseremail(String useremail);
}
