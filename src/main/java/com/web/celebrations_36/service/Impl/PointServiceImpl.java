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



	@Override
	public void minusPointByUseremail(Integer point, Integer point2, String userEmail) {
//		System.out.println(point);
//		System.out.println(point2);
//		System.out.println(pointRepository.findByUserEmail(userEmail).getPoint());
//		System.out.println(pointRepository.findByUserEmail(userEmail).getUsedpoint());
		point=(pointRepository.findByUserEmail(userEmail).getPoint())-point2;
		point2=(pointRepository.findByUserEmail(userEmail).getUsedpoint())+point2;
//		System.out.println(point);
//		System.out.println(point2);
		pointRepository.minus(point, point2, userEmail);
	}



	@Override
	public void save(Point point) {
		pointRepository.save(point);
		
	}



	
	
}
