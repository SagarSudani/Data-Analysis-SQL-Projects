#User information retrieval 
SELECT * FROM library.member;


#Count Query for book's Availability 
select count(distinct member.member_id)
from library.member
join library.loan on member.member_id=loan.member_id
join library.book on loan.book_id = Book.b_id
where book.Title = 'Steve jobs';


#get information of who has fine 
select member.first_name, member.last_name
from library.member
join library.fine on member.member_id = fine.member_id;


#Get data of Member who borrowed book by using member ID
select loan.loan_date, book.title 
from library.loan
join library.book on loan.book_id = book.b_id
where member_id = '2002';

#get data of book never borrowed
select book.title 
from library.book
where book.b_id 
not in (select book_id 
from library.loan);


#get info of member who loan book with specific period
select book.title
from library.loan
left join library.book on loan.book_id = book.b_id
where member_id = '2003' and 
loan.loan_date between '01-jan-24' and '01-may-24';


 #get data of user and their status
SELECT first_name, active_status,fine_amount
FROM library.member  
inner join library.member_status
on library.member.member_id=library.member_status.status_id
inner join library.fine 
on library.member.member_id= library.fine.member_id
where active_status='inactive'
;