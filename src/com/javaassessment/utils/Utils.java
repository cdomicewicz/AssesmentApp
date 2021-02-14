package com.javaassessment.utils;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.javaassessment.servlets.ListServlet;


//Utils is an utility class that collects useful methods that are used in servlets etc.
public class Utils {

	//Fileds used in other classes
	public static final String MESSAGE_FAILED = "Validation of author name failed - name must start with letter \"A\"";
	public static final String MESSAGE_CORRECT = "correct";
	public static final String EMPTY_FIELD = "Empty field";
	
	//Method allows logging to console
	public static void log(String message) {
		BasicConfigurator.configure();
		Logger logger = Logger.getLogger(ListServlet.class);
		logger.setLevel(Level.DEBUG);
		logger.info(message);
		LogManager.shutdown();
	}
	
	//Method allows loading jsp files
	public static void loadPage(HttpServletRequest request, HttpServletResponse response, String page)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		log("\\" + page +"\\ loaded!");
	}
	
}
