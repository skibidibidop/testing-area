;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_330) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 22, 2023

Exercise 330. Translate the directory tree in figure 123 into a data
representation according to model 1.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Dir.v1 (short for directory) is one of:
; '()
; (cons File.v1 Dir.v1)
; (cons Dir.v1 Dir.v1)

; A File.v1 is a String

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
---------- read! (19)

|#