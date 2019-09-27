package command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.product.ProductDAO;

public class AdProductDeleteActionCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//폼값받기
		String product_code = req.getParameter("product_code");
		System.out.println("파라미터에서 받은 product_code:"+product_code);
		ProductDAO dao = new ProductDAO();
		dao.delete(product_code);
		
	}

}
