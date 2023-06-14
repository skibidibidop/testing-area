#|
Author: Mark Beltran
Date: June 15, 2023

Removes all articles ("a", "an", "the") from a text file.

Input: <file name>.txt
Output: no_articles_<file name>.txt
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; a string_list is one of:
; - '()
; - (cons String string_list)
; Interp.: a list of strings which represents a line in the file
(define sl1 '())
(define sl2 (cons "sla" '()))
(define sl3 (cons "sla"
                  (cons "slb" '())))

; FUNCTION DEFINITIONS /////////////////////////////////////////////////////////
