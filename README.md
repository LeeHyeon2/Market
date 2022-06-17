# Marketdrop table market_member;
create table market_member(
	id bigint auto_increment,
    memberName varchar(20) not null,
    memberId varchar(20) unique not null,
    memberPassword varchar(20) not null,
    memberEmail1 varchar(20) not null,
    memberEmail2 varchar(20) not null,
    memberPost varchar(50) not null,
    memberAddress1 varchar(50) not null,
    memberAddress2 varchar(50),
    
    constraint pk_market_member primary key(id)
);
select * from market_member;

drop table market_board;
create table market_board(
	id bigint auto_increment,
    memberId varchar(20) not null,
    boardTitle varchar(50) not null,
    boardContents varchar(500) not null,
    boardAddress varchar(50) not null,
    boardPrice varchar(30) not null,
    boardCategory varchar(30) not null,
    boardDate datetime,
    boardProfile varchar(50) not null,
    boardFile varchar(50),
    boardStatus varchar(50),
    
    constraint pk_market_board primary key(id),
    constraint fk_memberId foreign key(memberId) references market_member(memberId)
);
select * from market_board;
alter table market_board add column boardHits int default 0;
alter table market_board drop column boardFileName;
update market_board set boardStatus = "판매중" where id = 15;

drop table market_bag;
create table market_bag(
	id bigint auto_increment,
    memberId varchar(30),
    boardId bigint,
    
    constraint pk_market_bag primary key(id),
    constraint fk_market_memberId foreign key(memberId) references market_member(memberId),
	constraint fk_boardId foreign key(boardId) references market_board(id)
);
select * from market_bag;
delete from market_bag where boardId = 14;

drop table market_trade;
create table market_trade(
	id bigint auto_increment,
    saleMemberId varchar(30),
    buyMemberId varchar(30),
    boardId bigint,
    tradeStatus varchar(20),
    tradeTime dateTime,
    
    constraint pk_market_trade primary key(id),
    constraint fk_marekt_trade_saleMemberId foreign key(saleMemberId) references market_member(memberId),
    constraint fk_marekt_trade_buyMemberId foreign key(buyMemberId) references market_member(memberId)
);
select * from market_trade;
select * from makret_trade where saleMemberId = "13";

drop table market_chat;
create table market_chat(
	id bigint auto_increment,
    boardId bigint,
    memberId varchar(20),
    contents varchar(100),
    chatTime dateTime,
    
    constraint pk_market_chat primary key(id)
);

select * from market_chat;
