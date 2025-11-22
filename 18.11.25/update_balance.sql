
CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    balance NUMERIC(10, 2) NOT NULL
);

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    acc_id INT REFERENCES accounts(id),
    amount NUMERIC(10, 2) NOT NULL
);

INSERT INTO accounts (balance) VALUES
(100.00),
(500.00),
(200.00); 

INSERT INTO transactions (acc_id, amount) VALUES
(1, 50.00),
(2, 100.00),
(1, -20.00);

UPDATE 
    accounts a  
SET 
    balance = a.balance + t.sum_amount  
FROM 
    ( 
        SELECT 
            acc_id, 
            SUM(amount) AS sum_amount 
        FROM 
            transactions
        GROUP BY 
            acc_id
    ) AS t
WHERE 
    a.id = t.acc_id; 

SELECT * FROM accounts ORDER BY id;