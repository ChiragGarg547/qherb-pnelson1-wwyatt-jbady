package edu.ycp.cs320.entrelink.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ycp.cs320.entrelink.controller.LoginController;
import edu.ycp.cs320.entrelink.model.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		System.out.println("Login Servlet: doGet");	
		
		// call JSP to generate empty form
		req.getRequestDispatcher("/_view/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Login Servlet: doPost");
		

		// holds the error message text, if there is any
		String errorMessage = null;

		// result of calculation goes here
		
		//create User model and login controller
		User model = new User();
		LoginController controller = new LoginController();
		controller.setModel(model);
		
		
		// decode POSTed form parameters and dispatch to controller
		// there was a try block here but I deleted it
			String email = req.getParameter("emailAsUsername");
			String password = req.getParameter("passwordOfUser");
			model.setEmail(email);
			model.setPassword(password);
			System.out.print(model.getEmail() + " - " + model.getPassword());

			// check for errors in the form data before using is in a calculation
			boolean isUser = controller.verifyUser();
			System.out.println(isUser);
			if(!isUser) {
				errorMessage = "The username or password is incorrect.";
			}
			// otherwise, log the user in
			else {
				model.setIsLoggedIn(true);
				req.setAttribute("loggedInName", controller.getModel().getUserFirstName() + " " + controller.getModel().getUserLastName());
			}
		
		// add result objects as attributes
		// this adds the errorMessage text and the result to the response
		req.setAttribute("errorMessage", errorMessage);
		
		// Forward to view to render the result HTML document
		req.getRequestDispatcher("/_view/login.jsp").forward(req, resp);
	}

	
}
