package com.kh.yongdali.member.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.yongdali.common.SaveFile;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.service.MemberService;
import com.kh.yongdali.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController {
	@Autowired
	private SaveFile saveFile;
	
	
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
		
		mList.add(new Member("admin@naver.com", "Admin!234", "관리자", "010-1111-1111", "관리자", "정상", "용달이", "N")); 
		mList.add(new Member("mem01@naver.com", "Mem!234", "홍멤버", "010-2222-2222", "일반", "정상", "용달이", "Y"));
		mList.add(new Member("biz01@naver.com", "Biz!234", "김거상", "010-3333-3333", "사업자", "정상", "용달이", "N"));
		mList.add(new Member("biz02@naver.com", "Biz!234", "최거상", "010-4444-4444", "사업자", "정상", "용달이", "N"));
		
		sDate[0] = "2020-03-10";
		sDate[1] = "2020-03-18";
		sDate[2] = "2020-03-18";
		sDate[3] = "2020-03-19";
		
		try {
			for(int i = 0; i < sDate.length ; i++) {
				date[i] = new SimpleDateFormat("yyyy-MM-dd").parse(sDate[i]);
				milliesDate[i] = date[i].getTime();
				mList.get(i).setEnrollDate(new java.sql.Date(milliesDate[i]));
				
				encPwdArr[i] = bcryptPasswordEncoder.encode(mList.get(i).getPwd());
				mList.get(i).setPwd(encPwdArr[i]);
			}
		} catch (ParseException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		int result = mService.insertSampleMembers(mList);
		logger.debug("샘플데이터 " + String.valueOf(result) + "개 입력 완료!");
		
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
//		logger.debug("로그인을 시도한 회원 아이디 : " + m.getmId());
		Member loginUser = mService.loginMember(m); 
		System.out.println(loginUser);
		
		// 로그인 성공 
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
//			logger.debug(loginUser.getmId());
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
	

//	네이버 아이디로 로그인(네아로)	
	/** 네이버 아이디로 로그인(네아로)
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("naverLogin.me")
	public String naverLogin(Model model, HttpServletRequest request) {
	    String clientId = "CSQrLTztRmu9Z7lXy3kf";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "k06arsdcFD";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = null;
		try {
			redirectURI = URLEncoder.encode("http://localhost:8081/yongdali/naverLogin.me", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
//	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
//	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
		  if(responseCode==200) {
			  // out.println(res.toString()); 
			  
			// access_token 값 추출
			JSONParser parsing = new JSONParser();
			Object resObj = parsing.parse(res.toString());
			JSONObject resJsonObj = (JSONObject)resObj;
				        
			access_token = (String)resJsonObj.get("access_token");
			refresh_token = (String)resJsonObj.get("refresh_token");
			  
			// 회원정보 조회 API 1.
		    String token = access_token; // 네이버 로그인 접근 토큰;
		    String header = "Bearer " + token; // Bearer 다음에 공백 추가
		    
		    String pInfoApiURL = "https://openapi.naver.com/v1/nid/me";
		
		    Map<String, String> requestHeaders = new HashMap<>();
		    requestHeaders.put("Authorization", header);
		    String responseBody = get(pInfoApiURL,requestHeaders);
		    
		    // 프로필 정보 추출 및 활용
		    Object responseBodyObj = parsing.parse(responseBody);
		    JSONObject jsonResponseBodyObj = (JSONObject)responseBodyObj;
		    JSONObject jsonresponseObj = (JSONObject) jsonResponseBodyObj.get("response");
		    
		    String email = jsonresponseObj.get("email").toString();
		    String name = jsonresponseObj.get("name").toString();
		    
		    Member loginUser = new Member(email, name);
		    logger.debug(loginUser.toString());
		    model.addAttribute("loginUser", loginUser);
		  } 
	    } catch (Exception e) {
	      System.out.println(e);
	    }
		return "user/home";
	}
	
	// 회원정보 조회 API 2.
    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    // 회원정보 조회 API 3.
    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    // 회원정보 조회 API 4.
    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
//	/네이버 아이디로 로그인(네아로)    
	
	/** 로그아웃
	 * @param status
	 * @return
	 */
	@RequestMapping("logout1.me")
	public String memberLogout(SessionStatus status) {
		System.out.println("siab");
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
		int result = mService.emailChk(mId);
		
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

	
	/** 회원가입_양식 제출(일반/사업자 공통) 
	 * @param m
	 * @return
	 */
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m, Driver d
								, Model model, HttpServletRequest request
								, @RequestParam(name="inputFile_idImg", required=true) MultipartFile idImg
								, @RequestParam(name="inputFile_regCardImg", required=true) MultipartFile regCardImg) {
//		logger.debug(m.toString());

		m.setPwd(bcryptPasswordEncoder.encode(m.getPwd()));
		
//		int result = 1;
		int result = mService.insertMember(m);
//		logger.debug("회원가입 insert 결과값 : " + String.valueOf(result));
		
		
		if(m.getmSort().equals("사업자") && result == 1) {
			// dmNo 삽입을 위해 기존 select문 활용
			Member mem = mService.loginMember(m);
			d.setDmNo(mem.getmNo());

			if(!idImg.getOriginalFilename().equals("")) {
				String renameFileName = saveFile.rename(idImg, request, "\\id", "yongdali_id_");
				
				if(renameFileName != null) {
					d.setIdImgOrigin(idImg.getOriginalFilename());
					d.setIdImgRename(renameFileName);
				}
			}
			if(!regCardImg.getOriginalFilename().equals("")) {
				String renameFileName = saveFile.rename(idImg, request, "\\regCard", "yongdali_regCard_");
				
				if(renameFileName != null) {
					d.setRegCardImgOrigin(regCardImg.getOriginalFilename());
					d.setRegCardImgRename(renameFileName);
				}
			}			
			result += mService.insertDriver(d);
		}
		
		// TODO 1 이면 일반회원, 2 면 기사회원가입 완료 페이지 띄우기
		if(result > 0) {
			return "login&signUp/login";
		}else {
			model.addAttribute("msg", "샘플데이터 입력 실패!");
			return "common/errorPage";
		}
	}
	
	

}















