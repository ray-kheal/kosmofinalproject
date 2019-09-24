package command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import model.place.PlaceDAO;
import model.place.PlaceDTO;

public class placeMapCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//폼값받기
		double distance = (req.getParameter("distance")==null)? 0 : Double.parseDouble(req.getParameter("distance"));
		double latTxt = (req.getParameter("latTxt")==null)? 0 : Double.parseDouble(req.getParameter("latTxt"));
		double lngTxt = (req.getParameter("lngTxt")==null)? 0 : Double.parseDouble(req.getParameter("lngTxt"));
		
		ArrayList<PlaceDTO> searchLists = null;
		PlaceDAO dao = new PlaceDAO();
		if(distance != 0) {
			searchLists = dao.searchRadius(distance, latTxt, lngTxt);
		}
		System.out.println("searchLists : " +searchLists);
		model.addAttribute("searchLists",searchLists);
		
	}

}
