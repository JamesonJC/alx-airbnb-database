SELECT count(*),
ROW_NUMBER() OVER (PARTITION BY status_id) AS row_num,
RANK() OVER (PARTITION BY created_at) AS rank_time
FROM "Booking"
GROUP BY "Booking".status_id, "Booking".created_at""