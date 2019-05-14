package edu.ycp.cs320.entrelink.model;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import edu.ycp.cs320.entrelink.controller.PostController;

public class Post {
	
	// User-related fields
	private int posterId;
	private String name;
	
	// Everything else
	private String timePosted;
	private int postId;
	private String postTitle;
	private String postDescription;
	private String tags;
	private int postType; //0 = student post; 1 = student skill(s); 2 = business post
	
	public Post() {
		
	}
	public Post(User user, String timePosted, String postTitle, String postDescription, String tags, int postType) {
		// User-related fields
		posterId = user.getUserId();
		name = user.getUserFirstName() + " " + user.getUserLastName();
		
		// Everything else
		this.timePosted = timePosted;
		this.postTitle = postTitle;
		this.postDescription = postDescription;
		this.tags = tags;
		this.postType = postType;
	}
	
	// Set and get for post type
	public void setPostType(int postType) {
		this.postType = postType;
	}
	
	public int getPostType() {
		return postType;
	}
	
	// Set and get for poster ID
	public void setPosterId(int posterId) {
		this.posterId = posterId;
	}
	public int getPosterId() {
		return posterId;
	}

	// Set and get for name
	public void setName(String firstname, String lastname) {
		name = firstname + " " + lastname;
	}
	public String getName() {
		return name;
	}

	// Set and get for time posted
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public String getTimePosted() {
		return timePosted;
	}
	
	// Set and get for post ID
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getPostId() {
		return postId;
	}
	
	// Set and get for post title
	public void setTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getTitle() {
		return postTitle;
	}
	
	// Set and get for post description
	public void setDescription(String description) {
		postDescription = description;
	}
	public String getDescription() {
		return postDescription;
	}
	
	
	// Everything that has to do with tags
	
	public String getTags() {
		return tags;
	}
	
	public void setTags(String tags) {
		this.tags = tags;
	}
	
	// turns out, we might not actually need these
	/*public void setTags(ArrayList<String> tags) {
		this.tags = tags;
	}
	public ArrayList<String> getTags() {
		return tags;
	}
	public void addTags(ArrayList<String> tags) {
		this.tags.addAll(tags);
	}
	
	public void removeTags(ArrayList<Integer> index) {
		for(int i = 0; i < tags.size(); i++) {
			for(int j = 0; j < index.size(); j++) {
				if(i == j) {
					tags.remove(i);
				}
			}
		}
	}*/
	
	public ArrayList<String> separateTags(String tags) {
		String[] list = tags.split(" ");
		ArrayList<String> aList = new ArrayList<String>(Arrays.asList(list));
		return aList;
	}
	
	public void postPosts(HttpServletRequest req) {
		//posts most recent things
		ArrayList<Post> posts = null;
		ArrayList<Post> bPosts = null;
		String errorMessage2 = null;

		PostController controller2 = new PostController();

		// get list of authors returned from query
		posts = controller2.getAllPosts(4);
		bPosts = controller2.getAllPosts(2);

		// any authors found?
		if (posts == null) {
			errorMessage2 = "No Posts were found in the Library";
		}

		// Add result objects as request attributes
		req.setAttribute("errorMessage", errorMessage2);
		req.setAttribute("posts", posts);
		req.setAttribute("bPosts", bPosts);
	}
}
