package com.kh.yongdali.cs.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.common.Pagination;
import com.kh.yongdali.cs.model.service.NoticeService;
import com.kh.yongdali.cs.model.vo.Notice;

@Controller
public class NoticeController {
	
	/* 탐희 _공지사항 */
	@Autowired
	private NoticeService nService;
	
	/**
	 * 사용자 공지사항 목록 보기
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("uNoticeMain.no")
	public ModelAndView userNoticeMain(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage ) {
		
		System.out.println(currentPage);
		
		int listCount = nService.userGetListCount();
		
		System.out.println(listCount);
		
		int pageLimit = 5;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,pageLimit,boardLimit );
		
		ArrayList<Notice> list = nService.userSelectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("user/notice/notice");
		return mv;
	}
	
	
	/**
	 * 사용자 공지사항 상세 내용 보기
	 * @param mv
	 * @param nNo
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("uNdetail.no")
	public ModelAndView userNoticeDetail(ModelAndView mv, String nNo, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		Notice n = nService.userSelectNoticeDetail(nNo);
		
		Notice pre = nService.userSelectPreList(nNo);
		
		Notice next = nService.userSelectNextList(nNo);
		
		if(n != null) {
			mv.addObject("n",n).addObject("currentPage",currentPage)
			.addObject("pre",pre).addObject("next",next).setViewName("user/notice/noticeDetailPage");
		}else {
			System.out.println("공지사항 상세 조회 실패");
		}
		
		return mv;
	}
	
	
	/**
	 * 사용자 공지사항 입력 창 연결
	 * @return
	 */
	@RequestMapping("uNinsertView.no")
	public String userNoticeInsertView() {
		return "user/notice/noticeForm";
	}
	
	/**
	 * 사용자 공지사항 입력 폼
	 * @param n
	 * @param request
	 * @param nSort
	 * @param file
	 * @return
	 */
	@RequestMapping("uNinsert.no")
	public String insertNotice(Notice n, HttpServletRequest request, @RequestParam(name="nSort", required=true, defaultValue="일반")String nSort,
			@RequestParam(name="uploadFile",required=false)MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			// 서버에 업로드
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				n.setnImgOrigin(file.getOriginalFilename());
				n.setnImgRename(renameFileName);
			}
		}
		n.setnSort(nSort);
		
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:uNoticeMain.no";
		}else {
			return "common/errorPage";		
			
		}
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root+"\\nuploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String originFileName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = "N"+sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."+
								originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" +renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch(Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		return renameFileName;
	
	
	}
	
}
