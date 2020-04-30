package com.kh.yongdali.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.vo.Address;
import com.kh.yongdali.reservation.model.service.ReservationService;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService rService;

	/**
	 * 1. 예약페이지로 가기(가기전 주소록 list 불러오기)
	 * @return
	 */
	@RequestMapping("reservation.go")
	public ModelAndView goReservation(ModelAndView mv, HttpSession session) {
		String mno = ((Member)session.getAttribute("loginUser")).getmNo();
		
		ArrayList<Address> list = rService.getAddressList(mno);
		
		ArrayList<String> addrList1 = new ArrayList<String>();
		ArrayList<String> addrList2 = new ArrayList<String>();
		
		for(int i=0; i<list.size(); i++) {
			addrList1.add(list.get(i).getaAddress().split(",")[0]);
			addrList2.add(list.get(i).getaAddress().split(",")[1]);
		}
		
		mv.addObject("list",list);
		mv.addObject("addrList1",addrList1);
		mv.addObject("addrList2",addrList2);
		mv.setViewName("user/reservation");
		return mv;
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
											@RequestParam("startDate1") String stDate,
											@RequestParam("endDate1") String edDate,
											@RequestParam("capacity1") String capacity1) throws ParseException {
		
		// 차량크기, 거리, 결제금액 int로 변환하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (stDate != "") {
			Date startDate = new Date(sdf.parse(stDate).getTime());
			System.out.println(startDate);
			r.setStartDate(startDate);
		}

		if (edDate != "") {
			Date endDate = new Date(sdf.parse(edDate).getTime());
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
			mv.setViewName("redirect:myRSV.myp");
			
		} else {
			mv.addObject("msg","예약에 실패하셨습니다."); 
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 주소록 삭제(ajax)
	 * @param response
	 * @param aNo
	 */
	@RequestMapping("addrDele.do")
	@ResponseBody
	public String deleteAddr(String aNo) {
		
		System.out.println("aNo : " + aNo);
		
		int result = rService.deleteAddr(aNo);
		System.out.println("결과값 : " + result);
		
		if(result > 0) {
			return "ok";
		} else {
			return "fail";
		}
		
	}
	
	/**
	 * 주소록 수정(ajax)
	 * @param a
	 * @param addr1
	 * @param addr2
	 * @return
	 */
	@RequestMapping("addrModi.do")
	@ResponseBody
	public String modifyAddr(Address a, String addr1, String addr2) {
		
		a.setaAddress(addr1+","+addr2);
		
		System.out.println(a.getaNo());
		System.out.println(a.getaPlace());
		System.out.println(a.getaName());
		System.out.println(a.getaPhone());
		System.out.println(a.getaAddress());
		System.out.println(a.getaLatitude());
		System.out.println(a.getaLongitude());
		
		
		int result = rService.modifyAddr(a);
		
		if(result > 0) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	
	@RequestMapping(value="selectAddrList.do")
	public void selectAddrList(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		System.out.println("안녕4");
		// 인코딩
		response.setContentType("application/json; charset=UTF-8");
		String mno = ((Member)session.getAttribute("loginUser")).getmNo();
		ArrayList<Address> list = rService.getAddressList(mno);
		Map address = new HashMap();
		address.put("list",list);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(address,response.getWriter());
	}
}





















