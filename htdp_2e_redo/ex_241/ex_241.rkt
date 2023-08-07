;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_241) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 7, 2023

Exercise 241. Compare the definitions for NEList-of-temperatures and
NEList-of-Booleans. Then formulate an abstract data definition NEList-of.
|#

; An NEList-of-temperatures is one of:
; -- (cons CTemperature '())
; -- (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures

; A CTemperature is a Number greater than -272.

; An NEList-of-Booleans is one of:
; -- (cons Boolean '())
; -- (cons Boolean NEList-of-Booleans)
; interpretation non-empty lists of Booleans

; Abstraction

; An [NEList-of ITEM] is one of:
; (cons ITEM '())
; (cons ITEM [NEList-of ITEM])
; Interp.: non-empty list of ITEM