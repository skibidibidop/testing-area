;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_103) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 25, 2023

Exercise 103. Develop a data representation for the following four kinds
of zoo animals:

• spiders, whose relevant attributes are the number of remaining legs
(we assume that spiders can lose legs in accidents) and the space they
need in case of transport;
• elephants, whose only attributes are the space they need in case of
transport;
• boa constrictors, whose attributes include length and girth; and
• armadillos, for which you must determine appropriate attributes, in-
cluding one that determines the space needed for transport.

Develop a template for functions that consume zoo animals.

Design the fits? function, which consumes a zoo animal and a de-
scription of a cage. It determines whether the cage’s volume is large enough
for the animal.
|#