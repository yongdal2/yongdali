package com.kh.yongdali.common;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("saveFile")
public class SaveFile {

	public SaveFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 파일 저장경로 설정
	 * @param file
	 * @param rq
	 * @return
	 */
	public String rename(MultipartFile file, HttpServletRequest request, String savePath, String prefix) {
		
		String root = request.getSession().getServletContext().getRealPath("resources\\images\\driver");
		
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
}
