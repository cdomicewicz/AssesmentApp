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
		
		//This servlet checks data entered by user and switches between listPage.jsp and newRecordPage.jsp
		log("Logger started");
		PrintWriter out = response.getWriter();
		String returnMessage = "Empty field", page, author, title, isbn;;
		
		//MESSAGE = "(VALIDATION ERROR: Name or surname must start with \"A\"!)";
		//parameterAuthor may contain information about invalid author (MESSAGE) if this servlet is called again so MESSAGE must be removed
		String parameterAuthor = request.getParameter("author").replace(Utils.MESSAGE, "");
		
		
		//getFullName and checkEntry from class Book allow to obtain valid values or default values by using returnMessage
		author = Book.getFullName(parameterAuthor);
		title = Book.checkEntry(request.getParameter("title"), returnMessage);
		isbn = Book.checkEntry(request.getParameter("isbn"), returnMessage);
		log("Fields: author, title, isbn obtained!");

		/*Control flow: if... author name is correct (one of the words starts with capital "A") then new book is created and it's added to static
		list of all books in Book class
		"listPage.jsp will be loaded outside if-else statement*/
		if (Book.validateName(author) && !title.equals(returnMessage) && !isbn.equals(returnMessage)) {
			author = Book.getFullName(author);
			log("Author name validated");
			Book.createBook(author, title, isbn);
			page = "listPage.jsp";
//			page = "/listPage.jsp";
		} else {
			/*Control flow: else... new attribute is set to "error" and again "newRecordPage.jsp" will be loaded outside if-else statement
				*/
			log("Validation of author name failed");
			request.setAttribute("author_validation", "Validation of author name failed - name must start with letter \"A\"");
			request.setAttribute("title", title);
			request.setAttribute("isbn", isbn);
			request.setAttribute("author_origin", author);
//			page = "newRecordPage.jsp";
			page = "newRecordPage.jsp";
		}
		//page selected in if-else statement will be loaded
		Utils.loadPage(request, response, page);
		out.close();
		log("Printer closed!");
	}
	
}