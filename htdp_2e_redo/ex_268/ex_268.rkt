#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 268. An inventory record specifies the name of an item, a description,
the acquisition price, and the recommended sales price.

Define a function that sorts a list of inventory records by the difference
between the two prices.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct ir [name desc buy sell])
; (make-ir String String Number Number)
; Interp.: (make-ir n d b s), an inventory record containing an item's name (n),
; description (d), acquisition price (b), and suggested retail price (s)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; [List-of Ir] -> [List-of Ir]
; Sorts list of Inventory Records according to each item's acquisition price
; and suggested retail price difference (descending)
(check-expect (sort-irs '()) '())
(check-expect (sort-irs
               (list (make-ir "Item1" "Item #1" 10 20)
                     (make-ir "Item2" "Item #2" 5 7)
                     (make-ir "Item3" "Item #3" 50 200)
                     (make-ir "Item4" "Item #4" 30 70)))
              (list (make-ir "Item3" "Item #3" 50 200)
                    (make-ir "Item4" "Item #4" 30 70)
                    (make-ir "Item1" "Item #1" 10 20)
                    (make-ir "Item2" "Item #2" 5 7)))

(define (sort-irs lir)
  (local
    [(; Ir -> Number
      define (delta-price an-ir)
       (- (ir-sell an-ir)
          (ir-buy  an-ir)))
     ; Number Number -> Boolean
     (define (comp-price a b)
       (> (delta-price a) (delta-price b)))]
    (sort lir comp-price)))
