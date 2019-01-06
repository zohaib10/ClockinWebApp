package cllockin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String date1 = sdf.format(date);
		EmployeeModel emp = new EmployeeModel(req.getParameter("fname"),req.getParameter("lname"),
				req.getParameter("email"),req.getParameter("phonenumber"), req.getParameter("password"),
				(int)req.getSession().getAttribute("businessid"),"Yes", 0,date1, Double.parseDouble(req.getParameter("hourlyRate")));
		
		new EmployeeDAO().insertNewEmployee(emp);
		
		
		return "redirect:/returnManageEmployees";
	}
	
	@RequestMapping (value="/viewEmployee",method=RequestMethod.POST)
	public String viewEmployee(HttpServletRequest req, ModelMap map) {
		if(!(req.getParameter("firstName") == null)){
			EmployeeModel employee = new EmployeeModel(req.getParameter("firstName"),req.getParameter("lastName"),
					req.getParameter("accountEmail"),req.getParameter("phone"),req.getParameter("password"),
					Integer.parseInt(req.getParameter("busid")),req.getParameter("activeCheck"),
					Integer.parseInt(req.getParameter("param1")),
					req.getParameter("date"),Double.parseDouble(req.getParameter("hourlyRate")));
			new EmployeeDAO().updateEmployee(employee);
			System.out.println(employee.toString());
		}
		String busName = new BusinessDAO().getBusinessName(Integer.parseInt(req.getParameter("busid")));
		map.addAttribute("businessName", busName);
		EmployeeModel emp = new EmployeeDAO().getEmployee(Integer.parseInt(req.getParameter("param1")));
		map.addAttribute("employee", emp);
		
		return "viewemployee";
	}
	
	@RequestMapping (value="/saveEdited",method=RequestMethod.POST)
	public String view1Employee(HttpServletRequest req, ModelMap map) {
		System.out.println(req.getParameter("firstName"));
		System.out.println(req.getParameter("lastName"));
		System.out.println(req.getParameter("phone"));
		System.out.println(req.getParameter("activeCheck"));
		System.out.println(req.getParameter("param1"));
		System.out.println(req.getParameter("hourlyRate"));
		System.out.println(req.getParameter("accountEmail"));
		System.out.println(req.getParameter("ppHours"));
		System.out.println(req.getParameter("password"));
		System.out.println(req.getParameter("ytd"));
		System.out.println(req.getParameter("busid"));
		
		EmployeeModel employee = new EmployeeModel(req.getParameter("firstName"),req.getParameter("lastName"),
				req.getParameter("accountEmail"),req.getParameter("phone"),req.getParameter("password"),
				Integer.parseInt(req.getParameter("busid")),req.getParameter("activeCheck"),
				Integer.parseInt(req.getParameter("param1")),
				req.getParameter("date"),Double.parseDouble(req.getParameter("hourlyRate")));
		System.out.println(employee.toString());
		EmployeeModel emp = new EmployeeDAO().getEmployee(Integer.parseInt(req.getParameter("param1")));
		map.addAttribute("employee", emp);
		return "viewemployee";
	}
	
	
	
	
	
	
	

}


