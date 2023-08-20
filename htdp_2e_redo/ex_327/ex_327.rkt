;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_327) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 20, 2023

Exercise 327. Design the function create-bst-from-list. It consumes a list of
numbers and names and produces a BST by repeatedly applying create-bst.
Here is the signature:

; [List-of [List Number Symbol]] -> BST

Use the complete function to create a BST from this sample input:

'((99 o)
  (77 l)
  (24 i)
  (10 h)
  (95 g)
  (15 d)
  (89 c)
  (29 b)
  (63 a))

The result is tree A in figure 119, if you follow the structural design recipe.
If you use an existing abstraction, you may still get this tree but you may
also get an “inverted” one. Why?

|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct no-info [])
(define NONE (make-no-info))

(define-struct node [ssn name left right])
; A BT is one of:
; NONE
; (make-node Number Symbol BT BT])

; A BST is a BT with nodes sorted in descending order based on [ssn]

(define TREE_A
  (make-node 63 'a
             (make-node 29 'b
                        (make-node 15 'd
                                   (make-node 10 'h
                                              NONE
                                              NONE)
                                   (make-node 24 'i
                                              NONE
                                              NONE))
                        NONE)
             (make-node 89 'c
                        (make-node 77 'l
                                   NONE
                                   NONE)
                        (make-node 95 'g
                                   NONE
                                   (make-node 99 'o
                                              NONE
                                              NONE)))))

(define LIST_FOR_BST '((99 o)
                       (77 l)
                       (24 i)
                       (10 h)
                       (95 g)
                       (15 d)
                       (89 c)
                       (29 b)
                       (63 a)))
                        
; FUNCTIONS ////////////////////////////////////////////////////////////////////

; [List-of [List-of Number Symbol]] -> BST
; Creates a BST from l
(check-expect (create-bst-from-list LIST_FOR_BST) TREE_A)

(define (create-bst-from-list l)
  (local
    [(define (create-bst2 from_l b)
       (cond
         [(no-info? b)
          (make-node (first from_l) (second from_l) NONE NONE)]
         [(< (node-ssn b) (first from_l))
          (make-node (node-ssn b) (node-name b)
                     (node-left b)
                     (create-bst2 from_l (node-right b)))]
         [(> (node-ssn b) (first from_l))
          (make-node (node-ssn b) (node-name b)
                     (create-bst2 from_l (node-left b))
                     (node-right b))]))]
    
    (foldr create-bst2 NONE l)))
