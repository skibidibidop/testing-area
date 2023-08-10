;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_271) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 10, 2023

Exercise 271. Use ormap to define find-name. The function consumes
a name and a list of names. It determines whether any of the names on the
latter are equal to or an extension of the former.

With andmap you can define a function that checks all names on a list
of names that start with the letter "a".

Should you use ormap or andmap to define a function that ensures that
no name on some list exceeds a given width?
|#