;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname collapse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 14, 2023

(collapse): converts a list of lines into a string.
  Words are separated by blank spaces. Lines are separated
  by \n.

Use:

(write-file "ttt.dat"
            (collapse (read-words/line "ttt.txt")))
|#