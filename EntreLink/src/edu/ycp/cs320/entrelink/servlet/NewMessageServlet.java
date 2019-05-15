package edu.ycp.cs320.entrelink.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.entrelink.controller.MessageController;
import edu.ycp.cs320.entrelink.controller.PostController;
import edu.ycp.cs320.entrelink.controller.UserController;
import edu.ycp.cs320.entrelink.model.DateModifier;
import edu.ycp.cs320.entrelink.model.Message;

public class NewMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MessageController controller = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		session.getAttribute("loggedInName");
		req.setAttribute("errorMessage", "");
		
		System.out.println("New Message Servlet: doGet");
		
		req.getRequestDispatcher("/_view/newMessage.jsp").forward(req, resp);
	}	
	protected void doOpenProjects(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.getRequestDispatcher("/_view/projects.jsp").forward(req, resp);
	}
	protected void doOpenProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.getRequestDispatcher("/_view/profile.jsp").forward(req, resp);
	}
	protected void doOpenSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.getRequestDispatcher("/_view/search.jsp").forward(req, resp);
	}
	protected void doOpenHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.getRequestDispatcher("/_view/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("New Message Servlet: doPost");

		// code for inserting new message

		HttpSession session=req.getSession();
		session.getAttribute("loggedInId");
		DateModifier d = new DateModifier();
		UserController u = new UserController();
		
		// variables and stuff
		String errorMessage 	= null;
		String successMessage	= null;
		int sender 		= 0;
		int recipient 	= 0;
		String date 	= d.getCurrentDate();
		String subject 	= null;
		String body 	= null;
		
		// returns user id of a user that matches username or email
		recipient = u.getUserIdFromEmailOrUsername(req.getParameter("msgRecipient"));
		
		// decode from parameters
		sender		= (int)session.getAttribute("loggedInId");
		subject		= req.getParameter("msgSubject");
		body		= req.getParameter("msgBody");

		req.setAttribute("msgRecipient", req.getParameter("msgRecipient"));
		req.setAttribute("msgSubject", subject);
		req.setAttribute("msgBody", body);
		
		if(sender 	== 0 	|| recipient == 0 ||
		   subject 	== null || subject.equals("") ||
		   body 	== null || body.equals("")) {
			
			errorMessage = "Please fill in all of the required fields.";
			session.setAttribute("errorMessage", errorMessage);
			req.getRequestDispatcher("/_view/newMessage.jsp").forward(req, resp);
		} else {
			session.setAttribute("errorMessage", "");
			
			controller = new MessageController();
			if (controller.sendMessage(sender, recipient, date, subject, body) != null) {
				System.out.println("Successfully inserted message.");
			}
			else {
				errorMessage = "ERROR: Post was not successfully inserted. I wonder why?";
				session.setAttribute("errorMessage", errorMessage);
				System.out.println(errorMessage);
			}
			req.setAttribute("errorMessage", errorMessage);
			
			// loads the messages for the next thing
			Message m = new Message();
			m.postMessages(req);
			req.getRequestDispatcher("/_view/messages.jsp").forward(req, resp);
		}


	}
}
