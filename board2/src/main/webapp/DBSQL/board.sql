create table board(

	board_id int primary key not null , 
    board_title varchar(40) not null , 
	board_contents varchar(3000) not null ,
    board_userid varchar(40) not null ,
    board_date varchar(100) not null ,
    board_available int ,
    board_file varchar(1000) 
    
);

create table reply(

	reply_num int primary key, 
    reply_boardid int,
    reply_userid varchar(50) , 
    reply_contents varchar(1000)
    
);

