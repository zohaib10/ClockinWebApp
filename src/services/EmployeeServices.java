package services;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import cllockin.EmployeeModel;

@Controller
public class EmployeeServices {

	@RequestMapping (value="/saveEmployee",method=RequestMethod.POST)
	public String saveEmployee(HttpServletRequest req) {
		System.out.println(req.getParameter("fname"));
		
		return "manageEmployees";
	}




}


