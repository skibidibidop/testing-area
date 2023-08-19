#|
Author: Mark Beltran
Date: August 19, 2023

Exercise 326. Design the function create-bst. It consumes a BST B, a
number N, and a symbol S. It produces a BST that is just like B and that in
place of one NONE subtree contains the node structure

(make-node N S NONE NONE)

Once the design is completed, use the function on tree A from figure 119.
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
                (create-bst (node-right bst) num sym)
                (node-right bst))]))
                
