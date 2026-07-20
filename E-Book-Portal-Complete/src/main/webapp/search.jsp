<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
<%
User us = (User) session.getAttribute("userobj");
%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			
			String ch=request.getParameter("ch");
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao.getBookBySearch(ch);

			for (BookDtls b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 100px; height: 150px" class="img-thumbnail">
						<%-- <img src="<%= request.getContextPath() %>/book/<%= b.getPhotoname() %>" 
     width="150px" height="200px" class="img-thumbnail"> --%>

						<%--  <img src="<%= request.getContextPath() %>/book/linuximg.jpeg" 
     style="width: 150px; height: 200px" class="img-thumbnail"> --%>
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<!-- if (b.getBookCategory().equals("Old")) { -->
						<%-- 		<%
						if ("Old".equals(b.getBookCategory()))
						%>

						Categories:
						<p><%=b.getBookCategory()%></p>

						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"> <i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%>
							</a>
						</div>

						<%
						} else {
						%>

						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-1"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a> <a href="" class="btn btn-success btn-sm ml-1">View Details</a>

							<a href="" class="btn btn-danger btn-sm ml-1"> <i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%>
							</a>
						</div>

						<%
						}
						%> --%>


						<%
						if ("Old".equals(b.getBookCategory())) {
						%>

						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"> <i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%>
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
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>

							<a href="" class="btn btn-danger btn-sm ml-1"> <i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%>
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
	</div>

</body>
</html>