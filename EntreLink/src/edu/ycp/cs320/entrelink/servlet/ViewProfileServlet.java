package edu.ycp.cs320.entrelink.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.entrelink.controller.UserController;
import edu.ycp.cs320.entrelink.model.Post;
import edu.ycp.cs320.entrelink.model.User;

public class ViewProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserController controller = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.getAttribute("loggedInName");
		Boolean sessionExists = session.isNew();
		req.setAttribute("errorMessage", "");
		
		// Error message parameter
		String errorMessage = "";
        
		controller = new UserController();
		
		String parseURL = req.getPathInfo();
		parseURL = parseURL.substring(1, parseURL.length());
		int userID = 0;
		
		try {
			userID = Integer.parseInt(parseURL);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		session.setAttribute("userID", parseURL);
		
		System.out.println("View Profile Servlet: doGet");
		System.out.println("User ID: " + userID);
		
		// the user we will be getting
		User user;
		
		user = controller.getUserFromId(userID);
		
		if(user == null) {
			errorMessage = "The user does not exist.";
			System.out.println("Error: Invalid user");
		}
		else {
			System.out.println("Successfully retrieved data for user ID '" + userID + "'");
		}
		req.setAttribute("userv", user);

		req.getRequestDispatcher("/_view/viewProfile.jsp").forward(req, resp);
	
	}
}