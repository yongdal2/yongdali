package com.kh.yongdali.member.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.member.model.service.MemberService;
import com.kh.yongdali.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// org.springframework.mail.javamail.JavaMailSender
	@Autowired
	private JavaMailSender mailSender;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
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
			
	/** 로그인 페이지
	 * @return
	 */
	@RequestMapping("loginView.me") 
	public String loginView() {
		return "login&signUp/login";
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
		
	/** 약관동의 페이지
	 * @return
	 */
	@RequestMapping("policyView.me")
	public String policyChk() {
		return "login&signUp/policyChk";
	}
	
	/** 회원가입_약관 동의 페이지
	 * @param pushEnabled
	 * @param model
	 * @return
	 */
	@RequestMapping("signUpView.me")
	public String signUpForm(@RequestParam("pushEnabled") char pushEnabled, Model model) {
		logger.debug("푸시 알림 동의 : " + pushEnabled);
		
		model.addAttribute("pushEnabled", pushEnabled);
		
		return "login&signUp/signUpForm";
	}

	/** 회원가입_이메일 중복검사
	 * @param mId
	 * @return
	 */
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
	
	/** 회원가입_이메일 인증번호 전송
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="sendVeriCode.me", method=RequestMethod.POST)
	public String sendVeriCode(@RequestParam("email") String email) {
		// 인증번호(난수) 생성
		String ranNum = String.valueOf(new Random().nextInt(900000) + 100000);
		
		// MimeMessage 객체 생성
		MimeMessage message = mailSender.createMimeMessage();
		
		// 메일 본문 변수에 담기
		String content = "귀하의 인증코드는 " + ranNum + " 입니다. \n"
				 + "(혹시 잘못 전달되었다면 이 이메일을 무시하셔도 됩니다)";
		
		try {
			// MimeMessage 객체에 입력정보 삽입
			message.setSubject("[용달이] 이메일 계정을 인증해주세요");
			message.setText(content);
			message.addRecipient(RecipientType.TO, new InternetAddress(email)); 
			
			// 메일 전송
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return ranNum;	
	}

	
	
	/** 회원가입_양식 제출
	 * @param m
	 * @return
	 */
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m) {
		logger.debug(m.toString());
		
		return "login&signUp/login";
	}

}
