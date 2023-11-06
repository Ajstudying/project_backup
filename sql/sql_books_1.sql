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
update books set cover = "https://image.aladin.co.kr/product/32207/83/cover500/k472834526_1.jpg" where item_id = 14522431;
-- 인페르노 --
update books set cover = "https://image.aladin.co.kr/product/2765/31/cover500/898392487x_2.jpg" where item_id = 27653184;
-- 다시 혼 --
update books set cover = "https://image.aladin.co.kr/product/2294/3/cover500/8963709345_1.jpg" where item_id = 22940384;
-- 파우스트 --
update books set cover = "https://image.aladin.co.kr/product/5518/85/cover500/8932404364_2.jpg" where item_id = 187574;
-- 생각 --
update books set cover = "https://image.aladin.co.kr/product/48/27/cover200/8934914483_3.jpg" where item_id = 482703;
-- 잘못뽑은 --
update books set cover = "https://image.aladin.co.kr/product/370/95/cover200/8934933704_1.jpg" where item_id = 3709577;
-- 만들어진 --
update books set cover = "https://image.aladin.co.kr/product/94/65/cover200/893492618x_2.jpg" where item_id = 946590;
-- 안철수 --
update books set cover = "https://image.aladin.co.kr/product/1830/51/cover200/8934958715_1.jpg" where item_id = 18305140;
-- 호모데우스 --
update books set cover = "https://image.aladin.co.kr/product/10044/18/cover200/8934977841_3.jpg" where item_id = 100441862;
-- 호박 --
update books set cover = "https://image.aladin.co.kr/product/32756/16/cover500/k672936083_1.jpg" where item_id = 327561673;
-- 눈썹달 --
update books set cover = "https://image.aladin.co.kr/product/32749/89/cover500/k442936989_1.jpg" where item_id = 327498945;
-- grammar--
update books set cover = "https://image.aladin.co.kr/product/32776/66/cover500/k832936286_1.jpg" where item_id = 327766486;
-- 소심백서 --
update books set cover = "https://image.aladin.co.kr/product/32749/88/cover500/k412936989_1.jpg" where item_id = 327498896;
-- 햇살이 --
update books set cover = "https://image.aladin.co.kr/product/32749/87/cover500/8943315902_2.jpg" where item_id = 327498777;
-- 마음 딱딱 무름 --
update books set cover = "https://image.aladin.co.kr/product/32749/84/cover500/k332936989_1.jpg" where item_id = 327498435;
-- 외서--
update books set cover = "https://image.aladin.co.kr/product/32755/71/cover500/f31293608d_1.jpg" where item_id = 327557176;
-- 두근두근 --
update books set cover = "https://image.aladin.co.kr/product/30367/54/cover500/k762839756_2.jpg" where item_id = 303675490;
-- 바닥 놀이 --
update books set cover = "https://image.aladin.co.kr/product/32761/99/cover500/k982936289_1.jpg" where id = 10;
-- 초등 한자 --
update books set cover = "https://image.aladin.co.kr/product/32085/44/cover500/k232834093_1.jpg" where id = 564;
-- 전략 --
update books set cover = "https://image.aladin.co.kr/product/7131/87/cover500/k912434998_1.jpg" where id = 381;
-- 어쩌다 --
update books set cover = "https://image.aladin.co.kr/product/14425/96/cover500/k902532140_2.jpg" where id = 314;
-- 일본어 천재 --
update books set cover = "https://image.aladin.co.kr/product/604/29/cover500/8963700496_1.jpg" where id = 354;
-- 집놀이 --
update books set cover = "https://image.aladin.co.kr/product/11380/16/cover500/8983718072_2.jpg" where id = 849;
-- 내동생 --
update books set cover = "https://image.aladin.co.kr/product/66/71/cover500/8937841665_2.jpg" where id = 747;
-- 우리는 --
update books set cover = "https://image.aladin.co.kr/product/11348/25/cover500/896247851x_2.jpg" where id = 176;
-- 골프 내공--
update books set cover = "https://image.aladin.co.kr/product/669/30/cover500/8963701425_1.jpg" where id = 384;

update books set cover = "https://image.aladin.co.kr/product/669/30/cover500/8963701425_1.jpg" where id = 384;



