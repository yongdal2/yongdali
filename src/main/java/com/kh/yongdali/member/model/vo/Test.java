package com.kh.yongdali.member.model.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.yongdali.member.model.service.MemberService;
import com.kh.yongdali.member.model.service.MemberServiceImpl;


public class Test {

	BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
	MemberService mService = new MemberServiceImpl();
	
	public static void main(String[] args) {
		new Test().test();
	}
	
	public void test() {
		String[] sDate = new String[4];
		sDate[0] = "2020-03-10";
		sDate[1] = "2020-03-18";
		sDate[2] = "2020-03-18";
		sDate[3] = "2020-03-19";
		
		Member m1 = new Member("admin@naver.com", "admin", "유승제", "010-1111-1111", "관리자", "정상");
		
		
		long milliesDate1 = 0;
		
		try {
			Date[] date = new Date[4];
			for(int i = 0; i <= sDate.length ; i++) {
				Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(sDate[i]);
				
			}
//			Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(sDate1);
//			milliesDate1 = date1.getTime();
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		Member m1 = new Member("admin@naver.com", "admin", "유승제", "010-1111-1111", "관리자", "정상", new java.sql.Date(milliesDate1));
//		Member m2 = new Member("admin@naver.com", "admin", "유승제", "010-1111-1111", "관리자", "정상", new java.sql.Date(milliesDate1));
		
		System.out.println(bcryptPasswordEncoder.encode(m1.getPwd()));
		
		String encPwd = bcryptPasswordEncoder.encode(m1.getPwd());
		
		m1.setPwd(encPwd);
		
		System.out.println(m1);
		
		ArrayList<Member> mList = new ArrayList<Member>();
		
		mList.add(m1);
//		mList.add(m2);
		
		System.out.println(mList);
	}
}
//	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//    String renameFileName = "N"+sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."+
//                      originFileName.substring(originFileName.lastIndexOf(".")+1);

    
















   
