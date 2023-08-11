#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 281. Write down a lambda expression that

1. consumes a number and decides whether it is less than 10;
2. multiplies two given numbers and turns the result into a string;
3. consumes a natural number and returns 0 for evens and 1 for odds;
4. consumes two inventory records and compares them by price; and
5. adds a red dot at a given Posn to a given Image.

Demonstrate how to use these functions in the interactions area.
|#

(require 2htdp/image)

; 1. consumes a number and decides whether it is less than 10;
((lambda (a) (< a 10))
 13)

; 2. multiplies two given numbers and turns the result into a string;
((lambda (a b)
   (number->string (* a b)))
 3 4)

; 3. consumes a natural number and returns 0 for evens and 1 for odds;
((lambda (a)
   (modulo a 2))
 1345)

; 4. consumes two inventory records and compares them by price; and
(define-struct ir [name price])

; Ir Ir -> Boolean
; #true if a's ir-price > b's ir-price, false otherwise
((lambda (a b)
   (> (ir-price a) (ir-price b)))
 (make-ir "Item1" 100)
 (make-ir "Item2" 200))

; 5. adds a red dot at a given Posn to a given Image.
(define RED_DOT (circle 10 "solid" "red"))
(define BG (empty-scene 100 100))

; Posn Image -> Image
((lambda (coord bg)
   (place-image RED_DOT
                (posn-x coord) (posn-y coord)
                bg))
 (make-posn 30 40)
 BG)
