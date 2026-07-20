package com.entity;
import java.io.Serializable;
public class BookDtls implements Serializable { private int bookId; private String bookname,author,price,bookCategory,status,photoname,email;
 public BookDtls(){} public BookDtls(String b,String a,String p,String c,String s,String photo,String e){bookname=b;author=a;price=p;bookCategory=c;status=s;photoname=photo;email=e;}
 public int getBookId(){return bookId;} public void setBookId(int v){bookId=v;} public String getBookname(){return bookname;} public void setBookname(String v){bookname=v;} public String getAuthor(){return author;} public void setAuthor(String v){author=v;} public String getPrice(){return price;} public void setPrice(String v){price=v;} public String getBookCategory(){return bookCategory;} public void setBookCategory(String v){bookCategory=v;} public String getStatus(){return status;} public void setStatus(String v){status=v;} public String getPhotoname(){return photoname;} public void setPhotoname(String v){photoname=v;} public String getUser_email(){return email;} public void setEmail(String v){email=v;} public String toString(){return bookname;}
}
