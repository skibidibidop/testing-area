;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_171) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: Aug 3, 2023

Exercise 171. You know what the data definition for List-of-strings
looks like. Spell it out. Make sure that you can represent Piet Hein’s poem
as an instance of the definition where each line is represented as a string
and another instance where each word is a string. Use read-lines and
read-words to confirm your representation choices.

Next develop the data definition for List-of-list-of-strings. Again, repre-
sent Piet Hein’s poem as an instance of the definition where each line is
represented as a list of strings, one per word, and the entire poem is a list
of such line representations. You may use read-words/line to confirm
your choice.
|#
