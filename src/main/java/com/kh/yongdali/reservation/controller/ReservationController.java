package com.kh.yongdali.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	@RequestMapping("rev.do")
	public String InsertReservation() {
		
		
		return null;
	}
	
	@RequestMapping("reservation.go")
	public String goReservation() {
		
		return "user/reservation";
	}
}
