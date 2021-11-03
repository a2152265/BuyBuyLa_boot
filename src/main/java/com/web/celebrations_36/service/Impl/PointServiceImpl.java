package com.web.celebrations_36.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.celebrations_36.dao.PointRepository;
import com.web.celebrations_36.model.Point;
import com.web.celebrations_36.service.PointService;

@Service
public class PointServiceImpl implements PointService {

	PointRepository pointRepository;
	

	@Autowired
	public PointServiceImpl(PointRepository pointRepository) {
		this.pointRepository = pointRepository;
	}



	@Override
	public void addPointByUseremail(int point, String userEmail) {
		 if((pointRepository.findByUserEmail(userEmail))!=null) {
			int point1=point+ pointRepository.findByUserEmail(userEmail).getPoint();
			pointRepository.add(point1, userEmail);
			System.out.println("saaaaaaaaaasasasasassa"+point);
			System.out.println("saaaaaaaaaasasasasassa"+userEmail);
		 }else {
			int usedpoint=0;
			Point point2 = new Point(userEmail,point,usedpoint);
			pointRepository.save(point2);
		}
	}



	@Override
	public Point findByUseremail(String useremail) {
		
		return pointRepository.findByUserEmail(useremail);
	}

	
}
