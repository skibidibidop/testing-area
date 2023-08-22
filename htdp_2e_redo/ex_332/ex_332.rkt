#|
Author: Mark Beltran
Date: August 23, 2023

Exercise 332. Translate the directory tree in figure 123 into a data
representation according to model 2.

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

; //////////////////////////////////////////////////////////////////////////////

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
