package com.kh.yongdali.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("rev.do")
	public ModelAndView InsertReservation1(@ModelAttribute Reservation r, ModelAndView mv,
									@RequestParam(value="startDate1", required=false) String stDate1,
									@RequestParam(value="endDate1", required=false) String edDate1) throws ParseException {
		String stDate = "";
		String edDate = "";
		// 상하차일 타입 Date로 변환하기
		if(stDate1 != null) {
			String sy = stDate1.substring(0,4);
			String sm = stDate1.substring(6,8);
			String sd = stDate1.substring(10,12);
			stDate = sy+"-"+sm+"-"+sd;
			System.out.println(stDate);
//			r.setStartDate(startDate);
		}
		if(edDate1 != null) {
			String ey = edDate1.substring(0,4);
			String em = edDate1.substring(6,8);
			String ed = edDate1.substring(10,12);
			edDate = ey+"-"+em+"-"+ed;
			System.out.println(edDate);
//			r.setEndDate(endDate);
		}
		mv.addObject("stDate", stDate);
		mv.addObject("edDate", edDate);
		mv.addObject("r", r);
		mv.setViewName("user/paying");
		return mv;
	}
	
	@RequestMapping("pay.do")
	public ModelAndView InsertReservation2(ModelAndView mv, Reservation r,
									  @RequestParam("startDate1") String stDate,
									  @RequestParam("endDate1") String edDate) throws ParseException {
		// 차량크기, 거리, 결제금액 int로 변환하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(stDate != "") {
			Date startDate = sdf.parse(stDate);
			System.out.println(startDate);
			r.setStartDate(startDate);
		}
		
		if(edDate != "") {
			Date endDate = sdf.parse(edDate);
			System.out.println(endDate);
			r.setEndDate(endDate);
		}
		
		int result = rService.insertReservation(r);
		
		mv.setViewName("user/paySuccess");
		return mv;
	}

}
