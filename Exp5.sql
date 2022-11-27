--a
SELECT COUNT(*) FROM Book_Author WHERE Author_Id=1;
/*
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
*/
--b
SELECT Publisher.Name,COUNT(*)  FROM Publisher,BOOK WHERE Publisher.Publisher_id=BOOK.Publisher_id GROUP BY(Publisher.Publisher_id);
/*
+---------+----------+
| Name    | COUNT(*) |
+---------+----------+
| Amal    |        1 |
| Sathyan |        1 |
| Vinny   |        1 |
| Manu    |        2 |
| Ram     |        1 |
+---------+----------+
*/
--C
select Name from Author where Author_id in (select distinct a.Author_id from Book_Author a, Book_Author b where  a.Book_id=b.Book_id and a.Author_id <> b.Author_id and a.Book_id in (select Book_id from Book_Author where Book_id in (select Book_id from Book_Author group by Book_id having count(*)>1)));
+--------+
| Name   |
+--------+
| Ashwin |
| Fahma  |
| Durga  |
| Melvin |
+--------+

--D
SELECT BOOK.Title FROM BOOK,Book_Issue,Book_Return WHERE BOOK.Book_id=Book_Issue.Book_id AND Book_Issue.Issue_id NOT IN (SELECT Issue_id FROM Book_Return) GROUP BY BOOK.Title;
/*
+----------------------+
| Title                |
+----------------------+
| God Created the Inte |
+----------------------+
*/
--E
SELECT Member.Name FROM Member,Language,BOOK,Book_Issue WHERE Member.Member_id=Book_Issue.Member_id AND BOOK.Book_id=Book_Issue.Book_id AND BOOK.Language_id=Language.Lang_id AND Language.Name='Malayalam' AND  Member.Member_id NOT IN (SELECT Member.Member_id FROM Member,Language,BOOK,Book_Issue WHERE Member.Member_id=Book_Issue.Member_id AND BOOK.Book_id=Book_Issue.Book_id AND BOOK.Language_id=Language.lang_id 
AND Language.Name != 'Malayalam');
/*
+--------+
| Name   |
+--------+
| Sharon |
+--------+
*/
--F
SELECT SUM(late_fee) AS Fine FROM Book_Return WHERE MONTH(Actual_date_of_return)=MONTH(CURDATE());
/*
+------+
| Fine |
+------+
| NULL |
+------+
*/
 SELECT SUM(late_fee) AS Fine FROM Book_Return WHERE QUARTER(Actual_date_of_return)=QUARTER(CURDATE());
/*
+------+
| Fine |
+------+
|  100 |
+------+
*/
--G
SELECT Name FROM Member,Book_Issue,Book_Return WHERE Member.Member_id=Book_Issue.Member_id AND Book_Issue.Issue_id = Book_Return.Issue_id AND Book_Return.late_days!=0;
/*
+--------+
| Name   |
+--------+
| Shamna |
| Sharon |
+--------+
*/
--H

--I
SELECT Name FROM Member,Book_Issue WHERE Date_of_join > '2021-01-01' AND Member.Member_id NOT IN(SELECT Member_id  FROM Book_Issue) GROUP BY Name;
/*
+------+
| Name |
+------+
| Emil |
+------+ 
*/
