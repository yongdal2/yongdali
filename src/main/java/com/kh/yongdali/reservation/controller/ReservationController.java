package com.kh.yongdali.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.vo.Address;
import com.kh.yongdali.reservation.model.service.ReservationService;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService rService;

	/**
	 * 1. 예약페이지로 가기
	 * @return
	 */
	@RequestMapping("reservation.go")
	public String goReservation(HttpSession session) {
		String mno = ((Member)session.getAttribute("loginUser")).getmNo();	
		ArrayList<Address> list = rService.getAddressList(mno);
		System.out.println(list.toString());
		
		return "user/reservation";
	}

	/**
	 * 2. 예약페이지 > 결제페이지
	 * @param r
	 * @param mv
	 * @param stDate1
	 * @param edDate1
	 * @param capacity1
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("rev.do")
	public ModelAndView InsertReservation1(@ModelAttribute Reservation r, ModelAndView mv,
			@RequestParam(value = "startDate1", required = false) String stDate1,
			@RequestParam(value = "endDate1", required = false) String edDate1,
			@RequestParam("capacity1") String capacity1) throws ParseException {

		String stDate = "";
		String edDate = "";
		// 상하차일 타입 Date로 변환하기
		if (stDate1 != null) {
			String sy = stDate1.substring(0, 4);
			String sm = stDate1.substring(6, 8);
			String sd = stDate1.substring(10, 12);
			stDate = sy + "-" + sm + "-" + sd;
			System.out.println(stDate);
//			r.setStartDate(startDate);
		}
		if (edDate1 != null) {
			String ey = edDate1.substring(0, 4);
			String em = edDate1.substring(6, 8);
			String ed = edDate1.substring(10, 12);
			edDate = ey + "-" + em + "-" + ed;
			System.out.println(edDate);
//			r.setEndDate(endDate);
		}

		System.out.println("차사이즈1 : " + capacity1);
		System.out.println("차 옵션 : " + r.getType());
		mv.addObject("capacity1", capacity1);
		mv.addObject("stDate", stDate);
		mv.addObject("edDate", edDate);
		mv.addObject("r", r);
		mv.setViewName("user/paying");
		return mv;
	}

	/**
	 * 3.결제페이지 > DB
	 * @param mv
	 * @param r
	 * @param session
	 * @param stDate
	 * @param edDate
	 * @param capacity1
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("pay.do")
	public ModelAndView InsertReservation2(ModelAndView mv, Reservation r, HttpSession session,
			@RequestParam("startDate1") String stDate, @RequestParam("endDate1") String edDate,
			@RequestParam("capacity1") String capacity1) throws ParseException {
		
		// 차량크기, 거리, 결제금액 int로 변환하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (stDate != "") {
			Date startDate = sdf.parse(stDate);
			System.out.println(startDate);
			r.setStartDate(startDate);
		}

		if (edDate != "") {
			Date endDate = sdf.parse(edDate);
			System.out.println(endDate);
			r.setEndDate(endDate);
		}

		float capacity = Float.parseFloat(capacity1);
		r.setCapacity(capacity);
		
		System.out.println("차사이즈2 : " + capacity);

		// 세션에 저장되어있는 loginUser의 mId 불러오기
		r.setrMNo(((Member)session.getAttribute("loginUser")).getmNo());
		System.out.println(r.getrMNo());
		int result = rService.insertReservation(r);
		
		if(result > 0) {
			mv.setViewName("user/paySuccess");			
		} else {
			mv.setViewName("common/error");
		}
		
		return mv;
	}

}
