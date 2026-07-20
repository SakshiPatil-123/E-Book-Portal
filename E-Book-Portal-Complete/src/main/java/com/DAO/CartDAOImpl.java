package com.DAO;

import java.sql.*;
import java.util.*;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	private final Connection conn;

	public CartDAOImpl(Connection c) {
		conn = c;
	}

	/*
	 * public boolean addCart(Cart c) { try (PreparedStatement p = conn
	 * .prepareStatement("INSERT INTO cart(bid,uid,bookName,author,price,total_price) VALUES(?,?,?,?,?,?)"
	 * )) { p.setInt(1, c.getBid()); p.setInt(2, c.getUid()); p.setString(3,
	 * c.getBookName()); p.setString(4, c.getAuthor()); p.setDouble(5,
	 * c.getPrice()); p.setDouble(6, c.getPrice()); return p.executeUpdate() == 1; }
	 * catch (SQLException e) { e.printStackTrace(); return false; } }
	 */

	public boolean addCart(Cart c) {

		String checkSql = "SELECT quantity FROM cart WHERE bid=? AND uid=?";

		String updateSql = "UPDATE cart SET quantity=quantity+1, " + "total_price=price*(quantity+1) "
				+ "WHERE bid=? AND uid=?";

		String insertSql = "INSERT INTO cart" + "(bid,uid,bookName,author,price,total_price,quantity) "
				+ "VALUES(?,?,?,?,?,?,?)";

		try {

			try (PreparedStatement check = conn.prepareStatement(checkSql)) {
				check.setInt(1, c.getBid());
				check.setInt(2, c.getUid());

				try (ResultSet rs = check.executeQuery()) {

					if (rs.next()) {
						try (PreparedStatement update = conn.prepareStatement(updateSql)) {

							update.setInt(1, c.getBid());
							update.setInt(2, c.getUid());

							return update.executeUpdate() == 1;
						}
					}
				}
			}

			try (PreparedStatement insert = conn.prepareStatement(insertSql)) {

				insert.setInt(1, c.getBid());
				insert.setInt(2, c.getUid());
				insert.setString(3, c.getBookName());
				insert.setString(4, c.getAuthor());
				insert.setDouble(5, c.getPrice());
				insert.setDouble(6, c.getPrice());
				insert.setInt(7, 1);

				return insert.executeUpdate() == 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Cart> getBookByUser(int uid) {
		List<Cart> a = new ArrayList<>();
		double total = 0;
		try (PreparedStatement p = conn.prepareStatement("SELECT * FROM cart WHERE uid=? ORDER BY cid")) {
			p.setInt(1, uid);
			try (ResultSet r = p.executeQuery()) {
				while (r.next()) {
					Cart c = new Cart();
					c.setCid(r.getInt("cid"));
					c.setBid(r.getInt("bid"));
					c.setUid(r.getInt("uid"));
					c.setBookName(r.getString("bookName"));
					c.setAuthor(r.getString("author"));
					/*
					 * c.setPrice(r.getDouble("price")); total += c.getPrice();
					 * c.setTotalPrice(total);
					 */
					c.setPrice(r.getDouble("price"));
					c.setQuantity(r.getInt("quantity"));

					double itemTotal = c.getPrice() * c.getQuantity();
					total += itemTotal;

					c.setTotalPrice(total);
					a.add(c);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}

	/*
	 * public boolean deleteBook(int bid, int uid, int cid) { try (PreparedStatement
	 * p =
	 * conn.prepareStatement("DELETE FROM cart WHERE bid=? AND uid=? AND cid=?")) {
	 * p.setInt(1, bid); p.setInt(2, uid); p.setInt(3, cid); return
	 * p.executeUpdate() == 1; } catch (SQLException e) { return false; } }
	 */
	public boolean deleteBook(int bid, int uid, int cid) {

		String checkSql = "SELECT quantity FROM cart WHERE bid=? AND uid=? AND cid=?";

		String updateSql = "UPDATE cart SET quantity=quantity-1, " + "total_price=price*(quantity-1) "
				+ "WHERE bid=? AND uid=? AND cid=?";

		String deleteSql = "DELETE FROM cart WHERE bid=? AND uid=? AND cid=?";

		try {

			try (PreparedStatement check = conn.prepareStatement(checkSql)) {
				check.setInt(1, bid);
				check.setInt(2, uid);
				check.setInt(3, cid);

				try (ResultSet rs = check.executeQuery()) {

					if (rs.next()) {
						int quantity = rs.getInt("quantity");

						if (quantity > 1) {
							try (PreparedStatement update = conn.prepareStatement(updateSql)) {

								update.setInt(1, bid);
								update.setInt(2, uid);
								update.setInt(3, cid);

								return update.executeUpdate() == 1;
							}
						}
					}
				}
			}

			try (PreparedStatement delete = conn.prepareStatement(deleteSql)) {

				delete.setInt(1, bid);
				delete.setInt(2, uid);
				delete.setInt(3, cid);

				return delete.executeUpdate() == 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
