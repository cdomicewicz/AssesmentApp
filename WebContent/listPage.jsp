<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.javaassessment.utils.Book"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Java Assessment - List page</title>
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
		<h2>List page</h2>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Author</th>
					<th scope="col">Title</th>
					<th scope="col">ISBN</th>
				</tr>
			</thead>
			<tbody>
			<%
			List<Book> books = Book.getAllBooks();
			if (books != null && !books.isEmpty()) {
				int i = 1;
				for (Book book : books) {
					out.println("<tr><th scope=\"row\" >" + i + "</th>");
					out.println("<td>" + book.getAuthor() + "</td>");
					out.println("<td>" + book.getTitle() + "</td>");
					out.println("<td>" + book.getIsbn() + "</td>");
					out.println("</tr>");
					i++;
				}
			} else {
				
				out.println("<tr><th scope=\"row\" >1</th>");
				for (int i = 0; i <= 2; i++) {
					out.println("<td style=\"color: red;\">No record</td>");
				}
				out.println("</tr>");
			}
			%>
					
			</tbody>
		</table>

		<br> <br>
		<a href="/Books/newRecordPage.jsp" class="btn btn-primary btn-lg" tabindex="-1" role="button" aria-disabled="true">Add new record</a>
		<!--  <a href="/newRecordPage.jsp">Add new record</a>-->
		
	</center>
</body>
</html>