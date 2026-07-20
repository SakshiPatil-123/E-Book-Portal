package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/edit_books")
public class EditBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        try {
            BookDtls book = new BookDtls();
            book.setBookId(Integer.parseInt(req.getParameter("id")));
            book.setBookname(req.getParameter("bname"));
            book.setAuthor(req.getParameter("author"));
            book.setPrice(req.getParameter("price"));
            book.setStatus(req.getParameter("bstatus"));
            try (var conn = DBConnect.getConn()) {
                boolean ok = new BookDAOImpl(conn).updateEditBooks(book);
                session.setAttribute(ok ? "succMsg" : "failedMsg", ok ? "Book updated successfully." : "Book update failed.");
            }
        } catch (Exception e) {
            session.setAttribute("failedMsg", e.getMessage());
        }
        resp.sendRedirect("admin/all_books.jsp");
    }
}
