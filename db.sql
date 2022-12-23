CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  age INTEGER,
  country TEXT
);
CREATE TABLE transactions (
  id INTEGER PRIMARY KEY,
  created TIMESTAMP NOT NULL,
  user_id INTEGER NOT NULL,
  amount DECIMAL NOT NULL
);
CREATE TABLE deliveries (
  id INTEGER PRIMARY KEY,
  created TIMESTAMP NOT NULL,
  transaction_id INTEGER NOT NULL,
  status TEXT NOT NULL
);
INSERT INTO users VALUES (1, 'Ryan', 'Gosling', 35, 'US');
INSERT INTO users VALUES (2, 'Joanna', 'Kowalska', NULL, 'PL');
INSERT INTO users VALUES (3, 'Kasia', 'Dyl', 30, 'PL');
INSERT INTO users VALUES (4, 'Robert', 'Nowak', 22, 'PL');
INSERT INTO users VALUES (5, 'Klaudia', 'Niebieska', 48, 'UK');
INSERT INTO users VALUES (6, 'Maciej', 'Kruk', NULL, NULL);

INSERT INTO transactions VALUES (1, '2022-12-01 9:00:00', 3, 50);
INSERT INTO transactions VALUES (2, '2021-09-18 8:15:00', 3, 120.15);
INSERT INTO transactions VALUES (3, '2022-11-22 11:10:29', 1, 50.34);
INSERT INTO transactions VALUES (4, '2022-01-01 23:38:37', 2, 150);
INSERT INTO transactions VALUES (5, '2021-07-19 19:05:10', 5, 9.99);
INSERT INTO transactions VALUES (6, '2020-12-11 11:00:09', 3, 12.06);

INSERT INTO deliveries VALUES (1, '2022-12-03 19:00:00', 1, 'PENDING');
INSERT INTO deliveries VALUES (2, '2021-09-20 18:25:10', 2, 'DELIVERED');
INSERT INTO deliveries VALUES (3, '2022-12-01 13:42:39', 3, 'DELIVERED');
INSERT INTO deliveries VALUES (4, '2022-01-04 9:12:37', 4, 'DELIVERED');
INSERT INTO deliveries VALUES (5, '2020-12-13 17:30:18', 6, 'PENDING');
INSERT INTO deliveries VALUES (6, '2021-07-19 19:15:10', 5, 'CANCELLED');
