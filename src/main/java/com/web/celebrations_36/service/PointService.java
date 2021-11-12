package com.web.celebrations_36.service;


import com.web.celebrations_36.model.Point;

public interface PointService {
	
	public void addPointByUseremail(int point,String userEmail);
	public void minusPointByUseremail(Integer point,Integer point2,String userEmail);

	void save(Point point);
	Point findByUseremail(String useremail);
}
