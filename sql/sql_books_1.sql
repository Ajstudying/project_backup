-- delete from book_comment;
truncate table order_item;
-- delete from books;

select * from hits_table;
truncate table hits_table;

INSERT INTO books (publisher, title, link, author, pub_date, description, isbn, isbn13, item_id, price_sales, price_standard, stock_status, cover, category_id, category_name, customer_review_rank)
SELECT
    publisher,
    title,
    link,
    author,
    pub_date,
    description,
    isbn,
    isbn13,
    item_id,
    price_sales,
    price_standard,
    stock_status,
    CONCAT("https://image.aladin.co.kr/product/", SUBSTRING(item_id, 1, 5), "/", CAST(SUBSTRING(item_id, 6, 2) AS SIGNED), "/cover200/", isbn, "_1.jpg") as cover,
    category_id,
    category_name,
    customer_review_rank
FROM book
WHERE item_id != '' AND item_id REGEXP '^[0-9]+$' AND SUBSTRING(item_id, 6, 2) REGEXP '^[0-9]+$';


update books set stock_status = "정상";
update new_books set stock_status = "예약판매";
update foreign_books set stock_status = "예약판매";

update books set stock_status = "품절" where SUBSTRING(books.category_name, 1, 7) LIKE '외국도서%';

-- 일부도서 직접 업데이트--
-- 노인 --
update books set cover = "https://image.aladin.co.kr/product/32207/83/cover500/k472834526_1.jpg" where id = 509;
-- 인페르노 --
update books set cover = "https://image.aladin.co.kr/product/2765/31/cover500/898392487x_2.jpg" where id = 787;
-- 다시 혼 --
update books set cover = "https://image.aladin.co.kr/product/2294/3/cover500/8963709345_1.jpg" where id = 380;
-- 파우스트 --
update books set cover = "https://image.aladin.co.kr/product/5518/85/cover500/8932404364_2.jpg" where id = 539;
-- 생각 --
update books set cover = "https://image.aladin.co.kr/product/48/27/cover200/8934914483_3.jpg" where id = 1053;
-- 잘못뽑은 --
update books set cover = "https://image.aladin.co.kr/product/370/95/cover200/8934933704_1.jpg" where id = 1040;
-- 만들어진 --
update books set cover = "https://image.aladin.co.kr/product/94/65/cover200/893492618x_2.jpg" where id = 1052;
-- 안철수 --
update books set cover = "https://image.aladin.co.kr/product/1830/51/cover200/8934958715_1.jpg" where id = 1036;
-- 호모데우스 --
update books set cover = "https://image.aladin.co.kr/product/10044/18/cover200/8934977841_3.jpg" where id = 1028;

update books set cover = "https://image.aladin.co.kr/product/10044/18/cover200/8934977841_3.jpg" where id = 962;