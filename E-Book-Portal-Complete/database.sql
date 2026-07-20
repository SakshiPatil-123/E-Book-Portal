CREATE DATABASE IF NOT EXISTS ebook_app CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ebook_app;

CREATE TABLE IF NOT EXISTS user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  phno VARCHAR(20) NOT NULL,
  password VARCHAR(255) NOT NULL,
  address VARCHAR(255) DEFAULT '',
  landmark VARCHAR(150) DEFAULT '',
  city VARCHAR(100) DEFAULT '',
  state VARCHAR(100) DEFAULT '',
  pincode VARCHAR(20) DEFAULT ''
);

CREATE TABLE IF NOT EXISTS book_dtls (
  bookId INT PRIMARY KEY AUTO_INCREMENT,
  bookname VARCHAR(150) NOT NULL,
  author VARCHAR(120) NOT NULL,
  price VARCHAR(30) NOT NULL,
  bookCategory VARCHAR(30) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'Active',
  photoname VARCHAR(255) NOT NULL,
  user_email VARCHAR(150) DEFAULT 'admin'
);

CREATE TABLE IF NOT EXISTS cart (
  cid INT PRIMARY KEY AUTO_INCREMENT,
  bid INT NOT NULL,
  uid INT NOT NULL,
  bookName VARCHAR(150) NOT NULL,
  author VARCHAR(120) NOT NULL,
  price DOUBLE NOT NULL,
  total_price DOUBLE NOT NULL,
  INDEX idx_cart_uid (uid),
  CONSTRAINT fk_cart_user FOREIGN KEY (uid) REFERENCES user(id) ON DELETE CASCADE,
  CONSTRAINT fk_cart_book FOREIGN KEY (bid) REFERENCES book_dtls(bookId) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS book_order (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_id VARCHAR(45) NOT NULL,
  user_name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  address VARCHAR(500) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  book_name VARCHAR(150) NOT NULL,
  author VARCHAR(120) NOT NULL,
  price VARCHAR(45) NOT NULL,
  payment VARCHAR(45) NOT NULL,
  INDEX idx_order_email (email),
  INDEX idx_order_id (order_id)
);

INSERT INTO user(name,email,phno,password,address,landmark,city,state,pincode)
SELECT 'Shivam Kumar','shivam@gmail.com','7978905654','1234','','','','',''
WHERE NOT EXISTS (SELECT 1 FROM user WHERE email='shivam@gmail.com');

INSERT INTO book_dtls(bookname,author,price,bookCategory,status,photoname,user_email)
SELECT 'Java Programming','Balguruswamy','200','New','Active','javaimg.jpeg','admin'
WHERE NOT EXISTS (SELECT 1 FROM book_dtls WHERE bookname='Java Programming');
INSERT INTO book_dtls(bookname,author,price,bookCategory,status,photoname,user_email)
SELECT 'Linux','John','300','Old','Active','linuximg.jpeg','admin'
WHERE NOT EXISTS (SELECT 1 FROM book_dtls WHERE bookname='Linux');
INSERT INTO book_dtls(bookname,author,price,bookCategory,status,photoname,user_email)
SELECT 'Story','G Sahoo','456','New','Active','storyimg.jpeg','admin'
WHERE NOT EXISTS (SELECT 1 FROM book_dtls WHERE bookname='Story');
INSERT INTO book_dtls(bookname,author,price,bookCategory,status,photoname,user_email)
SELECT 'Sql','Dinesh','250','New','Active','sqlimg.jpeg','admin'
WHERE NOT EXISTS (SELECT 1 FROM book_dtls WHERE bookname='Sql');
