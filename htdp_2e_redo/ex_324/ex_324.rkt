#|
Author: Mark Beltran
Date: August 19, 2023

Exercise 324. Design the function inorder. It consumes a binary tree
and produces the sequence of all the ssn numbers in the tree as they show
up from left to right when looking at a tree drawing.

Hint: Use append, which concatenates lists like thus:

(append (list 1 2 3) (list 4) (list 5 6 7))
==
(list 1 2 3 4 5 6 7)

What does inorder produce for a binary search tree?
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct no-info [])
(define NONE (make-no-info))

(define-struct node [ssn name left right])
; A BT (short for BinaryTree) is one of:
; NONE
; (make-bt Number Symbol BT BT)

; 4 7 5 10 3
(define BT (make-node 10 'a
                      (make-node 5 'b
                                 (make-node 7 'c
                                            (make-node 4 'd
                                             NONE
                                             NONE)
                                            NONE)
                                 NONE)
                      (make-node 3 'e
                                 NONE
                                 NONE)))

; 5 10 15 20 25 30 35
(define BST (make-node 20 'a
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
                                             NONE)))
             
; FUNCTIONS ////////////////////////////////////////////////////////////////////
