package cllockin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashboardServices {
	
	@RequestMapping (value="/logoutuser",method=RequestMethod.GET)
	public String logoutUser(ModelMap map, HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		map.addAttribute("tried", 2);
		map.addAttribute("message", 2);
		map.addAttribute("forgotPasswordEmail", 2);
		map.addAttribute("emailExists", 2);
		map.addAttribute("incorrectPass", 2);
		return "HomePage";
	}
	
	@RequestMapping(value="returnManageEmployees", method=RequestMethod.GET)
	public String returnEmployeeManagementPage(ModelMap map, HttpServletRequest req) {
		ArrayList<EmployeeModel> emp = new EmployeeDAO().getAllEmployees((Integer)req.getSession().getAttribute("businessid"));
		map.addAttribute("employeeList", emp);
		return "manageEmployees";
	}
	
	
	@RequestMapping(value="checkAdminPassword", method=RequestMethod.POST)
	public String checkAdminPassword(HttpServletRequest req, ModelMap map) {
		System.out.println(req.getParameter("admin-pass-verify"));
		System.out.println(req.getSession().getAttribute("businessid"));
		if(new BusinessDAO().isValidAdmin(req.getParameter("admin-pass-verify"),(Integer)req.getSession().getAttribute("businessid"))) {
			return "redirect:/returnManageEmployees";
		}else {
			BusinessModel buss = new BusinessDAO().getBusinessDetails((Integer)req.getSession().getAttribute("businessid"));
			System.out.println(buss.toString());
			map.addAttribute("businessaccount",buss);
			map.addAttribute("incorrectAdminPass", 1);
			return "Dashboard";
		}
	}
	

	@RequestMapping (value="checkUserPassword",method=RequestMethod.POST)
	public String usePass(ModelMap map, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("user-pass-verify"));
		System.out.println(request.getParameter("type"));
		
		return "Dashboard";
	}
}
