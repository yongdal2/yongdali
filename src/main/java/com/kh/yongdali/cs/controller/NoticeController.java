package com.kh.yongdali.cs.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	 * (사용자) 공지사항 목록 보기
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
	 * (기사) 공지사항 목록 보기
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("dNoticeMain.no")
	public ModelAndView driverNoticeMain(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage ) {
		
		System.out.println(currentPage);
		
		int listCount = nService.driverGetListCount();
		
		System.out.println(listCount);
		
		int pageLimit = 5;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,pageLimit,boardLimit );
		
		ArrayList<Notice> list = nService.driverSelectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("driver/notice/notice");
		return mv;
	}
	
	/**
	 * (사용자) 공지사항 상세 내용 보기
	 * @param mv
	 * @param nNo
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("uNdetail.no")
	public ModelAndView userNoticeDetail(ModelAndView mv, String nNo, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		Notice n = nService.selectNoticeDetail(nNo);
		
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
	 * (기사) 공지사항 상세 내용 보기
	 * @param mv
	 * @param nNo
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("dNdetail.no")
	public ModelAndView driverNoticeDetail(ModelAndView mv, String nNo, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		Notice n = nService.selectNoticeDetail(nNo);
		
		Notice pre = nService.driverSelectPreList(nNo);
		
		Notice next = nService.driverSelectNextList(nNo);
		
		if(n != null) {
			mv.addObject("n",n).addObject("currentPage",currentPage)
			.addObject("pre",pre).addObject("next",next).setViewName("driver/notice/noticeDetailPage");
		}else {
			System.out.println("공지사항 상세 조회 실패");
		}
		
		return mv;
	}
	
	/**
	 * (사용자) 공지사항 입력 창 연결
	 * @return
	 */
	@RequestMapping("uNinsertView.no")
	public String userNoticeInsertView() {
		return "user/notice/noticeForm";
	}
	
	/**
	 * (기사) 공지사항 입력 창 연결
	 * @return
	 */
	@RequestMapping("dNinsertView.no")
	public String driverNoticeInsertView() {
		return "driver/notice/noticeForm";
	}
	
	/**
	 * (사용자) 공지사항 입력 폼
	 * @param n
	 * @param request
	 * @param nSort
	 * @param file
	 * @return
	 */
	@RequestMapping("uNinsert.no")
	public String userInsertNotice(Notice n, HttpServletRequest request, @RequestParam(name="nSort", required=true, defaultValue="일반")String nSort,
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
	
	/**
	 * (기사) 공지사항 입력 폼
	 * @param n
	 * @param request
	 * @param nSort
	 * @param file
	 * @return
	 */
	@RequestMapping("dNinsert.no")
	public String driverInsertNotice(Notice n, HttpServletRequest request, @RequestParam(name="nSort", required=true, defaultValue="일반")String nSort,
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
			return "redirect:dNoticeMain.no";
		}else {
			return "common/errorPage";		
			
		}
		
	}
	
	/**
	 * 파일 저장 메소드
	 * @param file
	 * @param request
	 * @return
	 */
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
	
	/**
	 * (사용자) 공지사항 수정 페이지 연결
	 * @param mv
	 * @param nNo
	 * @return
	 */
	@RequestMapping("uNupview.no")
	public ModelAndView userNoticeUpdateView(ModelAndView mv, String nNo) {
		mv.addObject("n",nService.selectUpdateNotice(nNo)).setViewName("user/notice/noticeUpdateForm");
		return mv;
	}
	
	/**
	 * (기사) 공지사항 수정 페이지 연결
	 * @param mv
	 * @param nNo
	 * @return
	 */
	@RequestMapping("dNupview.no")
	public ModelAndView driverNoticeUpdateView(ModelAndView mv, String nNo) {
		mv.addObject("n",nService.selectUpdateNotice(nNo)).setViewName("driver/notice/noticeUpdateForm");
		return mv;
	}
	
	/**
	 * (사용자) 공지사항 수정
	 * @param mv
	 * @param n
	 * @param nSort
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("uNupdate.no")	
	public ModelAndView userNoticeUpdate(ModelAndView mv, Notice n, @RequestParam(name="nSort", required=true, defaultValue="일반")String nSort,
									HttpServletRequest request, @RequestParam(value="reloadFile", required=false) MultipartFile file) {
		if(file != null && !file.isEmpty()) {
			if(n.getnImgRename() != null) {
				deleteFile(n.getnImgRename(), request);
			}
			
			//삭제 후 새롭게 추가
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				n.setnImgOrigin(file.getOriginalFilename());
				n.setnImgRename(renameFileName);
			}
		}
		
		n.setnSort(nSort);
		System.out.println(n);
		
		int result = nService.updateNotice(n);
		
		System.out.println(result);
		
		
		if(result > 0) {
			mv.addObject("nNo",n.getnNo()).setViewName("redirect:uNdetail.no");
		}else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * (기사) 공지사항 수정
	 * @param mv
	 * @param n
	 * @param nSort
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("dNupdate.no")	
	public ModelAndView driverNoticeUpdate(ModelAndView mv, Notice n, @RequestParam(name="nSort", required=true, defaultValue="일반")String nSort,
									HttpServletRequest request, @RequestParam(value="reloadFile", required=false) MultipartFile file) {
		
		
		System.out.println("fileName : " + file.getOriginalFilename());
		if(file != null && !file.isEmpty()) {
			if(n.getnImgRename() != null) {
				deleteFile(n.getnImgRename(), request);
			}
			
			//삭제 후 새롭게 추가
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				n.setnImgOrigin(file.getOriginalFilename());
				n.setnImgRename(renameFileName);
			}
		}
		
		n.setnSort(nSort);
		System.out.println(n);
		
		int result = nService.updateNotice(n);
		
		System.out.println(result);
		
		
		if(result > 0) {
			mv.addObject("nNo",n.getnNo()).setViewName("redirect:dNoticeMain.no");
		}else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 파일 삭제 메소드
	 * @param fileName
	 * @param request
	 */
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nuploadFiles";
		
		File f = new File(savePath + "\\" +fileName);
		
		if(f.exists()) {
			f.delete(); //파일 삭제
		}
	}
	
	@RequestMapping("fileDelete.no")
	@ResponseBody
	public String deleteReNameFile(@RequestParam("fileName") String fileName, @RequestParam("nNo") String nNo, Notice n, HttpServletRequest request) {
		System.out.println(fileName);
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nuploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
		
		
		int result = nService.deleteFile(nNo);
		
		System.out.println(n.getnImgOrigin());
		System.out.println(n.getnImgRename());
		
		if(result > 0) {
			return "ok";
		}else {
			return "fail";
		}
	}
	
	/**
	 * (사용자) 게시물 삭제
	 * @param nNo
	 * @param request
	 * @return
	 */
	@RequestMapping("uNdelete.no")
	public String userNoticeDelete(String nNo, HttpServletRequest request) {
		Notice n = nService.selectUpdateNotice(nNo);
		
		if(n.getnImgRename() != null) {
			deleteFile(n.getnImgRename(), request);
		}
		
		int result = nService.deleteNotice(nNo);
		
		if(result > 0) {
			return "redirect:uNoticeMain.no";
		}else {
			return "common/errorPage";
		}
	}
	
	/**
	 * (기사) 게시물 삭제
	 * @param nNo
	 * @param request
	 * @return
	 */
	@RequestMapping("dNdelete.no")
	public String driverNoticeDelete(String nNo, HttpServletRequest request) {
		Notice n = nService.selectUpdateNotice(nNo);
		
		if(n.getnImgRename() != null) {
			deleteFile(n.getnImgRename(), request);
		}
		
		int result = nService.deleteNotice(nNo);
		
		if(result > 0) {
			return "redirect:dNoticeMain.no";
		}else {
			return "common/errorPage";
		}
	}
	
	/**
	 * (사용자) 게시물 검색
	 * @param mv
	 * @param keyword
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("uNsearch.no")
	public ModelAndView userNoticeSearch(ModelAndView mv, @RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage ) {
		
		System.out.println(currentPage);
		
		int listCount = nService.userSearchGetListCount(keyword);
		
		System.out.println(listCount);
		
		int pageLimit = 5;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,pageLimit,boardLimit );
		
		ArrayList<Notice> list = nService.userSearchSelectList(pi,keyword);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("user/notice/notice");
		return mv;
	}
	
	/**
	 * (기사) 게시물 검색
	 * @param mv
	 * @param keyword
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("dNsearch.no")
	public ModelAndView driverNoticeSearch(ModelAndView mv, @RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage ) {
		
		System.out.println(currentPage);
		
		int listCount = nService.driverSearchGetListCount(keyword);
		
		System.out.println(listCount);
		
		int pageLimit = 5;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,pageLimit,boardLimit );
		
		ArrayList<Notice> list = nService.driverSearchSelectList(pi,keyword);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("driver/notice/notice");
		return mv;
	}
	
	
}
