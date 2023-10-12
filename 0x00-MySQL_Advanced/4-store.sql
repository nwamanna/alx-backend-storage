-- Write a SQL script that creates a trigger that decreases the quantity of an item after adding a new order.

-- Quantity in the table items can be negative.


DELIMITER $$
CREATE TRIGGER decrease_inventory AFTER INSERT ON orders FOR EACH ROW
BEGIN
UPDATE items
SET quantity =  quantity - New.number
WHERE name = NEW.item_name;
END $$
DELIMITER ;
