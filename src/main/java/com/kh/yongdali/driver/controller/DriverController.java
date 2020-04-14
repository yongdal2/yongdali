package com.kh.yongdali.driver.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.yongdali.driver.model.service.DriverService;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Controller
public class DriverController {
	
	@Autowired
	DriverService dService;
	
	@RequestMapping("driverMain.ydl")
	public String driverMainView() {
		return "driver/driverMain";
	}
	@RequestMapping("drivercal.ydl")
	public String driverCalView() {
		return "driver/drivercal";
	}
	@RequestMapping("2yong.ydl")
	public String driver2YongView() {
		return "/driver/2yong";
	}
	@RequestMapping("test.do")
	public String test2() {
		return "/driver/test";
	}
	
	@RequestMapping("mibaechar.do")
	public void mibaechar(HttpServletResponse response,String mNO) throws JsonIOException, IOException {
		ArrayList<Reservation> list = dService.mibaechar(mNO);
		System.out.println(list);
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	
	@RequestMapping("baechar.do")
	public void myBaechar(HttpServletResponse response,int dId) throws JsonIOException, IOException {
		ArrayList<Reservation> list = dService.myBaechar(dId);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	
	@RequestMapping("dCal.do")
	public void driverCal(HttpServletResponse response,String mNo) throws JsonIOException, IOException {
		ArrayList<Reservation> list = dService.driverCal(mNo);
		System.out.println(list);
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	
	@RequestMapping("dModal.do")
	public void driverModal(HttpServletResponse response,String rNo) throws JsonIOException, IOException {
		ArrayList<Reservation> list = dService.driverModal(rNo);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	
	@RequestMapping("Deal.do")
	public String mainDeal(HttpServletRequest request) {
		String mNo =request.getParameter("mNo");
		String rNo = request.getParameter("rNo");
		
		int result = Deal(mNo,rNo);
		
		if(result>0) {
			return "redirect:driverMain.ydl";
		}else {
			return "common/errorPage";
		}
	}
	
	public int Deal(String mNo, String rNo) {
		Reservation aa = new Reservation(rNo,mNo);
		
		int result = dService.Deal(aa);
		
		
		return result;
	}
	
	/*
	 * @RequestMapping("getB.do") public String getBaechar(Reservation
	 * re,HttpServletRequest request) { int dId =
	 * request.getAttribute("loginUser").getUserId(); int result =
	 * dService.getBaechar(dId);
	 * 
	 * if(result>0) { return "redirect:driverMain.ydl"; }else { return
	 * "common/errorPage"; } }
	 */
	
	 
}




