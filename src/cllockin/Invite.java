package cllockin;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

 
public class Invite {
	
	//sending email
//	final String uname = "syntelsrms@gmail.com";
//	final String pwd = "Syntel123$";
	
	public void sendEmail(EmailModel emailContent) {  
      
		//login information for sending email
		final String uname = "zohaib.m.ahmad@gmail.com";
		final String pwd = "shito564";
		String destnmailid = "zohaib.m.ahmad@gmail.com";
		String smtphost = "smtp.gmail.com";
		System.out.println("Email: " + destnmailid);
		Properties propvls = new Properties();
		propvls.put("mail.smtp.auth", "true");
		propvls.put("mail.smtp.starttls.enable", "true");
		propvls.put("mail.smtp.host", smtphost);
		propvls.put("mail.smtp.port", "587");
      
		Session sessionobj = Session.getInstance(propvls,
				
			new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(uname, pwd);
            
			}
        });
 
		try {
			
			//email object instantiation
			Message messageobj = new MimeMessage(sessionobj);
			messageobj.setFrom(new InternetAddress(uname));
			messageobj.setRecipients(Message.RecipientType.TO,InternetAddress.parse(destnmailid));
			messageobj.setSubject("AEON Customer Service");
			
			//HTML formatting of email
			String rsvHTML = "<h1><font color=#E85200>AEON.Hour,</h1>";
		    rsvHTML += "<h2><font color=#E85200>From Customer Service!</h2><br>";
		    rsvHTML += "<table style='width:100%; font-size:150%;'>"
			    			+ "<tr><td>Name: "+ emailContent.getName() + "</td></tr>"
			    			+ "<tr><td>Email: "+ emailContent.getEmail() + " </td></tr>"
			    			+ "<tr><td>Message: "+ emailContent.getMessage() + "</td></tr>"
			    			+ "</tr></table>";
		    
		    
    		//set HTML
    		messageobj.setContent(rsvHTML, "text/html");
    		
    		//send email
    		Transport.send(messageobj);
    		System.out.println("Your email sent successfully....");
    		
		} catch (MessagingException exp) {
			
			throw new RuntimeException(exp);
		}
	}
	
	public void sendPassword(String destnmailid, String password) {  
	      
		//login information for sending email
		final String uname = "zohaib.m.ahmad@gmail.com";
		final String pwd = "shito564";
		String smtphost = "smtp.gmail.com";
		System.out.println("Email: " + destnmailid);
		Properties propvls = new Properties();
		propvls.put("mail.smtp.auth", "true");
		propvls.put("mail.smtp.starttls.enable", "true");
		propvls.put("mail.smtp.host", smtphost);
		propvls.put("mail.smtp.port", "587");
      
		Session sessionobj = Session.getInstance(propvls,
				
			new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(uname, pwd);
            
			}
        });
 
		try {
			
			//email object instantiation
			Message messageobj = new MimeMessage(sessionobj);
			messageobj.setFrom(new InternetAddress(uname));
			messageobj.setRecipients(Message.RecipientType.TO,InternetAddress.parse(destnmailid));
			messageobj.setSubject("AEON Password retrieval");
			
			//HTML formatting of email
			String rsvHTML = "<h1><font color=#E85200>AEON.Hour,</h1>";
		    rsvHTML += "<table style='width:100%; font-size:150%;'>"
			    			+ "<tr><td>Your Email: "+ destnmailid + "</td></tr>"
			    			+ "<tr><td>Your Password: "+ password + " </td></tr>";
		    
		    
    		//set HTML
    		messageobj.setContent(rsvHTML, "text/html");
    		
    		//send email
    		Transport.send(messageobj);
    		System.out.println("Your email sent successfully....");
    		
		} catch (MessagingException exp) {
			
			throw new RuntimeException(exp);
		}
	}
}