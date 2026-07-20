<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@ include file="all_component/allCss.jsp"%>

<style type="text/css">
.back-img {
	background: url("img/Book1.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

	<%
	/* User us = (User) session.getAttribute("userobj"); */
	Object sessionUser = session.getAttribute("userobj");
	User us = sessionUser instanceof User ? (User) sessionUser : null;
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Ebook Portal</h2>
	</div>

	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if ("old".equalsIgnoreCase(b.getBookCategory())) {
							%>
						
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"> <%=b.getPrice()%> <i
								class="fas fa-rupee-sign"></i>
							</a>
						</div>
						<%
						} else {
						%>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (us == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
								Cart</a>

							
								<%
								} else {
								%>
								<a
									href="<%=request.getContextPath()%>/cart?bid=<%=b.getBookId()%>&uid=<%=us.getId()%>"
									class="btn btn-danger btn-sm ml-2">Add Cart</a>
								<%
								}
								%>
								
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
									class="btn btn-danger btn-sm ml-1"> <%=b.getPrice()%> <i
									class="fas fa-rupee-sign"></i>
								</a>
							</div>
							<%
							}
							%>

						</div>
					</div>
				</div>

				<%
				}
				%>
			</div>
			<div class="text-center mt-1">
				<a href="all_recent_book.jsp"
					class="btn btn-danger btn-sm text-white">View all</a>
			</div>
		</div>
		<!-- End Recent Book -->

		<!-- Start New Book -->

		<div class="container">
			<h3 class="text-center">New Book</h3>
			<div class="row">
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getNewBooks();
				for (BookDtls b : list) {
				%>

				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoname()%>"
								style="width: 150px; height: 200px" class="img-thumbnail">

							<p><%=b.getBookname()%></p>
							<p><%=b.getAuthor()%></p>
							<p>
								Categories:
								<%=b.getBookCategory()%></p>

							<div class="d-flex justify-content-center">

								<%
								if (us == null) {
								%>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
									Cart</a>
								<%
								} else {
								%>
								<a
									href="<%=request.getContextPath()%>/cart?bid=<%=b.getBookId()%>&uid=<%=us.getId()%>"
									class="btn btn-danger btn-sm ml-2">Add Cart</a>
								<%
								}
								%>

								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm ml-1"> View Details </a> <a
									href="" class="btn btn-danger btn-sm ml-1"> <%=b.getPrice()%>
									<i class="fas fa-rupee-sign"></i>
								</a>
							</div>

						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<div class="text-center mt-1">
				<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
					all</a>
			</div>
		</div>
		<!-- End New book -->

		<!-- Start old book -->

		<div class="container">
			<h3 class="text-center">Old Book</h3>
			<div class="row">
				<%
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list3 = dao3.getAllOldBook();
				for (BookDtls b : list3) {
				%>

				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoname()%>"
								style="width: 100px; height: 150px" class="img-thumbnail">

							<p><%=b.getBookname()%></p>
							<p><%=b.getAuthor()%></p>
							<p>
								Categories:
								<%=b.getBookCategory()%></p>

							<div class="row">

								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm ml-1"> View Details </a> <a
									href="" class="btn btn-danger btn-sm ml-1"> <%=b.getPrice()%>
									<i class="fas fa-rupee-sign"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<div class="text-center mt-1">
				<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
					all</a>
			</div>
		</div>
		<!-- End old book -->


		<%@include file="all_component/footer.jsp"%>
</body>
</html>