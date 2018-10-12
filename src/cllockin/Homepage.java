package cllockin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller



public class Homepage {
	
	
	
	@RequestMapping (value="/",method=RequestMethod.GET)
	public String sayHello(ModelMap map,HttpServletRequest request, HttpServletResponse response) {
		map.addAttribute("tried", 2);
		map.addAttribute("message", 2);
		map.addAttribute("forgotPasswordEmail", 2);
		map.addAttribute("emailExists", 2);
		if(request.getSession().getAttribute("tried") != null && request.getSession().getAttribute("tried").equals("1")) {
			map.addAttribute("tried", 1);
			request.getSession().setAttribute("tried", "2");
		}
		if(request.getSession().getAttribute("message") != null && request.getSession().getAttribute("message").equals("1")) {
			map.addAttribute("message", 1);
			request.getSession().setAttribute("message", "2");
		}
		if(request.getSession().getAttribute("forgotPasswordEmail") != null 
				&& request.getSession().getAttribute("forgotPasswordEmail").equals("1")) {
			map.addAttribute("forgotPasswordEmail", 1);
			request.getSession().setAttribute("forgotPasswordEmail", "2");
		}
		
		
		return "HomePage";
	}
	
	@RequestMapping (value="/loginOnUserName",method=RequestMethod.POST)
	public String LoginClicked(ModelMap map, HttpServletRequest req, HttpServletResponse res ) {
		map.addAttribute("incorrectAdminPass", 2);
		if(new BusinessDAO().isUserValid(req.getParameter("useremail"),req.getParameter("userpassword"))) {
			int bussid = new BusinessDAO().getbusinessid(req.getParameter("useremail"),req.getParameter("userpassword"));
			req.getSession().setAttribute("businessid", bussid);
			BusinessModel buss = new BusinessDAO().getBusinessDetails(bussid);
			map.addAttribute("businessaccount",buss);
			return "Dashboard";
		}else {
			req.getSession().setAttribute("tried", "1");
			return "redirect:/";
		}
	}
	
	@RequestMapping (value="/newUser", method=RequestMethod.GET)
	public String newUserPageRender(ModelMap map, HttpServletRequest request) {
		System.out.println("In new User");
		map.addAttribute("emailExists", 2);
		if(request.getSession().getAttribute("emailExists") != null 
				&& request.getSession().getAttribute("emailExists").equals("1")) {
			map.addAttribute("emailExists", 1);
			request.getSession().setAttribute("emailExists", "2");
		}
		System.out.println("HERE");
		return "newUserForm";
	}
	
	@RequestMapping (value="/contactUs", method=RequestMethod.POST)
	public String renderContactUs() {
		return "contactus";
	}
	
	@RequestMapping (value="/contactUsForm", method=RequestMethod.POST)
	public String sendContactUsMessage(HttpServletRequest req, HttpServletResponse res) {
		new Invite().sendEmail(new EmailModel(req.getParameter("name"),req.getParameter("email"),req.getParameter("message")));
		req.getSession().setAttribute("message", "1");
		return "redirect:/";
	}
	
	@RequestMapping(value="sendForgotPasswordEmail", method=RequestMethod.POST)
	public String sendForgotPassEmail(HttpServletRequest req) {
		System.out.println(req.getParameter("email-for-forgotPass"));
		String password = new BusinessDAO().getPasswordWithEmail(req.getParameter("email-for-forgotPass"));
		System.out.println(password);
		if(!password.equals("GhakrayAriBan")) {
			new Invite().sendPassword(req.getParameter("email-for-forgotPass"), password);
		}
		req.getSession().setAttribute("forgotPasswordEmail", "1");
		return "redirect:/";
	}
	
	



}
