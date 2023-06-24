#|
Author: Mark Beltran
Date: June 23, 2023

Project: Word Games

Notes:
Enumerate all anagrams from a provided word.
Remove duplicate strings in list of anagrams.

|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A String_list is one of:
; - '()
; - (cons String String_list)
; Interp.: a list of strings
(define sl1 '())
(define sl2 (cons "hi" (cons "hello" '())))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

