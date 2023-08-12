#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 286. An inventory record specifies the name of an inventory
item, a description, the acquisition price, and the recommended sales price.

Define a function that sorts a list of inventory records by the difference
between the two prices.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct ir [name desc buy sell])
; An InventoryReport is a structure:
; (make-ir String String Number Number)
; Interp.: (make-ir n d b s) represents an item's name (n), description (d),
; acquisition price (b), and selling price (s)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; [List-of InventoryRecord] -> [List-of InventoryRecord]
; Sorts a list of InventoryRecord by the difference between each item's
; acquisition price and selling price (descending)
(check-expect (sort_ir '()) '())
(check-expect (sort_ir (list (make-ir "Item1" "Desc1" 10 20)
                             (make-ir "Item2" "Desc2" 5 10)
                             (make-ir "Item3" "Desc3" 100 200)
                             (make-ir "Item4" "Desc4" 80 100)))
              (list (make-ir "Item3" "Desc3" 100 200)
                    (make-ir "Item4" "Desc4" 80 100)
                    (make-ir "Item1" "Desc1" 10 20)
                    (make-ir "Item2" "Desc2" 5 10)))

(define (sort_ir lir)
  (sort
   lir
   (lambda (ir1 ir2)
     (> (- (ir-sell ir1) (ir-buy ir1))
        (- (ir-sell ir2) (ir-buy ir2))))))
