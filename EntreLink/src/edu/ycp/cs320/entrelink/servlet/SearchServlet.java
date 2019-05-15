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

public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PostController controller = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		session.getAttribute("loggedInName");
		req.setAttribute("errorMessage", "");
		
		System.out.println("Search Servlet: doGet");
		System.out.println("Searched text: " + req.getAttribute("searchText"));
		
		req.getRequestDispatcher("/_view/search.jsp").forward(req, resp);
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
		
		String search = req.getParameter("search");
		req.setAttribute("search", req.getParameter("search"));
		System.out.println("\nSearchServlet: doPost");
		HttpSession session=req.getSession();
		session.getAttribute("loggedInName");
		System.out.println("Searched text: " + search);
		
		controller = new PostController();
		ArrayList<Post> posts;
		
		posts = controller.searchPostsByTitle(search);
		
		if(posts == null || posts.isEmpty()) posts = null;
		req.setAttribute("posts", posts);
		
		req.getRequestDispatcher("/_view/search.jsp").forward(req, resp);
	}
}
