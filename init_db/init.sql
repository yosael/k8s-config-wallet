create table user_app (
	user_id text primary key,
	email text not null,
	created_date date not null default CURRENT_TIMESTAMP,
	updated_date date not null default CURRENT_TIMESTAMP
);


create table account_type (
	account_id serial primary key,
	description text not null unique,
	created_date date not null default CURRENT_TIMESTAMP
);

create table currency (
	currency_id serial primary key,
	description text not null unique,
	created_date date not null default CURRENT_TIMESTAMP,
	updated_date date not null default CURRENT_TIMESTAMP,
	longname text,
	simbol text,
	dollar_price decimal,
	default_to_exchange_rate boolean
);

create table category (
	category_id serial primary key,
	category_name text not null unique,
	created_date date not null default CURRENT_TIMESTAMP
);


create table account(
	account_id serial primary key,
	account_type_id integer not null references account_type(account_id),
	currency_id integer not null references currency(currency_id),
	user_id text not null references user_app(user_id),
	account_name text not null,
	current_balance decimal not null,
	created_date date not null default CURRENT_TIMESTAMP,
	updated_date date not null default CURRENT_TIMESTAMP
);


create table expense (
	expense_id serial primary key,
	account_id integer not null references account(account_id),
	category_id integer not null references category(category_id),
	currency_id integer not null references currency(currency_id),
	amount decimal not null,
	note text,
	status text,
	created_date date not null default CURRENT_TIMESTAMP,
	created_time time not null default CURRENT_TIMESTAMP
);


create table income (
	income_id serial primary key,
	account_id integer not null references account(account_id),
	category_id integer not null references category(category_id),
	currency_id integer not null references currency(currency_id),
	amount decimal not null,
	note text,
	status text,
	created_date date not null default CURRENT_TIMESTAMP,
	created_time time not null default CURRENT_TIMESTAMP
);


create table transfer (
	transfer_id serial primary key,
	account_id_from integer not null references account(account_id),
	account_id_to integer not null references account(account_id),
	currency_id integer not null references currency(currency_id),
	amount decimal not null,
	note text,
	status text,
	created_date date not null default CURRENT_TIMESTAMP,
	created_time time not null default CURRENT_TIMESTAMP
);

--INSER Account Type

INSERT INTO account_type (description) values ('General');
INSERT INTO account_type (description) values ('Cash');
INSERT INTO account_type (description) values ('Saving Account');
INSERT INTO account_type (description) values ('Investment');
INSERT INTO account_type (description) values ('Bank Account');
INSERT INTO account_type (description) values ('Credit Card');


--INSERT Currency

INSERT INTO currency (description,longname,simbol,dollar_price,default_to_exchange_rate) values ('USD','Dollar','$',1,true);
INSERT INTO currency (description,longname,simbol,dollar_price,default_to_exchange_rate) values ('EUR','Euro','€',1.16,false);
INSERT INTO currency (description,longname,simbol,dollar_price,default_to_exchange_rate) values ('BTC','Bitcoin','B',61000,false);


--insert categories

INSERT INTO category (category_name) values ('Food and Drinks');
INSERT INTO category (category_name) values ('Housing');
INSERT INTO category (category_name) values ('Shopping');
INSERT INTO category (category_name) values ('Transportation');
INSERT INTO category (category_name) values ('Entertainment');
INSERT INTO category (category_name) values ('Communication/Internet');
INSERT INTO category (category_name) values ('Cellphone');
INSERT INTO category (category_name) values ('Income');
INSERT INTO category (category_name) values ('Other');

