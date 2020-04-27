package com.kh.yongdali.myPage.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.common.Pagination;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.myPage.model.service.DriverMyPageService;
import com.kh.yongdali.myPage.model.vo.Filter;
import com.kh.yongdali.reservation.model.vo.Reservation;

@SessionAttributes({"driver"})
@Controller
public class DriverMyPageController {
	
	@Autowired
	private DriverMyPageService dmpService;
	
	


	
	
	//======================드라이버 정보==============================
	//드라이버 프로필 사진 변경
	
	@RequestMapping("uImg.myp")
	public String updateProfileImg(Driver d, HttpServletRequest rq, @SessionAttribute Member loginUser, Model mv,
									@RequestParam("newImg") MultipartFile file) {
		
		if(!file.getOriginalFilename().contentEquals("")) {
		
			//서버에 업로드
			
			String savePath = "\\id";
			String renameFileName = saveFile(file, rq, "\\id", "yongdali_id_");
			System.out.println(renameFileName);
			 if (renameFileName !=null) {
				 d.setIdImgOrigin(file.getOriginalFilename());
				 d.setIdImgRename(renameFileName);
			}
			 d.setDmNo(loginUser.getmNo());
			 
			 System.out.println("뉴"+d);
		}
		
		int result = dmpService.updateProfileImg(d);
		
		
		if (result > 0) {
			return "redirect:driver/myPage/truckInfo";
		}else {
			return "common/errorPage";
		}
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		String renameFileName = prefix+sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
				+originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String renamePath = folder+"\\"+renameFileName; // 실제 저장된 파일 경로 + 파일명
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : "+e.getMessage());
		}
		
		return renameFileName;
	}
	
	//======================차량정보==============================
	
	//트럭정보
		@RequestMapping("truckInfo.myp")
		public ModelAndView truckInfoView(ModelAndView mv, @SessionAttribute Member loginUser) {
			
			String mNo = loginUser.getmNo();
			Driver driver = dmpService.truckInfoView(mNo);
			System.out.println(driver);
			mv.addObject("loginUser",loginUser);
			mv.addObject("driver",driver);
			mv.setViewName("driver/myPage/truckInfo");
			return mv;
		}
		
	//===========================드라이버 정산 =========================
		
		//드라이버 정산내역
		
		@RequestMapping("driverSettle.myp")
		public ModelAndView myRsvList(@SessionAttribute Driver driver, ModelAndView mv,
									@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage) {
			
			
			String dNo = driver.getdNo();
			int clistCount =dmpService.getCalListCount(dNo);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, clistCount, 5, 20);
			
			ArrayList<Reservation> cList = dmpService.selectCalList(pi,dNo);
			
			System.out.println(cList);
			
			mv.addObject("cList",cList);
			mv.addObject("pi",pi);
			mv.setViewName("driver/myPage/driverSettle");
			return mv;
		}
		
		@RequestMapping("driverFilter.myp")
		public ModelAndView driverFilterList(@SessionAttribute Driver driver, ModelAndView mv, Filter f,
				@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
				@RequestParam("calStatus") String calStatus, @RequestParam("rsvStatus") String rsvStatus,
				@RequestParam("stDate") Date stDate, @RequestParam("edDate") Date edDate) {
			
			f.setdNo(driver.getdNo());
			f.setCalStatus(calStatus);
			f.setRsvStatus(rsvStatus);
			f.setStDate(stDate);
			
			System.out.println(f);
			
			int flistCount =dmpService.getFilterCountList(f);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, flistCount, 5, 20);
			
			ArrayList<Reservation> fCalList = dmpService.selectFilterCalList(pi,f);
			
			System.out.println(fCalList);
			
			mv.addObject("fCalList",fCalList);
			mv.addObject("pi",pi);
			mv.setViewName("driver/myPage/driverSettle");
			return mv;
		}
		
//		
		
		
		
		
}
