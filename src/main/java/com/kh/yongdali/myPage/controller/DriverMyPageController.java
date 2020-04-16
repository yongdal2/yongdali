package com.kh.yongdali.myPage.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.yongdali.driver.model.service.DriverService;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.myPage.model.service.DriverMyPageService;

@SessionAttributes("loginUser")
@Controller
public class DriverMyPageController {
	
	@Autowired
	private DriverMyPageService dmpService;
	

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
	
	
	//======================드라이버 정보==============================
	//드라이버 프로필 사진 변경
	
	@RequestMapping("uImg.myp")
	public String updateProfileImg(Driver d, HttpServletRequest rq,
									@RequestParam("newImg") MultipartFile file) {
		
		if(!file.getOriginalFilename().contentEquals("")) {
		
			//서버에 업로드
			
			String savePath = "\\id";
			String renameFileName = saveFile(file, rq, "\\id", "yongdali_id_");
			 if (renameFileName !=null) {
				 d.setIdImgOrigin(file.getOriginalFilename());
				 d.setIdImgRename(renameFileName);
			}
		}
		
		int result = dmpService.updateProfileImg(d);
		
		
		
		return null;
	}
	
	
	/**
	 * 파일 저장경로 설정
	 * @param file
	 * @param rq
	 * @return
	 */
	private String saveFile(MultipartFile file, HttpServletRequest rq, String savePath, String prefix) {
		
		String root = rq.getSession().getServletContext().getRealPath("resources\\images\\driver");
		
		File folder = new File(root+savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		String originFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat(prefix+"yyyyMMdd_HHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
				+originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String renamePath = folder+"\\"+renameFileName; // 실제 저장된 파일 경로 + 파일명
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : "+e.getMessage());
		}
		
		return renameFileName;
	}
}
