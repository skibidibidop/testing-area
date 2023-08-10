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
(define NAMES1 (list "Name1" "Name2" "Name3" "Name4"))
(define NAMES2 (list "Name3" "Name4" "Name5" "Name6"))

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

; String [List-of Ir] -> [List-of Ir]
; Removes any item in the provided list of inventory records with the name
; String ty
(check-expect (recall "Item1" '()) '())
(check-expect (recall "Item2" IR_LIST)
              (list (make-ir "Item1" "#1" 10 20)
                    (make-ir "Item3" "#3" 3 10)
                    (make-ir "Item4" "#4" 50 70)))
(check-expect (recall "Hey" IR_LIST) IR_LIST)

(define (recall ty lir)
  (local
    [(define (not-ty? an-ir)
       (not (string=? (ir-name an-ir) ty)))]
    (filter not-ty? lir)))

; [List-of String] [List-of String] -> [List-of String]
; Creates a list of names that are in both the provided lists
(check-expect (selection NAMES1 '()) '())
(check-expect (selection NAMES2 '()) '())
(check-expect (selection NAMES1 NAMES2) (list "Name3" "Name4"))

(define (selection ln1 ln2)
  (local
    [; String -> Boolean
     (define (in-list? a-name)
       (member? a-name ln2))]
  (filter in-list? ln1)))
         
