use bookshop;


select title, book_id from books join like_books on books.id = like_books.book_id;

select * from identity;

select * from today_book;
truncate table today_book;

select * from cart;

select * from book_comment;
truncate table book_comment;
truncate table reply_comments;
select * from profile;
select * from hits_table;

select title, id, stock_status from books order by books.stock_status;

truncate table hits_table;

truncate table foreignbook;
truncate table identity;

select * from foreign_books;

SELECT * FROM books WHERE SUBSTRING(books.category_name, 1, 4) LIKE '국내도서%';

SELECT books.id, books.publisher, books.title, books.link, books.author, books.pub_date, books.description, books.item_id, books.price_sales, books.price_standard, books.stock_status, books.cover, books.category_id, books.category_name, COUNT(book_comment.id) FROM books LEFT JOIN book_comment ON books.id = book_comment.book_id WHERE SUBSTRING(books.category_name, 1, 4) LIKE '국내도서%' GROUP BY books.id ORDER BY books.id DESC LIMIT 5;


INSERT INTO books (publisher, title, link, author, pub_date, description, isbn, isbn13, item_id, price_sales, price_standard, stock_status, cover, category_id, category_name, customer_review_rank)
SELECT publisher, title, link, author, pub_date, description, isbn, isbn13, item_id, price_sales, price_standard, stock_status, cover, category_id, category_name, customer_review_rank
FROM book;

INSERT INTO books (publisher, title, link, author, pub_date, description, isbn, isbn13, item_id, price_sales, price_standard, stock_status, cover, category_id, category_name, customer_review_rank)
SELECT publisher, title, link, author, pubDate, description, isbn, isbn13, itemId, priceSales, priceStandard, stockStatus, cover, categoryId, categoryName, customerReviewRank
FROM foreign_1;

INSERT INTO books (publisher, title, link, author, pub_date, description, isbn, isbn13, item_id, price_sales, price_standard, stock_status, cover, category_id, category_name, customer_review_rank)
SELECT publisher, title, link, author, pubDate, description, isbn, isbn13, itemId, priceSales, priceStandard, stockStatus, cover, categoryId, categoryName, customerReviewRank
FROM foreignbook;

SELECT books.id, books.title, like_books.id, like_books.new_book_id, like_books.book_id, like_books.likes, like_books.profile_id FROM books INNER JOIN like_books ON books.id = like_books.book_id WHERE like_books.book_id = 907;

INSERT INTO order_item (publisher, title, link, author, pub_date, description, isbn, isbn13, item_id, price_sales, price_standard, stock_status, cover, category_id, category_name, customer_review_rank)
SELECT publisher, title, link, author, pubDate, description, isbn, isbn13, itemId, priceSales, priceStandard, stockStatus, cover, categoryId, categoryName, customerReviewRank
FROM foreign_1;

CREATE TABLE `books` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `publisher` varchar(32) NOT NULL,
  `title` varchar(512) NOT NULL,
  `link` varchar(512) NOT NULL,
  `author` varchar(512) NOT NULL,
  `pub_date` varchar(10) NOT NULL,
  `description` varchar(512) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `isbn13` varchar(13) NOT NULL,
  `item_id` int NOT NULL,
  `price_sales` int NOT NULL,
  `price_standard` int NOT NULL,
  `stock_status` varchar(20) NOT NULL,
  `cover` varchar(512) NOT NULL,
  `category_id` int NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `customer_review_rank` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1069 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from books;
select * from books order by books.id DESC;

select * from books where books.item_id=27653184;

select * from book;
truncate table books;

truncate table new_books;
select * from new_books;

select * from order_sales order by book_sales DESC;

select * from order_sales;
select * from order_item;
truncate table order_item;
truncate table order_sales;

select * from event_books;
select * from alam_books;

insert into books (publisher, title,author, description,item_id,cover,pub_date,price_standard,price_sales,
stock_status,link,isbn,isbn13,category_id, category_name, customer_review_rank)
select publisher, title,author, description,item_id,cover,"2022-04-18",20000,10000,"정상","","","",0,"",0
 from event_books;

INSERT INTO `order_sales`
(`id`,
`book_sales`,
`item_id`,
`status`,
`book_id`)
VALUES
(11, 28, 27653184, 1 , 790);

update order_sales set book_sales=40 where id = 3;

select books.id from books where books.item_id = 311817529;

select title, SUM(order_item.quantity) from books
join order_item on books.item_id = order_item.item_id
group by title
order by 2
DESC LIMIT 10;

select * from today_book;
use bookshop;

select * from books where SUBSTRING(books.category_name, 1, 13) LIKE '외국도서>%';
select count(*) from books where SUBSTRING(books.category_name, 1, 13) LIKE '외국도서>%';

SELECT books.id, books.publisher, books.title, books.link, books.author, books.pub_date, books.description, books.isbn, books.isbn13, books.item_id, books.price_sales, books.price_standard, books.stock_status, books.cover, books.category_id, books.category_name, books.customer_review_rank, order_item.id, order_item.item_id, order_item.quantity, order_item.order_price, order_item.order_id FROM books INNER JOIN order_item ON order_item.item_id = books.item_id GROUP BY books.item_id, order_item.item_id, books.id, order_item.id ORDER BY SUM(order_item.quantity) DESC;

SELECT books.id, books.publisher, books.title, books.link, books.author, books.pub_date, books.description, 
books.isbn, books.isbn13, books.item_id, books.price_sales, books.price_standard, books.stock_status, books.cover, 
books.category_id, books.category_name, books.customer_review_rank, order_item.id, order_item.item_id, 
order_item.quantity, order_item.order_price, order_item.order_id FROM books 
INNER JOIN order_item ON order_item.item_id = books.item_id GROUP BY books.item_id, order_item.item_id, 
books.id, order_item.id ORDER BY SUM(order_item.quantity) DESC LIMIT 20;

CREATE TABLE `book` (
  `id` int DEFAULT NULL,
  `publisher` text,
  `title` text,
  `link` text,
  `author` text,
  `pub_date` text,
  `description` text,
  `isbn` text,
  `isbn13` text,
  `item_id` int DEFAULT NULL,
  `price_sales` int DEFAULT NULL,
  `price_standard` int DEFAULT NULL,
  `stock_status` text,
  `cover` text,
  `category_id` int DEFAULT NULL,
  `category_name` text,
  `customer_review_rank` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci