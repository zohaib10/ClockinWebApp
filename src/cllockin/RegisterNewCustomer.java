package cllockin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterNewCustomer {

	@RequestMapping (value="/newUserRegister", method=RequestMethod.POST)
	public String newUserInformation(ModelMap map,HttpServletRequest req, HttpServletResponse res) {
		map.addAttribute("incorrectAdminPass", 2);
		if(!(new BusinessDAO().doesAccountExist(req.getParameter("aemail")))) {
			BusinessModel newBusiness = new BusinessModel(req.getParameter("fname"), req.getParameter("lname"), 
					req.getParameter("aemail"), req.getParameter("apassword"), req.getParameter("bname"), 
					req.getParameter("aphone"), req.getParameter("pperiod"), req.getParameter("atype"));
			int busid = new BusinessDAO().insertNewRecord(newBusiness);
			req.getSession().setAttribute("businessid", busid);
			map.addAttribute("businessaccount",newBusiness);
			return "Dashboard";
		}else {
			req.getSession().setAttribute("emailExists", "1");
			System.out.println("Going to new User");
			return "redirect:/newUser";
		}
		
	}
	
}
