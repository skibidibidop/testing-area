#|
Author: Mark Beltran
Date: August 18, 2023

Exercise 323. Design search-bt. The function consumes a number
n and a BT. If the tree contains a node structure whose ssn field is n, the
function produces the value of the name field in that node. Otherwise, the
function produces #false.

Hint Consider using contains-bt? to check the entire tree first or
boolean? to check the result of the natural recursion at each stage.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct no-info [])
(define NONE (make-no-info))

(define-struct node [ssn name left right])
; A BT (short for BinaryTree) is one of:
; NONE
; (make-node Number Symbol BT BT)

; Trees provided as examples:

(define TREE_A
  (make-node
   15
   'd
   NONE
   (make-node
    24 'i NONE NONE)))

(define TREE_B
  (make-node
   15
   'd
   (make-node
    87 'h NONE NONE)
   NONE))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number BT -> Boolean
; Is n in bt
(check-expect (contains-bt? 12 NONE) #false)
(check-expect (contains-bt? 15 TREE_A) #true)
(check-expect (contains-bt? 24 TREE_A) #true)
(check-expect (contains-bt? 30 TREE_A) #false)

(define (contains-bt? n bt)
  (cond
    [(no-info? bt) #false]
    [else
     (or (= n (node-ssn bt) n)
         (contains-bt? n (node-left bt))
         (contains-bt? n (node-right bt)))]))
