#|
Author: Mark Beltran
Date: August 12, 2023

Exercise 287. Use filter to define eliminate-exp. The function
consumes a number, ua, and a list of inventory records (containing name
and price), and it produces a list of all those structures whose acquisition
price is below ua.

Then use filter to define recall, which consumes the name of an
inventory item, called ty, and a list of inventory records and which produces
a list of inventory records that do not use the name ty.

In addition, define selection, which consumes two lists of names and
selects all those from the second one that are also on the first.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct ir [name price])
; An InventoryRecord is a structure
; (make-ir String Number)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number [List-of InventoryRecord]
; Creates a list of InventoryRecord of containing items with prices below ua
(check-expect (eliminate-exp 10 '()) '())
(check-expect (eliminate-exp 20 (list (make-ir "Item1" 100)
                                      (make-ir "Item2" 10)
                                      (make-ir "Item3" 50)
                                      (make-ir "Item4" 20)
                                      (make-ir "Item5" 5)))
              (list (make-ir "Item2" 10)
                    (make-ir "Item5" 5)))

(define (eliminate-exp ua lir)
  (filter
   (lambda (an_ir)
     (< (ir-price an_ir) ua))
   lir))

; String [List-of InventoryRecord] -> [List-of InventoryRecord]
; Removes all InventoryRecords with ir-name ty
(check-expect (recall "item1" '()) '())
(check-expect (recall "item2" (list (make-ir "item1" 30)
                                    (make-ir "item2" 40)
                                    (make-ir "item3" 10)))
              (list (make-ir "item1" 30)
                    (make-ir "item3" 10)))

(define (recall ty lir)
  (filter
   (lambda (an_ir)
     (not (string=? (ir-name an_ir) ty)))
   lir))
