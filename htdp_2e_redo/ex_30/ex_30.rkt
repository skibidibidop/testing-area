#|
Author: Mark Beltran
Date: July 19, 2023

Exercise 30.

Sample Problem
The owner of a monopolistic movie theater in
a small town has complete freedom in setting ticket prices. The
more he charges, the fewer people can afford tickets. The less he
charges, the more it costs to run a show because attendance goes
up. In a recent experiment the owner determined a relationship
between the price of a ticket and average attendance.
At a price of $5.00 per ticket, 120 people attend a performance.
For each 10-cent change in the ticket price, the average attendance
changes by 15 people. That is, if the owner charges $5.10,
some 105 people attend on the average; if the price goes down
to $4.90, average attendance increases to 135. Let’s translate this
idea into a mathematical formula:

avg. attendance = 120 people - ($(change in price)/$0.10) * 15 people
|#

; CONSTANTS

(define ATTENDEES 120)
(define TICKET_PRICE 5.0)
(define DELTA_PRICE 0.1)
(define DELTA_ATTENDANCE 15)
(define VAR_COST 1.50)
(define DEL_PRICE_PER_ATTEND
  (/ DELTA_ATTENDANCE DELTA_PRICE))

; FUNCTIONS

(define (attendees ticket-price)
  (- ATTENDEES (* (- ticket-price TICKET_PRICE)
                  DEL_PRICE_PER_ATTEND)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* VAR_COST (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
