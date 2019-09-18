package com.kosmo.phj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import command.PHJCommandImpl;
@Controller
public class AdminController {
	
	PHJCommandImpl command = null;
	
	@RequestMapping("/admin/index.do")
	public String index() {
		return "admin/index";
	}
	@RequestMapping("/admin/pages/charts/chartjs.do")
	public String chartjs() {
		return "admin/pages/charts/chartjs";
	}
	@RequestMapping("/admin/pages/forms/basic_elements.do")
	public String basic_elements() {
		return "admin/pages/forms/basic_elements";
	}
	
	@RequestMapping("/admin/pages/icons/mdi.do")
	public String mdi() {
		return "admin/pages/icons/mdi";
	}
	
	@RequestMapping("/admin/pages/samples/blank-page.do")
	public String blank_page() {
		return "admin/pages/samples/blank-page";
	}
	
	@RequestMapping("/admin/pages/samples/error-404.do")
	public String error_404() {
		return "admin/pages/samples/error-404";
	}
	
	@RequestMapping("/admin/pages/samples/error-500.do")
	public String error_500() {
		return "admin/pages/samples/error-500";
	}
	
	@RequestMapping("/admin/pages/samples/login.do")
	public String login() {
		return "admin/pages/samples/login";
	}
	
	@RequestMapping("/admin/pages/samples/register.do")
	public String register() {
		return "admin/pages/samples/register";
	}
	
	@RequestMapping("/admin/pages/tables/basic-table.do")
	public String basic_table() {
		return "admin/pages/tables/basic-table";
	}
	
	//고객관리 페이지
	@RequestMapping("/admin/pages/tables/memberManagement.do")
	public String memberManagement() {
		return "admin/pages/tables/memberManagement";
	}
	
	//상품관리 페이지
	@RequestMapping("/admin/pages/tables/productManagement.do")
	public String productManagement() {
		return "admin/pages/tables/productManagement";
	}
	//상품글쓰기 페이지
	@RequestMapping("/admin/pages/tables/productManagementWrite.do")
	public String productManagementWrite() {
		return "admin/pages/tables/productManagementWrite";
	}
	
	
	//점포관리 페이지
	@RequestMapping("/admin/pages/tables/placeManagement.do")
	public String placeManagement() {
		return "admin/pages/tables/placeManagement";
	}
	//점포관리 페이지
	@RequestMapping("/admin/pages/tables/placeManagementWrite.do")
	public String placeManagementWrite() {
		return "admin/pages/tables/placeManagementWrite";
	}
	
	//공지사항관리 페이지
	@RequestMapping("/admin/pages/tables/boardManagement.do")
	public String boardManagement() {
		return "admin/pages/tables/boardManagement";
	}
	//공지사항글쓰기 페이지
	@RequestMapping("/admin/pages/tables/boardManagementWrite.do")
	public String boardManagementWrite() {
		return "admin/pages/tables/boardManagementWrite";
	}
	
	
	//이벤트 게시판 관리 페이지
	@RequestMapping("/admin/pages/tables/eventManagement.do")
	public String eventManagement() {
		return "admin/pages/tables/eventManagement";
	}
	//이벤트 게시판 관리 페이지
	@RequestMapping("/admin/pages/tables/eventManagementWrite.do")
	public String eventManagementWrite() {
		return "admin/pages/tables/eventManagementWrite";
	}
	
	
	//레시피 게시판 관리 페이지
	@RequestMapping("/admin/pages/tables/recipeManagement.do")
	public String recipeManagement() {
		return "admin/pages/tables/recipeManagement";
	}
	
	@RequestMapping("/admin/pages/ui-features/buttons.do")
	public String buttons() {
		return "admin/pages/ui-features/buttons";
	}
	
	
	@RequestMapping("/admin/pages/ui-features/typography.do")
	public String typography() {
		return "admin/pages/ui-features/typography";
	}
	
	
	
	

}
