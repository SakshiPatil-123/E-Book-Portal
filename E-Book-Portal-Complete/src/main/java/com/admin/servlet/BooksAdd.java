package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024)
public class BooksAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        try {
            Part part = req.getPart("bimg");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (fileName.isBlank()) {
                throw new IllegalArgumentException("Please select a book image.");
            }

            BookDtls book = new BookDtls();
            book.setBookname(req.getParameter("bname"));
            book.setAuthor(req.getParameter("author"));
            book.setPrice(req.getParameter("price"));
            book.setBookCategory(req.getParameter("btype"));
            book.setStatus(req.getParameter("bstatus"));
            book.setPhotoname(fileName);
            book.setEmail("admin");

            try (var conn = DBConnect.getConn()) {
                if (!new BookDAOImpl(conn).addBooks(book)) {
                    throw new IllegalStateException("Book could not be added.");
                }
            }

            String uploadDir = getServletContext().getRealPath("") + File.separator + "book";
            new File(uploadDir).mkdirs();
            part.write(uploadDir + File.separator + fileName);
            session.setAttribute("succMsg", "Book added successfully.");
        } catch (Exception e) {
            session.setAttribute("failedMsg", e.getMessage());
        }
        resp.sendRedirect("admin/add_books.jsp");
    }
}
