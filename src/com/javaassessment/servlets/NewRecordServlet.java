package com.javaassessment.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaassessment.utils.Book;
import com.javaassessment.utils.Utils;

public class NewRecordServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// This servlet checks data entered by user and switches between listPage.jsp
		// and newRecordPage.jsp
		log("Logger started");
		PrintWriter out = response.getWriter();
		String returnMessage = "Empty field", page, author, title, isbn;

		// getFullName and checkEntry from class Book allow to obtain valid values or
		// default values by using returnMessage
		author = Book.getFullName(request.getParameter("author").trim().replaceAll(" +", " "));
		title = Book.checkEntry(request.getParameter("title").trim().replaceAll(" +", " "), returnMessage);
		isbn = Book.checkEntry(request.getParameter("isbn").trim().replaceAll(" +", ""), returnMessage);
		log("Fields: author, title, isbn obtained!");

		/*
		 * Control flow: if... author name is correct (one of the words starts with
		 * capital "A") then new book is created and it's added to static list of all
		 * books in Book class "listPage.jsp will be loaded outside if-else statement
		 */
		if (Book.validateName(author) && !title.equals(returnMessage) && !isbn.equals(returnMessage)) {
			author = Book.getFullName(author);
			log("Author name validated");
			Book.createBook(author, title, isbn);
			page = "listPage.jsp";

		} else {
			/*
			 * Control flow: else... author_validation, title and isbn are set.
			 * "newRecordPage.jsp" will be loaded outside if-else statement
			 */
			
			String message;
			if (!Book.validateName(author)) {
				log("Validation of author name failed");
				message = Utils.MESSAGE_FAILED;
			} else {
				log("Author name validated");
				message = Utils.MESSAGE_CORRECT;
			}
			
			request.setAttribute("author_validation", message);
			request.setAttribute("title", title);
			request.setAttribute("isbn", isbn);
			request.setAttribute("author_origin", author);
			page = "newRecordPage.jsp";
		}
		// page selected in if-else statement will be loaded
		Utils.loadPage(request, response, page);
		out.close();
		log("Printer closed!");
	}

}