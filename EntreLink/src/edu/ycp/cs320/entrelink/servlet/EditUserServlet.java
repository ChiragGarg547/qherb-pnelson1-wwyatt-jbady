package edu.ycp.cs320.entrelink.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.entrelink.controller.LoginController;
import edu.ycp.cs320.entrelink.controller.PostController;
import edu.ycp.cs320.entrelink.controller.SignupController;
import edu.ycp.cs320.entrelink.controller.UserController;
import edu.ycp.cs320.entrelink.model.Post;
import edu.ycp.cs320.entrelink.model.User;

public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		session.getAttribute("loggedInName");
		Boolean sessionExists = session.isNew();
		req.setAttribute("errorMessage", "");
        
		
		System.out.println("Edit User Servlet: doGet");
		
		req.getRequestDispatcher("/_view/editUser.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Edit User Servlet: doPost");
		
		HttpSession session=req.getSession();
		session.getAttribute("loggedInName");

		// holds the error message text, if there is any
		String errorMessage = null;

		// decode POSTed form parameters and dispatch to controller
		// there was a try block here but I deleted it
			String picture = req.getParameter("loggedInImg");
			String bio = req.getParameter("loggedInBio");
			String major = req.getParameter("loggedInMajor");
			String status = req.getParameter("loggedInStatus");
			String interests = req.getParameter("loggedInInterests");
			String skills = req.getParameter("loggedInSkills");
			String website = req.getParameter("loggedInWebsite");
			System.out.println(website + " this is website");
			
			int id = (int)session.getAttribute("loggedInId");
			
			if(picture.equals(" ") || picture.equals("") || picture == null) {
				picture = "https://i.imgur.com/46FYTE7.png";
			}
			
			UserController controller = new UserController();
			
			if(controller.editProfile(id, picture, bio, major, status, interests, skills, website) != null) {
				System.out.println("Profile successfully updated.");
				session.setAttribute("loggedInInterests", interests);
				session.setAttribute("loggedInImg", picture);
				session.setAttribute("loggedInBio", bio);
				session.setAttribute("loggedInMajor", major);
				session.setAttribute("loggedInStatus", status);
				session.setAttribute("loggedInSkills", skills);
				session.setAttribute("loggedInWebsite", website);
				
			} else {
				System.out.println("Error updating profile.");
			}
			
			ArrayList<Post> posts = null;

			PostController controller2 = new PostController();

			// get list of posts returned from query
			System.out.println(session.getAttribute("loggedInUserName").toString());
			posts = controller2.searchPostsByUserName(session.getAttribute("loggedInUserName").toString());
			//posts.addAll(controller.getAllPosts("business"));
			if(posts.size() == 0) posts = null;
			
			if (posts == null) {
				errorMessage = "No Posts were found in the Library";
			}
			req.setAttribute("posts", posts);
			
			doOpenProfile(req, resp);
		
	}
	
	protected void doOpenProjects(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.getRequestDispatcher("/_view/projects.jsp").forward(req, resp);
	}
	protected void doOpenProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.getRequestDispatcher("/_view/profile.jsp").forward(req, resp);
	}
	protected void doOpenHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.getRequestDispatcher("/_view/index.jsp").forward(req, resp);
	}
}
