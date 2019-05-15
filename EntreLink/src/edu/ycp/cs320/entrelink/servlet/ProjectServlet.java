package edu.ycp.cs320.entrelink.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.entrelink.controller.PostController;
import edu.ycp.cs320.entrelink.model.Post;

public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PostController controller = null;	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		session.getAttribute("loggedInName");
		req.setAttribute("errorMessage", "");
		
		System.out.println("Project Servlet: doGet");	

		//posts most recent things
		ArrayList<Post> posts = null;
		String errorMessage   = null;

		controller = new PostController();

		// get list of posts returned from query
		posts = controller.getAllPosts(3);

		// Add result objects as request attributes
		req.setAttribute("errorMessage", errorMessage);
		req.setAttribute("posts", posts);
		
		req.getRequestDispatcher("/_view/projects.jsp").forward(req, resp);
	}	
	protected void doOpenProjects(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		System.out.println("test");
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
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("Project Servlet: doGet");	
		String filtering = req.getParameter("filterBy");
		System.out.println("Displaying only: " + filtering);
		
		// getting the http session
		HttpSession session=req.getSession();
		session.getAttribute("loggedInName");
		
		//posts most recent things
		ArrayList<Post> posts = null;

		controller = new PostController();

		// get list of posts returned from query
		//posts = controller.getAllPosts("student");
		if(filtering.equals("Business Proposals")) {
			posts = controller.getAllPosts(2);
		}
		else if(filtering.equals("Student Proposals")) {
			posts = controller.getAllPosts(0);
		}
		else if(filtering.equals("Student Skills")) {
			posts = controller.getAllPosts(1);
		}
		else {
			posts = controller.getAllPosts(3);
		}
		
		req.setAttribute("posts", posts);
		
		session.setAttribute("filterBy", filtering);
		req.getRequestDispatcher("/_view/projects.jsp").forward(req, resp);
		
	}
}
