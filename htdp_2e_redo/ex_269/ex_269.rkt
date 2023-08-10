#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 269. Define eliminate-expensive. The function consumes
a number, ua, and a list of inventory records, and it produces a list of all
those structures whose sales price is below ua.

Then use filter to define recall, which consumes the name of an inventory item,
called ty, and a list of inventory records and which produces a list of
inventory records that do not use the name ty.

In addition, define selection, which consumes two lists of names and
selects all those from the second one that are also on the first.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct ir [name desc buy sell])
; (make-ir String String Number Number)
; Interp.: (make-ir n d b s), an inventory record containing an item's name (n),
; description (d), acquisition price (b), and suggested retail price (s)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

(define IR_LIST
  (list (make-ir "Item1" "#1" 10 20)
        (make-ir "Item2" "#2" 40 200)
        (make-ir "Item3" "#3" 3 10)
        (make-ir "Item4" "#4" 50 70)))

; Number [List-of Ir] -> [List-of Ir]
; Creates a list of Irs whose sale price is below Number ua
(check-expect (eliminate-expensive 3 IR_LIST) '())
(check-expect (eliminate-expensive 100 '()) '())
(check-expect (eliminate-expensive 60 IR_LIST)
              (list (make-ir "Item1" "#1" 10 20)
                    (make-ir "Item3" "#3" 3 10)))
(check-expect (eliminate-expensive 300 IR_LIST) IR_LIST)

(define (eliminate-expensive ua lir)
  (local
    [; Ir -> Boolean
     (define (in_range? an-ir)
       (< (ir-sell an-ir) ua))]
    (filter in_range? lir)))
