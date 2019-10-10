package com.kosmo.phj;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import command.PHJCommandImpl;
import model.place.PlaceDAO;
import model.place.PlaceDTO;
import util.FCMUtil;

@Controller
public class AndroidController {

	PHJCommandImpl command = null;

	@RequestMapping("fcm.do")
	@ResponseBody
	public Map<String, String> fcm(Model model, HttpServletRequest req, HttpSession session) {
		Map<String, String> result = new HashMap<String, String>();
		System.out.println(req.getParameter("FCM_TOKEN"));
		session.setAttribute("FCM_TOKEN", req.getParameter("FCM_TOKEN"));
		System.out.println("세션검증 " + session.getAttribute("FCM_TOKEN"));
		
		return result;
	}

	@RequestMapping("/android.do")
	@ResponseBody
	public Map<String, String> androidTest(Model model, HttpServletRequest req) {
		System.out.println("android 컨트롤러 호출");
		System.out.println("latitude : " + req.getParameter("latitude"));
		System.out.println("longitude : " + req.getParameter("longitude"));
		System.out.println("distance : " + req.getParameter("distance"));

		double distance = Double.parseDouble(req.getParameter("distance"));
		double latTxt = Double.parseDouble(req.getParameter("latitude"));
		double lngTxt = Double.parseDouble(req.getParameter("longitude"));

		String place_code = "";
		String place_name = "";
		String place_address = "";
		String latitude = "";
		String longitude = "";

		ArrayList<PlaceDTO> placeArray = new ArrayList<PlaceDTO>();

		PlaceDAO dao = new PlaceDAO();

		placeArray = dao.searchRadius(distance, latTxt, lngTxt, 1, 50);

		for (int i = 0; i < placeArray.size(); i++) {
			place_code += placeArray.get(i).getPlace_code() + ",";
			if (placeArray.get(i).getPlace_name2() != null) {
				if (placeArray.get(i).getPlace_name().contains(placeArray.get(i).getPlace_name2()) == true) {

				} else {
					placeArray.get(i)
							.setPlace_name(placeArray.get(i).getPlace_name() + placeArray.get(i).getPlace_name2());
				}
			}
			place_name += placeArray.get(i).getPlace_name() + ",";
			place_address += placeArray.get(i).getPlace_address() + ",";
			latitude += placeArray.get(i).getLatitude() + ",";
			longitude += placeArray.get(i).getLongitude() + ",";
		}

		Map<String, String> result = new HashMap<String, String>();
		result.put("place_code", place_code);
		result.put("place_name", place_name);
		result.put("place_address", place_address);
		result.put("latitude", latitude);
		result.put("longitude", longitude);

		return result;
	}

	@RequestMapping(value = "/fcmsend.do")
    public  @ResponseBody String fcmsend(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
      
        String tokenId="AAAApN_84Y4:APA91bFylPeVqprKMB6WG9h3kteJup3ppC8gFSweJrMcISt5q77MpeSrK2fQuJlpph0T4gnqMUYHrqU4SfLudmxsPC_c5zBWfymD2P3bhnj4Qzn6Ua4g8Q48PE13XsFw9znrtadUbMdf";
        String title="제목입니다";
        String content="내용입니다";
      
        FCMUtil FcmUtil = new FCMUtil();
        FcmUtil.send_FCM(tokenId, title, content);
      
        return "general/stock";
	}
	
}
