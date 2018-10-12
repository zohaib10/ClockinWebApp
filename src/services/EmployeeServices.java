package services;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import cllockin.EmployeeModel;

@Controller
public class EmployeeServices {

	@RequestMapping (value="saveEmployee",method=RequestMethod.POST)
	public String saveEmployee(@ModelAttribute("form")EmployeeModel emp) {
		System.out.println(emp.toString());
		
		return "manageEmployees";
	}




}


