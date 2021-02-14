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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>
<body>
<center>
		<h1>Java Assessment</h1>
		<h2>New record page</h2>
		<div class="bd-example" style="max-width: 50%;">
		<form method="post" action="NewRecordServlet">

			<%
			//String message = "(VALIDATION ERROR: Name or surname must start with \"A\"!)";
			String message = Utils.MESSAGE;
			// Fields are read form request
			String author_validation = (String) request.getAttribute("author_validation");
			String authorOrigin = ((String) request.getAttribute("author_origin"));
			String title = (String) request.getAttribute("title");
			String isbn = (String) request.getAttribute("isbn");
			
			// If there is ann error in author name
			if(author_validation != null && !author_validation.isEmpty()) {
			//if((author_validation != null && !author_validation.isEmpty()) || author_validation.equals("correct")) {
				authorOrigin = authorOrigin.replace(message, "").trim();
				if (!author_validation.equals("correct")) {
					
					out.println("<div class=\"mb-3\"><label for=\"author\" class=\"form-label\">Author:</label> <input type=\"text\" class=\"form-control\"	name=\"author\" id=\"author\" value =\"" + authorOrigin +" \" aria-describedby=\"authorHelp\"><div id=\"authorHelp\" style=\"color: red;text-align: left;\" class=\"form-text\">" + author_validation + "</div>");
				} else {
					//out.println("<div class=\"mb-3\"><input type=\"text\" class=\"form-control\"	name=\"author\" id=\"author\" value =\"" + authorOrigin +" \" aria-describedby=\"authorHelp\"><div id=\"authorHelp\" style=\"color: red;text-align: left;\" class=\"form-text\">" + author_validation + "</div>");
					out.println("<input type=\"text\" class=\"form-control\"	name=\"author\" id=\"author\" value =\"" + authorOrigin +" \" aria-describedby=\"authorHelp\"/>");

					
				}
				//Additional message infor is removed
				//If user didn't put any author then in return message will be displayed
				//if(authorOrigin != null && authorOrigin.isEmpty()) {
				//	authorOrigin = message;
				//} 
				//If user put invalid auhtor then it will be displayed with addibional message
				//if(!authorOrigin.isEmpty() && !authorOrigin.contains(message)){
				//	authorOrigin = authorOrigin + " " + message;
				//}
				//Filed for author will be displayed in red color if something is wrong
					//out.println("<li>Author : <input type='text' class='redBorder' size='100' name='author' value='"+ authorOrigin +"'></li>");
				//if(title.isEmpty()) {
					if (Utils.EMPTY_FIELD.equals(title)) {
						out.println("<div class=\"mb-3\"><label for=\"title\" class=\"form-label\">Title:</label> <input type=\"text\" class=\"form-control\" name=\"title\" id=\"title\" aria-describedby=\"titleHelp\" value=\"\"><div id=\"titleHelp\" style=\"color: red;text-align: left;\" class=\"form-text\">" + title +"</div>");
					} else {
						out.println("<div class=\"mb-3\"><label for=\"title\" class=\"form-label\">Title:</label> <input type=\"text\" class=\"form-control\" name=\"title\" id=\"title\" aria-describedby=\"titleHelp\" value=\"" + title + "\"><div id=\"titleHelp\" class=\"form-text\"> </div>");
					}
					//Filed for title will be displayed in red color if it's empty
					//out.println("<li>Title : <input type='text' class='redBorder' size='100' name='title' value='"+ title +"'></li>");
					//out.println("<div class=\"mb-3\"><label for=\"title\" class=\"form-label\">Title:</label> <input type=\"text\" class=\"form-control\" name=\"title\" id=\"title\" aria-describedby=\"titleHelp\"><div id=\"titleHelp\" class=\"form-text\">" + title + "</div>");
				//} else {
					//out.println("<li>Title : <input type='text' size='100' name='title' value='"+ title +"'></li>");
					//out.println("<div class=\"mb-3\"><label for=\"title\" class=\"form-label\">Title:</label> <input type=\"text\" class=\"form-control\" name=\"title\" id=\"title\" aria-describedby=\"titleHelp\" value=\"" + title + "\"><div id=\"titleHelp\" class=\"form-text\"></div>");
				//}
				//if(isbn.isEmpty()) {
					//Filed for author will be displayed in red color if it's empty
					//out.println("<li>ISBN : <input type='text' size='100' class='redBorder' name='isbn' value='"+ isbn +"'></li>");
				//} else {
					//out.println("<li>ISBN : <input type='text' size='100' name='isbn' value='"+ isbn +"'></li>");
					if (Utils.EMPTY_FIELD.equals(isbn)) {
						out.println("<div class=\"mb-3\"><label for=\"isbn\" class=\"form-label\">ISBN:</label> <input type=\"text\" class=\"form-control\" name=\"isbn\" value=\"\" id=\"isbn\" aria-describedby=\"isbnHelp\"><div id=\"isbnHelp\" style=\"color: red;text-align: left;\" class=\"form-text\">" + isbn + "</div>");
					} else {
						out.println("<div class=\"mb-3\"><label for=\"isbn\" class=\"form-label\">ISBN:</label> <input type=\"text\" class=\"form-control\" name=\"isbn\" value=\"" + isbn + "\" id=\"isbn\" aria-describedby=\"isbnHelp\"><div id=\"isbnHelp\" class=\"form-text\"> </div>");
					}
					//out.println("<div class=\"mb-3\"><label for=\"isbn\" class=\"form-label\">ISBN:</label> <input type=\"text\" class=\"form-control\" name=\"isbn\" value=\"" + isbn + "\" id=\"isbn\" aria-describedby=\"isbnHelp\"><div id=\"isbnHelp\" class=\"form-text\"></div>");
				//}
				out.println("<button type=\"submit\" class=\"btn btn-primary\">Submit</button>");
			} else {
				// This fields are loaded when page is loaded
				//out.println("<li>Author : <input type='text' size='100' name='author' /></li>");		
				//out.println("<li>Title : <input type='text' size='100' name='title' /></li>");		
				//out.println("<li>ISBN : <input type='text' size='100' name='isbn' /></li>");
				out.println("<div class=\"mb-3\"><label for=\"author\" class=\"form-label\">Author:</label> <input type=\"text\" class=\"form-control\"	name=\"author\" id=\"author\" aria-describedby=\"authorHelp\"><div id=\"authorHelp\" class=\"form-text\"> </div><div class=\"mb-3\"><label for=\"title\" class=\"form-label\">Title:</label> <input type=\"text\" class=\"form-control\" name=\"title\" id=\"title\" aria-describedby=\"titleHelp\"><div id=\"titleHelp\" class=\"form-text\"> </div><div class=\"mb-3\"><label for=\"isbn\" class=\"form-label\">ISBN:</label> <input type=\"text\" class=\"form-control\" name=\"isbn\" id=\"isbn\" aria-describedby=\"isbnHelp\"><div id=\"isbnHelp\" class=\"form-text\"> </div><button type=\"submit\" class=\"btn btn-primary\">Submit</button>");
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