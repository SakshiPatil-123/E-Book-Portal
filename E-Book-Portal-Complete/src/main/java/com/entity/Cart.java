package com.entity;

import java.io.Serializable;

public class Cart implements Serializable {
	private int cid, bid, uid;
	private String bookName, author;
	private Double price, totalPrice;
	private int quantity;

	public int getCid() {
		return cid;
	}

	public void setCid(int v) {
		cid = v;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int v) {
		bid = v;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int v) {
		uid = v;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String v) {
		bookName = v;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String v) {
		author = v;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double v) {
		price = v;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double v) {
		totalPrice = v;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
