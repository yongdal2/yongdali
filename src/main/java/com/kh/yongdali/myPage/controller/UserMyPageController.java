package com.kh.yongdali.myPage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.service.UserMyPageService;
import com.kh.yongdali.myPage.model.vo.Address;
import com.sun.org.apache.xml.internal.serialize.Printer;

@SessionAttributes("loginUser")
@Controller
public class UserMyPageController {
	@Autowired
	private UserMyPageService umpService;
	
	//추후에 home.controller로 이동 *******************
	@RequestMapping("information.ydl")
	public String informationView() {
		return "user/information";
	}


	// 나의 예약내역
	@RequestMapping("myRSV.myp")
	public String myRSVView() {
		return "user/myPage/myPageRSV";
	}
	
	//==========================유저 정보 ========================================
	
	//유저 폰번호 업데이트
	@RequestMapping("uPhone.myp")
	public String userPhoneUpdate(Model md, @SessionAttribute Member loginUser,
			@RequestParam("uPhone") String phone) {

		loginUser.setPhone(phone);
		
		System.out.println("수정할ID"+loginUser);
		
		int result = umpService.updatePhone(loginUser);

		// m은 기존의 회원 값을 갖고 있기 때문에 새로 저장된 값을 불러오기 위해 다시한번 m을 저장해준다

		if(result > 0) {
			md.addAttribute("loginUser",loginUser);
			
			if(loginUser.getmSort().equals("일반")) {
				return "redirect:addrBook.myp";
			}else if(loginUser.getmSort().equals("사업자")) {
				return "redirect:truckInfo.myp";
			}else {
				return "common/errorPage";
			}
		}else {
			md.addAttribute("msg", "회원정보 수정 실패!!");
			return "common/errorPage";
		}
	}
		
	
	
	
	
	
	//===================================주소록=========================================
	//마이페이지 주소록
		@RequestMapping("addrBook.myp")
		public ModelAndView addrList(ModelAndView mv, @SessionAttribute Member loginUser) {

			String mNo = loginUser.getmNo();
			System.out.println(mNo);
			
			int listCount = umpService.getAddrListCount(mNo);
			System.out.println(listCount);
			
			ArrayList<Address> aList = umpService.selectAddrList(mNo);
			
			mv.addObject("aList", aList);
			mv.addObject("listCount", listCount);
			mv.setViewName("user/myPage/addressBook");

			return mv;
		}
		
	//수정할 주소록 불러오기
		@RequestMapping("getUpAddr.myp")
		public void getUpAddr(HttpServletResponse rs, String aNo) throws IOException {
			Address a = umpService.getUpAddr(aNo);
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
		
	//주소록 수정	
		@RequestMapping("uAddr.myp")
		public String updateAddr(Address a,Model md, 
								@RequestParam("edAno") String aNo,
								@RequestParam(value = "edPlace", required = false) String aPlace,
								@RequestParam("edName") String aName,
								@RequestParam("edAdr_address") String addr1,
								@RequestParam("edAdr_detail") String addr2,
								@RequestParam("edPhone") String aPhone) {
			
			System.out.println(aNo);
			a.setaNo(aNo);
			if(aPlace != null) a.setaPlace(aPlace);
			a.setaName(aName);
			a.setaAddress(addr1+","+addr2);
			a.setaPhone(aPhone);
			
			System.out.println(a);
			int result = umpService.updateAddr(a);
			System.out.println(result);
			if (result > 0) {
				return "redirect:addrBook.myp";
			}else {
				md.addAttribute("msg", "주소록 수정 실패!!");
				return "common/errorPage";
			}
		}
		//주소록 추가
		@RequestMapping("iAddr.myp")
		public String insertAddr(Address a, Model md,
				@SessionAttribute Member loginUser,
				@RequestParam(value = "adPlace", required = false) String aPlace,
				@RequestParam("adName") String aName,
				@RequestParam("adAdr_address") String addr1,
				@RequestParam("adAdr_detail") String addr2,
				@RequestParam("adPhone") String aPhone) {
			
			
			a.setaMno(loginUser.getmNo());
			if(aPlace != null) a.setaPlace(aPlace);
			a.setaName(aName);
			a.setaAddress(addr1+","+addr2);
			a.setaPhone(aPhone);
			
			System.out.println(a);
			int result = umpService.insertAddr(a);
			
			if (result > 0) {
				return "redirect:addrBook.myp";
			}else {
				md.addAttribute("msg", "주소록 수정 실패!!");
				return "common/errorPage";
			}
		}
		//주소록 삭제
		@RequestMapping("dAddr.myp")
		public String deleteAddr(Model md, 
				@RequestParam("aNo") String aNo){

			int result = umpService.deleteAddr(aNo);
			System.out.println("수정사항:"+aNo);

			if (result > 0) {
				return "redirect:addrBook.myp";
			}else {
				md.addAttribute("msg", "주소록 수정 실패!!");
				return "common/errorPage";
			}
		}
		
		//
		
}
