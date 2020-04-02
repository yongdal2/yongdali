package com.kh.yongdali.driver.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.yongdali.driver.model.service.DriverService;
import com.kh.yongdali.driver.model.vo.Reservation;

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
	
	@RequestMapping("mibaechar.do")
	public void mibaechar(HttpServletResponse response,int dId) throws JsonIOException, IOException {
		ArrayList<Reservation> list = dService.mibaechar(dId);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	
	 
}
