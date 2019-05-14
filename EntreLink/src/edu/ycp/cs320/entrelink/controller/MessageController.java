package edu.ycp.cs320.entrelink.controller;

import java.util.ArrayList;

import edu.ycp.cs320.entrelink.model.Message;
import edu.ycp.cs320.entrelink.userdb.persist.DerbyDatabase;

public class MessageController {

	private DerbyDatabase db;
	Message message;
	
	public MessageController() {
		db = new DerbyDatabase();
	}

	public ArrayList<Message> getAllMessagesForLoggedInUser(int userId) {
		ArrayList<Message> messages = new ArrayList<Message>();
		
		System.out.println("Getting all messages for user ID " + userId + "...");
		
		messages = db.getAllMessagesForLoggedInUser(userId);
		
		if(messages == null) {
			System.out.println("No messages found.");
		} else {
			System.out.println("Found " + messages.size() + " messages!");
		}
		
		return messages;
	}

	public Message sendMessage(int sender, int recipient, String date, String subject, String body) {
		Message m = new Message();
		System.out.println("Sending message...");
		
		m = db.sendMessage(sender, recipient, date, subject, body);
		return m;
	}
}
