package command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import model.place.PlaceDAO;
import model.place.PlaceDTO;
import util.PagingUtil;

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
			int totalRecordCount = dao.getPlaceCount(distance, latTxt, lngTxt);
			System.out.println("totalRecordCount : " + totalRecordCount);
			int pageSize= 5;
			int blockPage= 5;
			int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
			int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals(""))?1:Integer.parseInt(req.getParameter("nowPage"));
			int start = (nowPage-1) * pageSize +1;
			int end = nowPage * pageSize;
			
			
			searchLists = dao.searchRadius(distance, latTxt, lngTxt, start, end);
			
			String pagingImg = PagingUtil.pagingImg_phj(totalRecordCount,pageSize,blockPage, nowPage,req.getContextPath()+"/placemap.do?");
			model.addAttribute("pagingImg",pagingImg);
			model.addAttribute("totalPage",totalPage);
			model.addAttribute("nowPage",nowPage);
			
		}
		
		
		System.out.println("searchLists : " +searchLists);
		model.addAttribute("searchLists",searchLists);
		
	}

}
