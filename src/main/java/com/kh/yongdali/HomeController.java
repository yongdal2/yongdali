package com.kh.yongdali;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		  
		return "home"; 
	}
	
	@RequestMapping("pjy.ydl")
	public String pjyView() {
		return "1pjy";
	}
	
	@RequestMapping("ssh.ydl")
	public String sshView() {
		return "2ssh";
	}
	
	@RequestMapping("njh.ydl")
	public String njhView() {
		return "3njh";
	}
	@RequestMapping("cjy.ydl")
	public String cjyView() {
		return "4cjy";
	}
	@RequestMapping("lth.ydl")
	public String lthView() {
		return "5lth";
	}
	@RequestMapping("jwt.ydl")
	public String jwtView() {
		return "6jwt";
	}
	
	
}
