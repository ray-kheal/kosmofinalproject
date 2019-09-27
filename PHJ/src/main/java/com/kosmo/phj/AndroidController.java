package com.kosmo.phj;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import command.PHJCommandImpl;

@Controller
public class AndroidController {
	
	PHJCommandImpl command = null;
	
	@RequestMapping("/android.do")
	@ResponseBody
	public Map<String, String> androidTest(Model model, HttpServletRequest req) {
		System.out.println("android 컨트롤러 호출");
		System.out.println("latitude : "+ req.getParameter("latitude"));
		System.out.println("longitude : "+ req.getParameter("longitude"));
		
		
		Map<String, String> result = new HashMap<String, String>();
		
		
		
		
		return result;
	}	

}
