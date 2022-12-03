use hamburgerking;

create table users (
	uid int primary key auto_increment,
    username varchar(50) unique,
    password varchar(20),
    balance decimal(10,2),
    avatar varchar(255)
);

create table managers (
	mid int primary key auto_increment,
    managername varchar(50) unique,
    password varchar(20),
    avatar varchar(255)
);

create table goods (
	gid int primary key auto_increment,
    gname varchar(50),
    price decimal(10,2),
    image varchar(255),
    stock int
);

create table orders (
	oid int primary key auto_increment,
    uid int not null,
    gid int not null,
    status int,
    foreign key (uid) references users(uid),
    foreign key (gid) references goods(gid)
);

create table comments (
	cid int primary key auto_increment,
    uid int,
    gid int,
    date date,
    content varchar(255),
    foreign key (uid) references users(uid),
    foreign key (gid) references goods(gid)
);