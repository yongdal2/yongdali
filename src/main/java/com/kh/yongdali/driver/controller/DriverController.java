package com.kh.yongdali.driver.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.common.Pagination;
import com.kh.yongdali.driver.model.service.DriverService;
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
	
	@RequestMapping(value="baeDetail.do")
	public ModelAndView boardList(ModelAndView mv,String mNo
			, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		int pageLimit = 15;
		int boardLimit = 5;
		System.out.println(mNo);
		int listCount = dService.getListCount(mNo);
		
		System.out.println("listCount : " + listCount);
	
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount,pageLimit,boardLimit);
		
		ArrayList<Reservation> list = dService.selectList(mNo,pi);
		
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("/driver/driverDetail");
		
		return mv;
	}
	@RequestMapping(value="myDetail.do")
	public ModelAndView myDetail(ModelAndView mv,String mNo
			, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		int pageLimit = 15;
		int boardLimit = 5;
		System.out.println(mNo);
		int listCount = dService.getMyCount(mNo);
		
		System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount,pageLimit,boardLimit);
		
		ArrayList<Reservation> list = dService.myDetail(mNo,pi);
		
		System.out.println(list);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("/driver/myDetail");
		
		return mv;
	}
	
	
	@RequestMapping("mibaechar.do")
	public void mibaechar(HttpServletResponse response,String mNO) throws JsonIOException, IOException {
		ArrayList<Reservation> list = dService.mibaechar(mNO);
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	
	@RequestMapping("mybaechar.do")
	public void myBaechar(HttpServletResponse response,String mNo) throws JsonIOException, IOException {
		ArrayList<Reservation> list = dService.myBaechar(mNo);
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	
	@RequestMapping("dCal.do")
	public void driverCal(HttpServletResponse response,String mNo) throws JsonIOException, IOException {
		ArrayList<Reservation> list = dService.driverCal(mNo);
		
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
	public String mainDeal(HttpServletRequest request,String mNo,@RequestParam("rNo")String rNo) {

		
		System.out.println(mNo+' '+rNo);
		int result = Deal(mNo,rNo);
		
		if(result>0) {
			//나의 예약페이지로 이동
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
	
	@RequestMapping("cancel.do")
	public String cancel (HttpServletRequest request) {
		String mNo =request.getParameter("mNo");
		String rNo = request.getParameter("rNo");
		
		int result = Cancel(mNo,rNo);
		
		if(result>0) {
			return "redirect:driverMain.ydl";
		}else {
			return "common/errorPage";
		}
	}
	
	
	public int Cancel(String mNo, String rNo) {
		Reservation aa = new Reservation(rNo,mNo);
		
		int result = dService.cancel(aa);
		
		
		return result;
	}
	
	 
}




