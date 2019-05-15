package edu.ycp.cs320.entrelink.model;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.entrelink.controller.MessageController;

public class Message {

	private int msgId;
	private int sender;
	private int recipient;
	private String dateSent;
	private String subject;
	private String body;
	private int read; //1=read; 0=unread
	
	// some other variables
	private String senderName;
	private String recipientName;
	
	public Message() {
		
	}
	
	// setters
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public void setRecipient(int recipient) {
		this.recipient = recipient;
	}
	public void setDate(String date) {
		this.dateSent = date;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public void setMessageId(int id) {
		this.msgId = id;
	}
	public void setRecipientName(String name) {
		recipientName = name;
	}
	public void setSenderName(String name) {
		senderName = name;
	}
	
	// getters
	public String getSubject() {
		return this.subject;
	}
	public String getBody() {
		return this.body;
	}
	public int getSender() {
		return this.sender;
	}
	public int getRecipient() {
		return this.recipient;
	}
	public String getDate() {
		return this.dateSent;
	}
	
	public int getRead() {
		return this.read;
	}
	public int getMessageId() {
		return this.msgId;
	}
	public String getRecipientName() {
		return this.recipientName;
	}
	public String getSenderName() {
		return this.senderName;
	}
	
	public void postMessages(HttpServletRequest req) {
		HttpSession session=req.getSession();
		
		int userId = (int) session.getAttribute("loggedInId");
			
		
		// Loading all the messages for the logged in user...
		ArrayList<Message> messages = null;
		String errorMessage = null;
		MessageController controller = new MessageController();
		
		// get list of messages returned from query
		messages = controller.getAllMessagesForLoggedInUser(userId);
		if(messages.size() == 0) messages = null;
		// Add result objects as request attributes
		req.setAttribute("errorMessage", errorMessage);
		req.setAttribute("messages", messages);
	}
	
}
