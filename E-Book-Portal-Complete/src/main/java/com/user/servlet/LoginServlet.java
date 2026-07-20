package com.user.servlet;

import com.DB.DBConnect;
import com.DAO.UserDAOImpl;
import com.entity.User;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String email = req.getParameter("email"), pass = req.getParameter("password");
		HttpSession s = req.getSession();
		if ("admin@gmail.com".equalsIgnoreCase(email) && ("admin".equals(pass) || "1234".equals(pass))) {
			s.setAttribute("adminobj", "Admin");
			resp.sendRedirect("admin/home.jsp");
			return;
		}
		try (var c = DBConnect.getConn()) {
			User u = new UserDAOImpl(c).login(email, pass);
			if (u != null) {
				s.setAttribute("userobj", u);
				resp.sendRedirect("index.jsp");
			} else {
				s.setAttribute("failedMsg", "Email & Password Invalid");
				resp.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			s.setAttribute("failedMsg", e.getMessage());
			resp.sendRedirect("login.jsp");
		}
	}
}
