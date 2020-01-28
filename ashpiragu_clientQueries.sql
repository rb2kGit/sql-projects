
DROP TABLE orders;

DESCRIBE customer;

CREATE TABLE orders (
    order_id NUMBER(5),
    inv_id  NUMBER(5),
    order_date  DATE DEFAULT SYSDATE NOT NULL,
    cust_id NUMBER(6) NOT NULL,
    order_price NUMBER(8, 2),
    quantity NUMBER(3) CONSTRAINT qant_chk CHECK(quantity > 0),
    CONSTRAINT orders_pk PRIMARY KEY(order_id, inv_id));
    
ALTER TABLE orders
ADD CONSTRAINT orders_customer_fk FOREIGN KEY(cust_id) REFERENCES customer(custID);

ALTER TABLE orders
ADD CONSTRAINT orders_inventory_fk FOREIGN KEY(inv_id) REFERENCES inventory(invid);

INSERT INTO orders (order_id, inv_id, order_date, cust_id, order_price, quantity) 
    values (1057, 11668, '29-MAY-12', 107, 259.99, 1);
    
INSERT INTO orders (order_id, inv_id, order_date, cust_id, order_price, quantity) 
    values (1057, 11776, '29-MAY-12', 107, 59.90, 2);
    
INSERT INTO orders (order_id, inv_id, order_date, cust_id, order_price, quantity) 
    values (1058, 11777, '29-MAY-12', 232, 29.95, 1);
    
INSERT INTO orders (order_id, inv_id, order_date, cust_id, order_price, quantity) 
    values (1059, 11780, '31-MAY-12', 154, 59.95, 1);
    
INSERT INTO orders (order_id, inv_id, order_date, cust_id, order_price, quantity) 
    values (1060, 11775, '31-MAY-12', 154, 59.90, 2);
    
INSERT INTO orders (order_id, inv_id, order_date, cust_id, order_price, quantity) 
    values (1061, 11779, '01-JUN-12', 179, 59.95, 1);
    
UPDATE customer
SET fname = 'LARRY'
WHERE fname = 'LEE' AND lname = 'MILLER'; 


ALTER TABLE inventory
RENAME COLUMN QOH TO QUANTITY_ON_HAND;

DESCRIBE inventory;


DELETE FROM customer
WHERE CUSTID NOT IN ((SELECT cust_id
                     FROM orders));
                     

SELECT item_desc, category
FROM item;


SELECT itemid, AVG(QUANTITY_ON_HAND)
FROM inventory
GROUP BY itemid, QUANTITY_ON_HAND
ORDER BY AVG(QUANTITY_ON_HAND) ASC;


SELECT fname, lname, custid
FROM customer
WHERE custID IN ((SELECT cust_id
                 FROM orders
                 WHERE quantity > 1));
                 

SELECT c.custId, SUM(o.order_price)
FROM customer c JOIN orders o
ON (c.custid = o.cust_id)
GROUP BY c.custid, o.order_price
ORDER BY c.custid DESC;


SELECT C.custid, C.fname || ' ' || C.lname, o.order_id, o.order_price
FROM customer C LEFT JOIN orders o
ON (c.custid = o.cust_id);

SELECT c.custid, c.fname || ' ' || c.lname AS "CUSTOMER_NAME", o.order_id, o.order_date,
    i.invid, i.itemid, i.itemdesc, i.itemsize, i.color, i.curr_price, i.quantity_on_hand, 
    SUM(i.curr_price) AS "ORDER_TOTAL_AMOUNT
FROM customer c JOIN orders o 
ON (c.custid = o.cust_id) JOIN inventory i ON (i.invid = o.inv_id); 