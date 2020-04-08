//package com.kh.yongdali.member.model.vo;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//import com.kh.yongdali.member.model.service.MemberService;
//import com.kh.yongdali.member.model.service.MemberServiceImpl;
//
//
//
//public class Test {
//
//	BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
//	MemberService mService = new MemberServiceImpl();
//	private Logger logger = LoggerFactory.getLogger(Test.class);
//	
//	public static void main(String[] args) {
//		new Test().test();
//	}
//	
//	public void test() {
//		ArrayList<Member> mList = new ArrayList<Member>();
//		String[] sDate = new String[4];
//		long[] milliesDate = new long[4];
//		Date[] date = new Date[4];
//		String[] encPwdArr = new String[4];
//		
//		mList.add(new Member("admin@naver.com", "admin", "유승제", "010-1111-1111", "관리자", "정상")); 
//		mList.add(new Member("mem01@naver.com", "mem01", "홍멤버", "010-2222-2222", "일반", "정상"));
//		mList.add(new Member("biz01@naver.com", "biz01", "김거상", "010-3333-3333", "사업자", "정상"));
//		mList.add(new Member("biz02@naver.com", "biz01", "최거상", "010-4444-4444", "사업자", "정상"));
//		
//		sDate[0] = "2020-03-10";
//		sDate[1] = "2020-03-18";
//		sDate[2] = "2020-03-18";
//		sDate[3] = "2020-03-19";
//		
//		try {
//			for(int i = 0; i < sDate.length ; i++) {
//				date[i] = new SimpleDateFormat("yyyy-MM-dd").parse(sDate[i]);
//				milliesDate[i] = date[i].getTime();
//				mList.get(i).setEnrollDate(new java.sql.Date(milliesDate[i]));
//				logger.debug(mList.get(i).toString());
//				
//				encPwdArr[i] = bcryptPasswordEncoder.encode(mList.get(i).getPwd());
//				mList.get(i).setPwd(encPwdArr[i]);
//				logger.debug(mList.get(i).toString()+"\n");
//			}
//		} catch (ParseException e) {
////			model.addAttribute("msg", e.getMessage());
////			return "common/errorPage";
//			e.printStackTrace();
//		}
//		
//		int result = mService.insertSampleMembers(mList);
//		
////		if(result > 3) {
////			return "redirect:home.do";
////		}else {
////			model.addAttribute("msg", "샘플데이터 입력 실패!");
////			return "common/errorPage";
////		}
//	}
//}
//
//
//    
















   
