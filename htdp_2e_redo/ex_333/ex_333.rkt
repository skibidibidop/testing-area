#|
Author: Mark Beltran
Date: August 23, 2023

Exercise 333. Design the function how-many, which determines how
many files a given Dir.v2 contains. Exercise 332 provides you with data
examples. Compare your result with that of exercise 331.

Modified directory tree from Figure 123. I changed read! (19) to write! (19)
to make it easier for me to debug.

- TS (DIR)
--- read! (10)
--- Text (DIR)
------ part1 (99)
------ part2 (52)
------ part3 (17)
--- Libs (DIR)
------ Code (DIR)
---------- hang (8)
---------- draw (2)
------ Docs (DIR)
---------- write! (19)
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct dir [name content])
; A Dir.v2 is a structure:
; (make-dir String LOFD)

; An LOFD (short for list of files and directories) is one of:
; '()
; (cons File.v2 LOFD)
; (cons Dir.v2 LOFD)

; A File.v2 is a String.

; An N is a Natural Number

(define DIR_TREE
  (make-dir
   "TS"
   (list "read!"
         (make-dir
          "Text"
          (list "part1"
                "part2"
                "part3"))
         (make-dir
          "Libs"
          (list (make-dir
                 "Code"
                 (list "hang"
                       "draw"))
                (make-dir
                 "Docs"
                 (list "write!")))))))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Dir.v2 -> N
; Returns the number of File.v2 dir contains
(define (how-many dir) 0)
