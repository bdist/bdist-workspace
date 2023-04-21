drop table if exists borrower cascade;
drop table if exists loan cascade;
drop table if exists depositor cascade;
drop table if exists account cascade;
drop table if exists customer cascade;
drop table if exists branch cascade;

----------------------------------------
-- Table Creation
----------------------------------------

-- Named constraints are global to the database.
-- Therefore the following use the following naming rules:
--   1. pk_table for names of primary key constraints
--   2. fk_table_another for names of foreign key constraints

create table customer
(
    customer_name varchar(80) not null unique,
    customer_street varchar(255) not null,
    customer_city varchar(30) not null,
    constraint pk_customer primary key (customer_name)
);

create table branch
(
    branch_name varchar(80) not null unique,
    branch_city varchar(30) not null,
    assets numeric(16, 4) not null,
    constraint pk_branch primary key (branch_name)
);

create table account
(
    account_number char(5) not null unique,
    branch_name varchar(80) not null,
    balance numeric(16, 4) not null,
    constraint pk_account primary key (account_number),
    constraint fk_account_branch foreign key (branch_name) references branch (
        branch_name
    )
);

create table depositor
(
    customer_name varchar(80) not null,
    account_number char(5) not null,
    constraint pk_depositor primary key (customer_name, account_number),
    constraint fk_depositor_customer foreign key (
        customer_name
    ) references customer (customer_name),
    constraint fk_depositor_account foreign key (
        account_number
    ) references account (account_number)
);

create table loan
(
    loan_number char(5) not null unique,
    branch_name varchar(80) not null,
    amount numeric(16, 4) not null,
    constraint pk_loan primary key (loan_number),
    constraint fk_loan_branch foreign key (branch_name) references branch (
        branch_name
    )
);

create table borrower
(
    customer_name varchar(80) not null,
    loan_number char(5) not null,
    constraint pk_borrower primary key (customer_name, loan_number),
    constraint fk_borrower_customer foreign key (
        customer_name
    ) references customer (customer_name),
    constraint fk_borrower_loan foreign key (loan_number) references loan (
        loan_number
    )
);

----------------------------------------
-- Populate Relations
----------------------------------------

insert into customer values ('Adams', 'Main Street', 'Lisbon');
insert into customer values ('Brown', 'Main Street', 'Oporto');
insert into customer values ('Cook', 'Main Street', 'Lisbon');
insert into customer values ('Davis', 'Church Street', 'Oporto');
insert into customer values ('Evans', 'Forest Street', 'Coimbra');
insert into customer values ('Flores', 'Station Street', 'Braga');
insert into customer values ('Gonzalez', 'Sunny Street', 'Faro');
insert into customer values ('Iacocca', 'Spring Steet', 'Coimbra');
insert into customer values ('Johnson', 'New Street', 'Cascais');
insert into customer values ('King', 'Garden Street', 'Aveiro');
insert into customer values ('Lopez', 'Grand Street', 'Vila Real');
insert into customer values ('Martin', 'Royal Street', 'Braga');
insert into customer values ('Nguyen', 'School Street', 'Castelo Branco');
insert into customer values ('Oliver', 'First Stret', 'Oporto');
insert into customer values ('Parker', 'Hope Street', 'Oporto');

insert into branch values ('Central', 'Guimarães', 2100000);
insert into branch values ('Clerigos', 'Oporto', 3900000);
insert into branch values ('Downtown', 'Lisbon', 1900000);
insert into branch values ('Metro', 'Amadora', 400200);
insert into branch values ('Round Hill', 'Amadora', 8000000);
insert into branch values ('Ship Terminal', 'Sintra', 0400000);
insert into branch values ('University', 'Vila Real', 7200000);
insert into branch values ('Uptown', 'Amadora', 1700000);
insert into branch values ('Wine Celar', 'Oporto', 4002800);

insert into account values ('A-101', 'Downtown', 500);
insert into account values ('A-102', 'Uptown', 700);
insert into account values ('A-201', 'Uptown', 900);
insert into account values ('A-215', 'Metro', 600);
insert into account values ('A-217', 'University', 650);
insert into account values ('A-222', 'Central', 550);
insert into account values ('A-305', 'Round Hill', 800);
insert into account values ('A-333', 'Central', 750);
insert into account values ('A-444', 'Downtown', 850);

insert into depositor values ('Cook', 'A-102');
insert into depositor values ('Johnson', 'A-101');
insert into depositor values ('Cook', 'A-101');
insert into depositor values ('Johnson', 'A-201');
insert into depositor values ('Brown', 'A-215');
insert into depositor values ('Iacocca', 'A-217');
insert into depositor values ('Evans', 'A-222');
insert into depositor values ('Flores', 'A-305');
insert into depositor values ('Oliver', 'A-333');
insert into depositor values ('Brown', 'A-444');

insert into loan values ('L-11', 'Round Hill', 6000);
insert into loan values ('L-14', 'Downtown', 4000);
insert into loan values ('L-15', 'Uptown', 3000);
insert into loan values ('L-16', 'Uptown', 7000);
insert into loan values ('L-17', 'Downtown', 1000);
insert into loan values ('L-20', 'Downtown', 8000);
insert into loan values ('L-21', 'Central', 9000);
insert into loan values ('L-23', 'Central', 2000);
insert into loan values ('L-93', 'Metro', 5000);

insert into borrower values ('Brown', 'L-11');
insert into borrower values ('Nguyen', 'L-14');
insert into borrower values ('Cook', 'L-15');
insert into borrower values ('Iacocca', 'L-16');
insert into borrower values ('Gonzalez', 'L-17');
insert into borrower values ('Iacocca', 'L-17');
insert into borrower values ('Parker', 'L-20');
insert into borrower values ('Brown', 'L-21');
insert into borrower values ('Brown', 'L-23');
insert into borrower values ('Davis', 'L-93');
