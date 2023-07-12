;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_241) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 12, 2023

Exercise 241
|#

; DATA DEFINITIONS /////////////////////////////////////////////////////////////

; A NEList_of_temperatures is one of:
; - (cons CTemperature '())
; - (cons CTemperature NEList_of_temperatures)
; Interp.: Non-empty list of Celsius temperatures

; A NEList_of_booleans is one of:
; - (cons Boolean '())
; - (cons Boolean NEList_of_booleans)
; Interp.: Non-empty list of Booleans

; A [NEList_of X] is one of:
; - (cons X '())
; - (cons X [NEList_of X])
; Interp.: Non-empty list of X