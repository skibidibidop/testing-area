#|
Author: Mark Beltran
Date: August 22, 2023

Exercise 331. Design the function how-many, which determines how
many files a given Dir.v1 contains. Remember to follow the design recipe;
exercise 330 provides you with data examples.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Dir.v1 is one of:
; '()
; (cons File.v1 Dir.v1)
; (cons Dir.v1 Dir.v1)

; A File.v1 is a String.

; An N is a Natural Number

; An Atom is one of:
; Number
; String
; Symbol

#|
Directory tree from Figure 123

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

(define Docs (list "write!"))
(define Code (list "hang" "draw"))
(define Libs (list Code Docs))
(define Text (list "part1" "part2" "part3"))
(define TS1   (list "read!" Text Libs))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Dir.v1 -> N
; Returns the number of files in a given Dir.v1
(check-expect (how-many '()) 0)
(check-expect (how-many TS1) 7)

(define (how-many dir)
  (cond
    [(empty? dir) 0]
    [(string? (first dir))
     (+ 1 (how-many (rest dir)))]
    [(list? dir)
     (+ (how-many (first dir))
        (how-many (rest dir)))]))
