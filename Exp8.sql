 CREATE DATABASE TRANSACTION;
USE TRANSACTION;
CREATE TABLE Book_Issue(Issue_id int,Date_of_issue date,Book_id int,Status varchar(20),Expected_date_of_return date,PRIMARY KEY(Issue_id));
CREATE TABLE Book_Return(Issue_id int,Actual_date_of_return date,late_days int,late_fee int,FOREIGN KEY(Issue_id) REFERENCES Book_Issue(Issue_id));
INSERT INTO Book_Issue values(1,'2022-08-21',1,'Returned','2022-08-28'),(2,'2022-08-23',2,'Not Returned','2022-08-30'),(3,'2022-08-20',3,'Not Returned','2022-08-27'),(4,'2022-08-19',4,'Returned','2022-08-26');
 INSERT INTO Book_Return VALUES(1,'2022-08-28',0,0),(4,'2022-08-26',0,0);
delimiter /  
create procedure return_status(in Issue_id int,in Actual_date_of_return date,in late_days int,in late_fee int)
    -> begin
    -> insert into Book_Return values(Issue_id,Actual_date_of_return,late_days,late_fee);
    -> update Book_Issue set Status='Returned' where Book_Issue.Issue_id=Issue_id;
    -> end /
call return_status(2,'2022-08-30',0,0)/
