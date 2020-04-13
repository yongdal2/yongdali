package com.kh.yongdali.member.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.yongdali.member.model.service.MemberService;
import com.kh.yongdali.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/** 로그인 페이지
	 * @return
	 */
	@RequestMapping("loginView.me") 
	public String loginView() {
		return "login&signUp/login";
	}

	/** 약관동의 페이지
	 * @return
	 */
	@RequestMapping("policyView.me")
	public String policyChk() {
		return "login&signUp/policyChk";
	}

	/** 회원가입 페이지
	 * @return
	 */
//	@RequestMapping("signUpView.me")
//	public String signUpForm(@ModelAttribute Member m, Model model) {
//		logger.debug("푸시 알림 동의 : " + m.getPushEnabled());
//		
//		Member singUpMem = new Member();
//		singUpMem.setPushEnabled('Y');
//		logger.debug(singUpMem.toString());
//		
//		model.addAttribute("singUpMem", singUpMem);
//		
//		return "login&signUp/signUpForm";
//	}
	
	@RequestMapping("signUpView.me")
	public String signUpForm(@RequestParam("pushEnabled") char pushEnabled, Model model) {
		logger.debug("푸시 알림 동의 : " + pushEnabled);
		
		model.addAttribute("pushEnabled", pushEnabled);
		
		return "login&signUp/signUpForm";
	}
	
	/** 로그인
	 * @param m
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String memberLogin(@ModelAttribute Member m, Model model) {
		logger.debug("로그인을 시도한 회원 아이디 : " + m.getmId());
		Member loginUser = mService.loginMember(m); 
		System.out.println(loginUser);
		
		// 로그인 성공 
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			logger.debug(loginUser.getmId());
			return "loginSuccess"; 
		}
		
		// 이메일 없음
		else if(loginUser == null){
			return "nonExistentId";
		}
		
		// 비밀번호 틀림
		else {
			return "wrongPwd";
			
		}	
	}
	
	/** 로그아웃
	 * @param status
	 * @return
	 */
	@RequestMapping("logout.me")
	public String memberLogout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:home.do";
	}
	
	/** 회원가입_이메일 인증 TODO
	 * @return
	 */
	@ResponseBody
	@RequestMapping("emailVerify.me")
	public String emailVerify() {
		return "good";
	}
	
	/** 회원가입
	 * @param m
	 * @return
	 */
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m) {
		logger.debug(m.toString());
		
		return "login&signUp/login";
	}
	
	@ResponseBody
	@RequestMapping("emailDup.me")
	public String emailDupChk(@RequestParam("mId") String mId) {
		logger.debug("가입 요청 email : " + mId);
		
		int result = mService.emailChk(mId);
		logger.debug("중복검사 결과값 : " + result);
		
		if(result > 0) {
			return "exist";
		}else {
			return "available";
		}
	}
	
	/** 샘플데이터
	 * @param model
	 * @return
	 */
	@RequestMapping("insertSample.me")
	public String insertSampleMembers(Model model) {
		ArrayList<Member> mList = new ArrayList<Member>();
		String[] sDate = new String[4];
		long[] milliesDate = new long[4];
		Date[] date = new Date[4];
		String[] encPwdArr = new String[4];
		
		mList.add(new Member("admin@naver.com", "Admin!234", "관리자", "010-1111-1111", "관리자", "정상", 'N')); 
		mList.add(new Member("mem01@naver.com", "Mem!234", "홍멤버", "010-2222-2222", "일반", "정상", 'Y'));
		mList.add(new Member("biz01@naver.com", "Biz!234", "김거상", "010-3333-3333", "사업자", "정상", 'N'));
		mList.add(new Member("biz02@naver.com", "Biz!234", "최거상", "010-4444-4444", "사업자", "정상", 'N'));
		
		sDate[0] = "2020-03-10";
		sDate[1] = "2020-03-18";
		sDate[2] = "2020-03-18";
		sDate[3] = "2020-03-19";
		
		try {
			for(int i = 0; i < sDate.length ; i++) {
				date[i] = new SimpleDateFormat("yyyy-MM-dd").parse(sDate[i]);
				milliesDate[i] = date[i].getTime();
				mList.get(i).setEnrollDate(new java.sql.Date(milliesDate[i]));
				logger.debug(mList.get(i).toString());
				
				encPwdArr[i] = bcryptPasswordEncoder.encode(mList.get(i).getPwd());
				mList.get(i).setPwd(encPwdArr[i]);
				logger.debug(mList.get(i).toString()+"\n");
			}
		} catch (ParseException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		int result = mService.insertSampleMembers(mList);
		logger.debug(String.valueOf(result));
		
		if(result > 3) {
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "샘플데이터 입력 실패!");
			return "common/errorPage";
		}
	}
	
}
