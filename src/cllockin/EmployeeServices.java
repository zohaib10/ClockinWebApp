package cllockin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class EmployeeServices {

	@RequestMapping (value="/saveEmployee",method=RequestMethod.POST)
	public String saveEmployee(HttpServletRequest req, ModelMap map) {
		
		System.out.println(req.getSession().getAttribute("businessid"));
		
		EmployeeModel emp = new EmployeeModel(req.getParameter("fname"),req.getParameter("lname"),
				req.getParameter("email"),req.getParameter("phonenumber"), req.getParameter("password"),
				(int)req.getSession().getAttribute("businessid"),"Yes", 0);
		
		new EmployeeDAO().insertNewEmployee(emp);
		
		
		return "redirect:/returnManageEmployees";
	}
	
	@RequestMapping (value="/viewEmployee",method=RequestMethod.POST)
	public String viewEmployee(HttpServletRequest req, ModelMap map) {
		EmployeeModel emp = new EmployeeDAO().getEmployee(Integer.parseInt(req.getParameter("param1")));
		map.addAttribute("employee", emp);
		return "viewemployee";
	}
	
	

}


