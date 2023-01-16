TRUNCATE TABLE accounts, posts RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (email_address, username) VALUES ('1234@yahoo.com', '1234new');
INSERT INTO accounts (email_address, username) VALUES ('5678@hotmail.com', '5678old');

INSERT INTO posts (title, content, views, account_id) VALUES ('Day one', 'Trip to Manchester', '5', '1');
INSERT INTO posts (title, content, views, account_id) VALUES ('Day two', 'Trip to London', '10', '2');
INSERT INTO posts (title, content, views, account_id) VALUES ('Day three', 'Trip to Cardiff', '6', '1');
INSERT INTO posts (title, content, views, account_id) VALUES ('Day four', 'Trip to Glasgow', '9', '2');