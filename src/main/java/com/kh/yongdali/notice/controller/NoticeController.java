package com.kh.yongdali.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.common.Pagination;
import com.kh.yongdali.notice.model.service.NoticeService;
import com.kh.yongdali.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	/* 탐희 _공지사항 */
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("noticeMain.no")
	public ModelAndView noticeMain(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage ) {
		
		System.out.println(currentPage);
		
		int listCount = nService.getListCount();
		
		System.out.println(listCount);
		
		int pageLimit = 5;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,pageLimit,boardLimit );
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("user/notice/notice");
		return mv;
	}
	
	@RequestMapping("ndetail.no")
	public ModelAndView noticeDetail(ModelAndView mv, String nNo, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		Notice n = nService.selectNoticeDetail(nNo);
		
		Notice pre = nService.selectPreList(nNo);
		
		Notice next = nService.selectNextList(nNo);
		
		if(n != null) {
			mv.addObject("n",n).addObject("currentPage",currentPage)
			.addObject("pre",pre).addObject("next",next).setViewName("user/notice/noticeDetailPage");
		}else {
			System.out.println("공지사항 상세 조회 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("ninsertView.no")
	public String noticeInsertView() {
		return "user/notice/noticeForm";
	}
	
	@RequestMapping("ninsert.no")
		public String insertNotice(Notice n, @RequestParam(name="nSort", required=true, defaultValue="일반")String nSort,
				@RequestParam(name="uploadFile",required=false)MultipartFile file) {
			if(!file.getOriginalFilename().equals("")) {
				// 서버에 업로드
			/* String renameFileName = saveFile(File,request); */
			}
		
		
			n.setnSort(nSort);
			
			return "";
			
		}
	
}
