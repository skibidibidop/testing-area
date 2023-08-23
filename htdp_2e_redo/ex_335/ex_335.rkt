#|
Author: Mark Beltran
Date: August 23, 2023

Exercise 335. Translate the directory tree in figure 123 into a data
representation according to model 3. Use "" for the content of files.

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

(define-struct file [name size content])
; A File.v3 is a structure:
; (make-file String N String)

(define-struct dir.v3 [name dirs files])
; A Dir.v3 is a structrue:
; (make-dir.v3 String Dir* File*)

; A Dir* is one of:
; '()
; (cons Dir.v3 Dir*)

; A File* is one of:
; '()
; (cons File.v3 File*)

; //////////////////////////////////////////////////////////////////////////////

(define DIR_TREE
  (make-dir.v3 "TS"
               (list
                (make-dir.v3 "Text"
                             '()
                             (list
                              (make-file "part1" 99 "")
                              (make-file "part2" 52 "")
                              (make-file "part3" 17 "")))
                (make-dir.v3 "Libs"
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
