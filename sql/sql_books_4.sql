use mypet;

select * from post;

select * from user;

select * from profile;

select * from board;

select * from books;

use bookshop;

select id, title, stock_status from books where item_id = 328754905;
update books set stock_status = "100" where item_id = 328754905;

select * from alam_books;

select * from books where item_id = 329151447;
select * from today_book;

select * from books where SUBSTRING(books.category_name, 1, 13) LIKE '외국도서>%';
select count(*) from books where SUBSTRING(books.category_name, 1, 13) LIKE '외국도서>%';