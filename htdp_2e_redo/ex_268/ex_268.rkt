#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 268. An inventory record specifies the name of an item, a description,
the acquisition price, and the recommended sales price.

Define a function that sorts a list of inventory records by the difference
between the two prices.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct ir [name desc buy_price sell_price])
; (make-ir String String Number Number)
; Interp.: (make-ir n d b s), an inventory record containing an item's name (n),
; description (d), acquisition price (b), and suggested retail price (s)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

