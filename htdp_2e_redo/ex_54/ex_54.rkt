#|
Author: Mark Beltran
Date: July 20, 2023

Exercise 54. Why is (string=? "resting" x) incorrect as the first
condition in show? Conversely, formulate a completely accurate condition,
that is, a Boolean expression that evaluates to #true precisely when
x belongs to the first sub-class of LRCD.
|#

; (string?) has to be the first cond to check how to properly handle the
; current LRCD.
; An error will be thrown if (string=?) is given a number instead of a String.
; This is possible because LRCD can be a String or a Number.

; (and (string? lrcd) (string=? "resting"))
