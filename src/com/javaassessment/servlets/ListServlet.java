package com.javaassessment.servlets;

import static com.javaassessment.utils.Utils.loadPage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//This sevlet reads response, loads listPage.jsp and prints some outputs via logger in method "log)
		log("Logger started");
		PrintWriter out = response.getWriter();
		log("Writer obtained");
		String page = "listPage.jsp";
		loadPage(request, response, page);
		log("\"listPage.jsp\" loaded");
		out.close();
		log("Printer closed!");
	}
}
