-- create tCustomer
CREATE TABLE tCustomer (
	cust_id  INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(64),
	cr_date DATE,
	country_code VARCHAR(3)
);

-- create tBet
CREATE TABLE tBet (
	bet_id INT AUTO_INCREMENT PRIMARY KEY,
	cust_id INT,
	seln_id INT,
	plc_date DATE,
	price DECIMAL(9,6),
	amount DECIMAL(12,3),
	FOREIGN KEY (cust_id)
 	       REFERENCES tCustomer (cust_id)
        	ON UPDATE RESTRICT ON DELETE CASCADE
);
