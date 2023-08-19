#|
Author: Mark Beltran
Date: August 19, 2023

Exercise 325. Design search-bst. The function consumes a number
n and a BST. If the tree contains a node whose ssn field is n, the function
produces the value of the name field in that node. Otherwise, the function
produces NONE. The function organization must exploit the BST invariant
so that the function performs as few comparisons as necessary.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct no-info [])
(define NONE (make-no-info))

(define-struct node [ssn name left right])
; A BST (short for BinarySearchTree) is one of:
; NONE
; (make-node Number Symbol BST BST)
; Constraint:
; Each node's [left] should only contain node/s with ssn values
; less than itself or NONE
; Each node's [right] should only contain node/s with ssn values
; more than itself or NONE

(define A_BST
  (make-node 20 'a
             (make-node 10 'b
                        (make-node 5 'c
                                   NONE
                                   NONE)
                        (make-node 15 'e
                                   NONE
                                   NONE))
             (make-node 30 'g
                        (make-node 25 'h
                                   NONE
                                   NONE)
                        (make-node 35 'j
                                   NONE
                                   NONE))))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Number BST -> Symbol
; Returns [name] of a node in bst that has [ssn] that is equal to n, and #false
; if there is no match
(check-expect (search-bst 20 A_BST) 'a)
(check-expect (search-bst 5  A_BST) 'c)
(check-expect (search-bst 35 A_BST) 'j)
(check-expect (search-bst 50 A_BST) #false)

(define (search-bst n bst)
  (cond
    [(no-info? bst) #false]
    [(= (node-ssn bst) n) (node-name bst)]
    [(< (node-ssn bst) n) (search-bst n (node-right bst))]
    [(> (node-ssn bst) n) (search-bst n (node-left bst))]))
