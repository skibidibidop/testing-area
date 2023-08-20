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
                        (make-node 15 'c
                                   (make-node 10 'd
                                              NONE
                                              NONE)
                                   (make-node 24 'e
                                              NONE
                                              NONE))
                        NONE)
             (make-node 89 'f
                        (make-node 77 'g
                                   NONE
                                   NONE)
                        (make-node 95 'h
                                   NONE
                                   (make-node 99 'i
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

; BST Number Symbol -> BST
; Adds (make-node num sym NONE NONE) to bst
(check-expect (create-bst TREE_A 0 'z)
              (make-node 63 'a
                         (make-node 29 'b
                                    (make-node 15 'c
                                               (make-node 10 'd
                                                          (make-node 0 'z
                                                                     NONE
                                                                     NONE)
                                                          NONE)
                                               (make-node 24 'e
                                                          NONE
                                                          NONE))
                                    NONE)
                         (make-node 89 'f
                                    (make-node 77 'g
                                               NONE
                                               NONE)
                                    (make-node 95 'h
                                               NONE
                                               (make-node 99 'i
                                                          NONE
                                                          NONE)))))
(check-expect (create-bst TREE_A 150 'y)
              (make-node 63 'a
                         (make-node 29 'b
                                    (make-node 15 'c
                                               (make-node 10 'd
                                                          NONE
                                                          NONE)
                                               (make-node 24 'e
                                                          NONE
                                                          NONE))
                                    NONE)
                         (make-node 89 'f
                                    (make-node 77 'g
                                               NONE
                                               NONE)
                                    (make-node 95 'h
                                               NONE
                                               (make-node 99 'i
                                                          NONE
                                                          (make-node 150 'y
                                                                     NONE
                                                                     NONE))))))
(check-expect (create-bst TREE_A 80 'x)
              (make-node 63 'a
                         (make-node 29 'b
                                    (make-node 15 'c
                                               (make-node 10 'd
                                                          NONE
                                                          NONE)
                                               (make-node 24 'e
                                                          NONE
                                                          NONE))
                                    NONE)
                         (make-node 89 'f
                                    (make-node 77 'g
                                               NONE
                                               (make-node 80 'x
                                                          NONE
                                                          NONE))
                                    (make-node 95 'h
                                               NONE
                                               (make-node 99 'i
                                                          NONE
                                                          NONE)))))

(define (create-bst bst num sym)
  (cond
    [(no-info? bst) (make-node num sym NONE NONE)]
    [(= num (node-ssn bst)) bst]
    [(< (node-ssn bst) num)
     (make-node (node-ssn bst) (node-name bst)
                (node-left bst)
                (create-bst (node-right bst) num sym))]
    [(> (node-ssn bst) num)
     (make-node (node-ssn bst) (node-name bst)
                (create-bst (node-left bst) num sym)
                (node-right bst))]))

; [List-of [List-of Number Symbol]] -> BST
; Creates a BST from l
(check-expect (create-bst-from-list LIST_FOR_BST) TREE_A)

(define (create-bst-from-list l) '())
