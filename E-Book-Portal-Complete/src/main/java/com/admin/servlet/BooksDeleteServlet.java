package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        try (var conn = DBConnect.getConn()) {
            boolean ok = new BookDAOImpl(conn).deleteBooks(Integer.parseInt(req.getParameter("id")));
            session.setAttribute(ok ? "succMsg" : "failedMsg", ok ? "Book deleted successfully." : "Book delete failed.");
        } catch (Exception e) {
            session.setAttribute("failedMsg", e.getMessage());
        }
        resp.sendRedirect("admin/all_books.jsp");
    }
}
