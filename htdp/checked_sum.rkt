;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname checked_sum) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: June 6, 2023

Design function pos? to check if all numbers in a list are positive.
Design checked_sum which signals an error if a number in a provided list is not
positive. If all numbers in the list are positive, it provides the sum.
|#