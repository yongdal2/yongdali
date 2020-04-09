package com.kh.yongdali.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.reservation.model.service.ReservationService;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	
	@RequestMapping("reservation.go")
	public String goReservation() {
		return "user/reservation";
	}
	
	
	@RequestMapping("rev.do")
	public String InsertReservation(Reservation r) {
		
		int result = rService.insertReservation(r);
		
		if(result > 0) {
			return null;
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("reservation.go")
	public String goReservation() {
		
		return "user/reservation";
	}
}
