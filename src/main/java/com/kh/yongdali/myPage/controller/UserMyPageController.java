package com.kh.yongdali.myPage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.common.Pagination;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.service.UserMyPageService;
import com.kh.yongdali.myPage.model.vo.Address;
import com.kh.yongdali.payment.model.vo.Payment;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Controller
public class UserMyPageController {
	@Autowired
	private UserMyPageService umpService;
	
	//추후에 home.controller로 이동 *******************
	@RequestMapping("information.ydl")
	public String informationView() {
		return "user/information";
	}


	
	
	//==========================유저 정보 ========================================
	
	//유저 폰번호 업데이트
	@RequestMapping("uPhone.myp")
	public String userPhoneUpdate(Model md, @SessionAttribute Member loginUser,
			@RequestParam("uPhone") String phone) {

		loginUser.setPhone(phone);
		
		
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
			
			int listCount = umpService.getAddrListCount(mNo);
			
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
			
			rs.setContentType("application/json; charset=utf-8");
			
			JSONObject adJob = new JSONObject();
			adJob.put("aNo",a.getaNo());
			adJob.put("aPlace",URLEncoder.encode(a.getaPlace(), "UTF-8"));
			adJob.put("aName",URLEncoder.encode(a.getaName(), "UTF-8"));
			adJob.put("aAddr1",URLEncoder.encode(a.getaAddress().split(",")[0], "UTF-8"));
			adJob.put("aAddr2",URLEncoder.encode(a.getaAddress().split(",")[1], "UTF-8"));
			adJob.put("aLat", a.getaLatitude());
			adJob.put("aLong", a.getaLongitude());
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
								@RequestParam("edLat") double aLat,
								@RequestParam("edLong") double aLong,
								@RequestParam("edPhone") String aPhone) {
			
			a.setaNo(aNo);
			if(aPlace != null) a.setaPlace(aPlace);
			a.setaName(aName);
			a.setaAddress(addr1+","+addr2);
			a.setaLatitude(aLat);
			a.setaLongitude(aLong);
			a.setaPhone(aPhone);
			
			int result = umpService.updateAddr(a);
			
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
				@RequestParam("adLat") double aLat,
				@RequestParam("adLong") double aLong,
				@RequestParam("adPhone") String aPhone) {
			
			
			a.setaMno(loginUser.getmNo());
			if(aPlace != null) a.setaPlace(aPlace);
			a.setaName(aName);
			a.setaAddress(addr1+","+addr2);
			a.setaLatitude(aLat);
			a.setaLongitude(aLong);
			a.setaPhone(aPhone);
			
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
				@RequestParam("aNo") String aNo, @SessionAttribute Member loginUser){
			System.out.println("수정사항:"+aNo);

			int result = umpService.deleteAddr(aNo);

			if (result > 0) {
				md.addAttribute("loginUser", loginUser);
				return "redirect:addrBook.myp";
			}else {
				md.addAttribute("msg", "주소록 수정 실패!!");
				return "common/errorPage";
			}
		}
		
		//================나의 예약내역 =================================
		
		// 나의 예약내역
		@RequestMapping("myRSV.myp")
		public ModelAndView myRsvList(@SessionAttribute Member loginUser, ModelAndView mv,
									@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage) {
			
			
			String mNo = loginUser.getmNo();
			int rlistCount =umpService.getRsvListCount(mNo);
			
			System.out.println();
			PageInfo pi = Pagination.getPageInfo(currentPage, rlistCount, 5, 20);
			
			ArrayList<Reservation> rList = umpService.selectRsvList(pi,mNo);
			
			System.out.println(rList);
			
			mv.addObject("rList",rList);
			mv.addObject("pi",pi);
			mv.setViewName("user/myPage/myPageRSV");
			return mv;
		}
		
		//예약 드라이버 정보 불러오기
		@RequestMapping("rDinfo.myp")
		public void getRsvDinfo(HttpServletResponse rs, @RequestParam String dNo) throws IOException{
			System.out.println(dNo);
			Driver d = umpService.getRsvDinfo(dNo);
			System.out.println(d);
			
			rs.setContentType("application/json; charset=utf-8");
			
			JSONObject adJob = new JSONObject();
			if(d !=null) {
				adJob.put("deal","Y");
				adJob.put("name",URLEncoder.encode(d.getRegCardImgOrigin(), "UTF-8"));
				adJob.put("phone",d.getRegCardImgRename());
				adJob.put("img",d.getIdImgRename());
				adJob.put("capacity",d.getCapacity());
				adJob.put("type",URLEncoder.encode(d.getType(), "UTF-8"));
				adJob.put("carNo",URLEncoder.encode(d.getCarNo(), "UTF-8"));
			}else {
				adJob.put("deal","N");
			}
			
			PrintWriter out = rs.getWriter();
			out.print(adJob);
			out.flush();
			out.close();
		}
		//예약 정보 상세보기
		@RequestMapping(value = "rDetail.myp")
		public void rDetail(HttpServletResponse rs, @RequestParam String rNo) throws JsonIOException, IOException {
			
			System.out.println("예상"+rNo);
			Reservation rp = umpService.rDetail(rNo);
			System.out.println(rp);
			
			rs.setContentType("application/json; charset=utf-8");
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(rp, rs.getWriter());
		}
		
		
		//예약 msg 수정
		@ResponseBody
		@RequestMapping("upRmsg.myp")
		public String upRSVmsg(Reservation r, @RequestParam String rMsg, @RequestParam String rNo) throws IOException {
			r.setMsg(rMsg);
			r.setrNo(rNo);
			
			System.out.println( r.getrNo() + r.getMsg());
			
			int result = umpService.upRSVmsg(r);
			
			System.out.println(result);
			if(result>0) {
				
				return URLEncoder.encode(rMsg, "UTF-8");
			}else {
				return "fail";
			}
		}
		
		//payment 상세정보
		@RequestMapping(value = "pDetail.myp")
		public void pDetail(HttpServletResponse rs, @RequestParam String rNo, Payment p) throws JsonIOException, IOException {
			
			p = umpService.pDetail(rNo);
			
			System.out.println(p);
			rs.setContentType("application/json; charset=utf-8");
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(p, rs.getWriter());
		}
		
		//예약 취소
		@ResponseBody
		@RequestMapping("rsvCan.myp")
		public String rsvCan(Payment p,@RequestParam String pRNo, @RequestParam String dealYN) throws IOException {
			p.setpRNo(pRNo);
			p.setDealYN(dealYN);
			System.out.println(p);

			int result = umpService.rsvCan(p);

			System.out.println("결과 : "+result);
			if(result>0) {
				return "ok";
			}else{
				return "fail";
			}
		}
		
}
