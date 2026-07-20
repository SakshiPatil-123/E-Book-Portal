package com.DAO; import java.util.*; import com.entity.Cart; public interface CartDAO { boolean addCart(Cart c); List<Cart> getBookByUser(int uid); boolean deleteBook(int bid,int uid,int cid); }
