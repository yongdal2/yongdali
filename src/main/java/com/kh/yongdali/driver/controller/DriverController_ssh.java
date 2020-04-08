package com.kh.yongdali.driver.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DriverController_ssh {
	
	//드라이버 계정 계정정보
	@RequestMapping("driverInfo.myp")
	public String driverPageView() {
		return "driver/myPage/driverInfo";
	}
	//트럭정보
	@RequestMapping("truckInfo.myp")
	public String truckInfoView() {
		return "driver/myPage/truckInfo";
	}
	
	//드라이버 정산내역
	@RequestMapping("driverSettle.myp")
	public String driverSettleView() {
		return "driver/myPage/driverSettle";
	}
	 
	 
}
