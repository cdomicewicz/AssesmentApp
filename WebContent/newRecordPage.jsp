<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.javaassessment.utils.Book"%>
<%@ page import="com.javaassessment.utils.Utils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Java Assessment - New record page</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
	<center>
		<h1>Java Assessment</h1>
		<h2>New record page</h2>
		<div class="bd-example" style="max-width: 50%;">
			<form method="post" action="NewRecordServlet">

				<%
				String message = Utils.MESSAGE_FAILED;
				// Fields are read form request
				String author_validation = (String) request.getAttribute("author_validation");
				String authorOrigin = ((String) request.getAttribute("author_origin"));
				String title = (String) request.getAttribute("title");
				String isbn = (String) request.getAttribute("isbn");

				// If there is ann error in author name
				if (author_validation != null && !author_validation.isEmpty()) {
					//When author is entered incorrectly then information in red will be displayed
					if (!author_validation.equals(Utils.MESSAGE_CORRECT)) {
						out.println(
						"<div class=\"mb-3\"><label for=\"author\" class=\"form-label\">Author:</label> <input type=\"text\" class=\"form-control\"	name=\"author\" id=\"author\" value =\""
								+ authorOrigin
								+ " \" aria-describedby=\"authorHelp\"><div id=\"authorHelp\" style=\"color: red;text-align: left;\" class=\"form-text\">"
								+ author_validation + "</div>");
					} else {
						//Otherwise data entered by user is displayed
						out.println("<input type=\"text\" class=\"form-control\"	name=\"author\" id=\"author\" value =\""
						+ authorOrigin + " \" aria-describedby=\"authorHelp\"/>");
					}
					
					//If usere didn't put any data in title or isbn an information in red will be displayed
					if (Utils.EMPTY_FIELD.equals(title)) {
						out.println(
						"<div class=\"mb-3\"><label for=\"title\" class=\"form-label\">Title:</label> <input type=\"text\" class=\"form-control\" name=\"title\" id=\"title\" aria-describedby=\"titleHelp\" value=\"\"><div id=\"titleHelp\" style=\"color: red;text-align: left;\" class=\"form-text\">"
								+ title + "</div>");
					} else {
						out.println(
						"<div class=\"mb-3\"><label for=\"title\" class=\"form-label\">Title:</label> <input type=\"text\" class=\"form-control\" name=\"title\" id=\"title\" aria-describedby=\"titleHelp\" value=\""
								+ title + "\"><div id=\"titleHelp\" class=\"form-text\"> </div>");
					}

					if (Utils.EMPTY_FIELD.equals(isbn)) {
						out.println(
						"<div class=\"mb-3\"><label for=\"isbn\" class=\"form-label\">ISBN:</label> <input type=\"text\" class=\"form-control\" name=\"isbn\" value=\"\" id=\"isbn\" aria-describedby=\"isbnHelp\"><div id=\"isbnHelp\" style=\"color: red;text-align: left;\" class=\"form-text\">"
								+ isbn + "</div>");
					} else {
						out.println(
						"<div class=\"mb-3\"><label for=\"isbn\" class=\"form-label\">ISBN:</label> <input type=\"text\" class=\"form-control\" name=\"isbn\" value=\""
								+ isbn
								+ "\" id=\"isbn\" aria-describedby=\"isbnHelp\"><div id=\"isbnHelp\" class=\"form-text\"> </div>");
					}
				
					//Submit button
					out.println("<button type=\"submit\" class=\"btn btn-primary\">Submit</button>");
				} else {
					// This fields are loaded when page is loaded
					out.println(
					"<div class=\"mb-3\"><label for=\"author\" class=\"form-label\">Author:</label> <input type=\"text\" class=\"form-control\"	name=\"author\" id=\"author\" aria-describedby=\"authorHelp\"><div id=\"authorHelp\" class=\"form-text\"> </div><div class=\"mb-3\"><label for=\"title\" class=\"form-label\">Title:</label> <input type=\"text\" class=\"form-control\" name=\"title\" id=\"title\" aria-describedby=\"titleHelp\"><div id=\"titleHelp\" class=\"form-text\"> </div><div class=\"mb-3\"><label for=\"isbn\" class=\"form-label\">ISBN:</label> <input type=\"text\" class=\"form-control\" name=\"isbn\" id=\"isbn\" aria-describedby=\"isbnHelp\"><div id=\"isbnHelp\" class=\"form-text\"> </div><button type=\"submit\" class=\"btn btn-primary\">Submit</button>");
				}
				%>
				<!-- 	<br> <br> <br> <input type="submit"> <br>
			<br> -->
			</form>
		</div>

		<!-- <a href="/listPage.jsp">Return -->
		<a href="/Books/listPage.jsp">Return 
	</center>
</body>
</html>