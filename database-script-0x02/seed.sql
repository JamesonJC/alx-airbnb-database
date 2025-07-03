gi-- ==========================
-- 1. Seed Lookup Tables
-- ==========================

-- User roles
INSERT INTO "UserRole" (role_id, role_name) VALUES
  ('00000000-0000-0000-0000-000000000001', 'guest'),
  ('00000000-0000-0000-0000-000000000002', 'host'),
  ('00000000-0000-0000-0000-000000000003', 'admin');

-- Booking status
INSERT INTO "BookingStatus" (status_id, status_name) VALUES
  ('00000000-0000-0000-0000-000000000010', 'pending'),
  ('00000000-0000-0000-0000-000000000011', 'confirmed'),
  ('00000000-0000-0000-0000-000000000012', 'canceled');

-- Payment methods
INSERT INTO "PaymentMethod" (method_id, method_name) VALUES
  ('00000000-0000-0000-0000-000000000020', 'credit_card'),
  ('00000000-0000-0000-0000-000000000021', 'paypal'),
  ('00000000-0000-0000-0000-000000000022', 'stripe');

-- Locations
INSERT INTO "Location" (location_id, city, state, country) VALUES
  ('loc-nyc-001', 'New York', 'NY', 'USA'),
  ('loc-jhb-001', 'Johannesburg', 'JHB', 'RSA'),
  ('loc-par-001', 'Paris', NULL, 'France');

-- ==========================
-- 2. Users
-- ==========================

INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role_id) VALUES
  ('user-001', 'Alice', 'Smith', 'alice@example.com', 'hash1', '1234567890', '00000000-0000-0000-0000-000000000001'),
  ('user-002', 'Bob', 'Johnson', 'bob@example.com', 'hash2', '2345678901', '00000000-0000-0000-0000-000000000002'),
  ('user-003', 'Charlie', 'Admin', 'admin@example.com', 'hash3', NULL, '00000000-0000-0000-0000-000000000003');

-- ==========================
-- 3. Properties
-- ==========================

INSERT INTO "Property" (property_id, host_id, name, description, location_id, pricepernight) VALUES
  ('prop-001', 'user-002', 'Sunny Loft NYC', 'Cozy loft in downtown Manhattan', 'loc-nyc-001', 150.00),
  ('prop-002', 'user-002', 'Beach House LA', 'A house near Venice Beach', 'loc-la-001', 200.00),
  ('prop-003', 'user-002', 'Romantic Paris Flat', 'Perfect for couples', 'loc-par-001', 120.00);

-- ==========================
-- 4. Bookings
-- ==========================

INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date, total_price, status_id) VALUES
  ('book-001', 'prop-001', 'user-001', '2025-07-01', '2025-07-05', 600.00, '00000000-0000-0000-0000-000000000011'),
  ('book-002', 'prop-002', 'user-001', '2025-08-10', '2025-08-12', 400.00, '00000000-0000-0000-0000-000000000010');

-- ==========================
-- 5. Payments
-- ==========================

INSERT INTO "Payment" (payment_id, booking_id, amount, payment_date, method_id) VALUES
  ('pay-001', 'book-001', 600.00, '2025-06-25', '00000000-0000-0000-0000-000000000020'),
  ('pay-002', 'book-002', 400.00, '2025-06-26', '00000000-0000-0000-0000-000000000021');

-- ==========================
-- 6. Reviews
-- ==========================

INSERT INTO "Review" (review_id, property_id, user_id, rating, comment) VALUES
  ('rev-001', 'prop-001', 'user-001', 5, 'Absolutely loved it! Clean, comfy, and a great location.'),
  ('rev-002', 'prop-002', 'user-001', 4, 'Nice place, but a bit noisy at night.');

-- ==========================
-- 7. Messages
-- ==========================

INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body) VALUES
  ('msg-001', 'user-001', 'user-002', 'Hi, is the loft available for early check-in?'),
  ('msg-002', 'user-002', 'user-001', 'Yes, you can check in after 12pm.');
