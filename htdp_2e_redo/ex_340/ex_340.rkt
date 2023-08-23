#|
Author: Mark Beltran
Date: August 24, 023

Exercise 340. Design the function ls, which lists the names of all files
and directories in a given Dir.
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

(define EMPTY_DIR_TREE (make-dir "Empty" '() '()))
(define NO_DIRS
  (make-dir
   "No Dirs"
   '()
   (list
    (make-file "f1" 5 "")
    (make-file "f2" 32 ""))))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

