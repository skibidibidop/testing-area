#|
Author: Mark Beltran
Date: August 24, 023

Exercise 339. Design find?. The function consumes a Dir and a file
name and determines whether or not a file with this name occurs in the
directory tree.
|#

(require htdp/dir)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define DIR_TREE
  (make-dir "TS"
               (list
                (make-dir "Text"
                             '()
                             (list
                              (make-file "part1" 99 "")
                              (make-file "part2" 52 "")
                              (make-file "part3" 17 "")))
                (make-dir "Libs"
                             (list
                              (make-dir "Code"
                                           '()
                                           (list
                                            (make-file "hang" 8 "")
                                            (make-file "draw" 2 "")))
                              (make-dir "Docs"
                                           '()
                                           (list
                                            (make-file "write!" 19 ""))))
                             '()))
               (list
                (make-file "read!" 10 ""))))

(define DIR_TREE2
  (make-dir
   "TS"
   (list
    (make-dir "Text"
                 '()
                 (list
                  (make-file "part1" 99 "")
                  (make-file "part2" 52 "")
                  (make-file "part3" 17 "")))
    (make-dir "Libs"
                 (list
                  (make-dir "Code"
                               '()
                               (list
                                (make-file "hang" 8 "")
                                (make-file "draw" 2 "")))
                  (make-dir "Docs"
                               (list
                                (make-dir "Extra"
                                             '()
                                             (list
                                              (make-file "hey" 3 "")
                                              (make-file "there" 4 ""))))
                               (list
                                (make-file "write!" 19 ""))))
                 '()))
   (list
    (make-file "read!" 10 ""))))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Dir String -> Boolean
; Does d contain any file named fnam
(define (find? d fnam) #false)

