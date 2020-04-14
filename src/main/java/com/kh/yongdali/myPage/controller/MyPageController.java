package com.kh.yongdali.myPage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.service.MyPageService;
import com.kh.yongdali.myPage.model.vo.Address;
import com.sun.org.apache.xml.internal.serialize.Printer;

@SessionAttributes("loginUser")
@Controller
public class MyPageController {
	@Autowired
	private MyPageService mpService;
	
	//추후에 home.controller로 이동
	@RequestMapping("information.ydl")
	public String informationView() {
		return "user/information";
	}

	//유저 계정정보
	@RequestMapping("myInfo.myp")
	public String myPageView() {
		return "user/myPage/myInfo";
	}

	// 나의 예약내역
	@RequestMapping("myRSV.myp")
	public String myRSVView() {
		return "user/myPage/myPageRSV";
	}
	
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

	
	//유저 폰번호 업데이트
//	@RequestMapping("phoneUpdate.myp")
//	public String userPhoneUpdate(Member m, Model model,
//			@RequestParam("phone") String phone) {
//
//		int result = mpService.userPhoneUpdate(m);
//
//		// m은 기존의 회원 값을 갖고 있기 때문에 새로 저장된 값을 불러오기 위해 다시한번 m을 저장해준다
//
//		if(result > 0) {
//			model.addAttribute("loginUser",m);
//			return "redirect:index.jsp";
//		}else {
//			model.addAttribute("msg", "회원정보 수정 실패!!");
//			return "common/errorPage";
//		}
//	}	
	
	//마이페이지 주소록
		@RequestMapping("addrBook.myp")
		public ModelAndView addrList(ModelAndView mv, @SessionAttribute Member loginUser) {

			String mNo = loginUser.getmNo();
			System.out.println(mNo);
			
			int listCount = mpService.getAddrListCount(mNo);
			System.out.println(listCount);
			
			ArrayList<Address> aList = mpService.selectAddrList(mNo);
			
			mv.addObject("aList", aList);
			mv.addObject("listCount", listCount);
			mv.setViewName("user/myPage/addressBook");

			return mv;
		}
		
	//수정할 주소록
		@RequestMapping("getEditAddr.myp")
		public void getEditAddr(HttpServletResponse rs, String aNo) throws IOException {
			Address a = mpService.getEditAddr(aNo);
			System.out.println(a);
			
			rs.setContentType("application/json; charset=utf-8");
			
			JSONObject adJob = new JSONObject();
			adJob.put("aNo",a.getaNo());
			adJob.put("aPlace",URLEncoder.encode(a.getaPlace(), "UTF-8"));
			adJob.put("aName",URLEncoder.encode(a.getaName(), "UTF-8"));
			adJob.put("aAddr1",URLEncoder.encode(a.getaAddress().split(",")[0], "UTF-8"));
			adJob.put("aAddr2",URLEncoder.encode(a.getaAddress().split(",")[1], "UTF-8"));
			adJob.put("aPhone", a.getaPhone());
			
			PrintWriter out = rs.getWriter();
			out.print(adJob);
			out.flush();
			out.close();
		}
}
