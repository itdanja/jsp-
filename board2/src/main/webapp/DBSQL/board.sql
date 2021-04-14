create table board(

	board_id int primary key not null , 
    board_title varchar(40) not null , 
	board_contents varchar(3000) not null ,
    board_userid varchar(40) not null ,
    board_date varchar(100) not null ,
    board_available int ,
    board_file varchar(1000) 
    
);



