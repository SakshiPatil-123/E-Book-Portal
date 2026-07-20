package com.DB;
import java.sql.*;
public final class DBConnect {
 private DBConnect(){}
 public static Connection getConn(){
  try { Class.forName("com.mysql.cj.jdbc.Driver"); return DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Kolkata","root","1234"); }
  catch(Exception e){ throw new IllegalStateException("Database connection failed. Start MySQL and verify ebook_app/root/1234.",e); }
 }
}
