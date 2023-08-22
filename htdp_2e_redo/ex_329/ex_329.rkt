;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_329) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 22, 2023

Exercise 329. How many times does a file name read! occur in the
directory tree TS? Can you describe the path from the root directory to the
occurrences? What is the total size of all the files in the tree? What is the
total size of the directory if each directory node has size 1? How many
levels of directories does it contain?
|#

; How many times does a file name read! occur in the directory tree TS?
; It occurs twice, in different subdirectories.

; Can you describe the path from the root directory to the occurrences?
; The first file with the name read! occurs in the first directory (TS)
; but the other file occurs in a subdirectory of a subdirectory of TS

; What is the total size of all the files in the tree?
; 207

; What is the total size of the directory if each directory node has size 1?
; 5

; How many levels of directories does it contain?
; 3