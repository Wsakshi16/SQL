-- Create the Loan table
CREATE TABLE Loan (
    Deal_id INT,
    Merchant_id INT,
    "Funded date" DATE,
    Industry VARCHAR(50),
    "Type" VARCHAR(20)
);

-- Insert sample data in Loan table
INSERT INTO Loan (Deal_id, Merchant_id, "Funded date", Industry, "Type")
VALUES
    (1, 1, TO_DATE('01/01/2016', 'MM/DD/YYYY'), 'Retail', 'New'),
    (100, 80, TO_DATE('04/01/2016', 'MM/DD/YYYY'), 'Construction', 'New'),
    (130, 100, TO_DATE('04/15/2016', 'MM/DD/YYYY'), 'Trucking', 'New'),
    (1010, 1, TO_DATE('6/23/2017', 'MM/DD/YYYY'), 'Retail', 'Renewal'),
    (1051, 100, TO_DATE('7/01/2017', 'MM/DD/YYYY'), 'Trucking', 'Renewal'),
    (1251, 1, TO_DATE('10/01/2017', 'MM/DD/YYYY'), 'Retail', 'Renewal');

SELECT * FROM Loan
-----------------------------------------------------------------
-- Create the Submissions table
CREATE TABLE Submissions (
    Deal_id INT,
    "Loan Amount" INT,
    interest_rate DECIMAL(10, 2),
    rate_type VARCHAR(50)
);

-- Insert sample data in Submissions table
INSERT INTO Submissions (Deal_id, "Loan Amount", interest_rate, rate_type)
VALUES
	(1,10000,8.75,'variable'),
	(100,10000,11.37,'fixed'),
	(1010,15000,8.25,'fixed'),
	(1051,20000,4.75,'variable'),
	(1251,40000,4.75,'variable'),
	(130,10000,3,'variable');

SELECT * FROM Submissions
------------------------------------------------

SELECT
    l.merchant_id,l.Deal_id,
    l."Loan Amount" AS funded_loan_amount
FROM loans l
JOIN (
    SELECT
        Merchant_id,
        MAX(loan_date) AS latest_renewal_date
    FROM loans
    WHERE "type" = 'Renewal'
    GROUP BY merchant_id
) latest_renewal
ON l.merchant_id = latest_renewal.merchant_id
    AND l.loan_date = latest_renewal.latest_renewal_date
WHERE l.loan_type = 'Renewal';