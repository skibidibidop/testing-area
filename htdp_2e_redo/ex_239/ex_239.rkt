;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_239) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 7, 2023

Exercise 239. A list of two items is another frequently used form of data
in ISL programming. Here is a data definition with two parameters:

; A [List X Y] is a structure:
; (cons X (cons Y '()))

Instantiate this definition to describe the following classes of data:

• pairs of Numbers,
• pairs of Numbers and 1Strings, and
• pairs of Strings and Booleans.

Also make one concrete example for each of these three data definitions.
|#

