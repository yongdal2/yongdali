package com.kh.yongdali.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.yongdali.reservation.model.service.ReservationService;
import com.kh.yongdali.reservation.model.vo.Reservation;

@SessionAttributes("loginUser")
@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	
	@RequestMapping("reservation.go")
	public String goReservation() {
		return "user/reservation";
	}
	
	@RequestMapping("paying.do")
	public String goPaying() {
		return "user/paying";
	}
	
	
	@RequestMapping("rev.do")
	public String InsertReservation(@ModelAttribute Reservation r, Model model,
									@RequestParam(value="startDate1", required=false) String stDate1,
									@RequestParam(value="endDate1", required=false) String edDate1) throws ParseException {
		
		// 차량크기, 거리, 결제금액 int로 변환하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String stDate = "";
		String edDate = "";
		// 상하차일 타입 Date로 변환하기
		if(stDate1 != null) {
			String sy = stDate1.substring(0,3);
			String sm = stDate1.substring(6,7);
			String sd = stDate1.substring(10,11);
			stDate = sy+"-"+sm+"-"+sd+" ";			
			Date startDate = sdf.parse(stDate);
			r.setStartDate(startDate);
		}
		if(edDate1 != null) {
			String ey = edDate1.substring(0,3);
			String em = edDate1.substring(6,7);
			String ed = edDate1.substring(10,11);
			edDate = ey+"-"+em+"-"+ed+" ";
			Date endDate = sdf.parse(edDate);
			r.setEndDate(endDate);
		}
		
		
		System.out.println(r);
		
		String result = rService.insertReservation(r);
		if(result.length() > 0) {
			System.out.println("성공했습니다.");
			return "common/errorPage";
		}else {
			return "common/errorPage";
		}
	}
}
