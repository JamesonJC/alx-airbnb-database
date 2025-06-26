# Airbnb ER Diagram Requirements

## 0. Overview

This document defines the **Entities and Relationships** used in the Airbnb database schema. It is part of the ALX Airbnb Clone project and outlines how the data model supports the core functionalities such as user management, property listings, bookings, reviews, messaging, and payments.

---

## 1. Entities Identified
- User
- Property
- Booking
- Payment
- Review
- Message
---

## 2. Relationships
- User to Property (1:M)
- User to Booking (1:M)
- User to Review (1:M)
- User to Message (1:M) [sender and recipient]
- Property to Booking (1:M)
- Property to Review (1:M)
- Booking to Payment (1:1)
---

## 3. Diagram