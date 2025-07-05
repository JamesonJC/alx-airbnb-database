
SELECT last_name, first_name, email
    FROM (SELECT * --- user_id, booking_id, first_name, last_name, email, start_date, end_date, total_price, status_id ---
            FROM "Booking" --AS b ---
            INNER JOIN "User" -- AS u ---
            ON "Booking".user_id = "User".user_id);
--- ["SELECT", ("INNER JOIN",) "FROM"]
--- ["FULL OUTER JOIN"]   
--- ["LEFT JOIN", "ORDER BY"]          
