;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_87) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 22, 2023

Exercise 87. Develop a data representation for an editor based on our
first idea, using a string and an index. Then solve the preceding exercises
again. Retrace the design recipe. Hint if you haven’t done so, solve the
exercises in chapter 2.1.

Note on Design Choices
The exercise is a first study of making design
choices. It shows that the very first design choice concerns the data repre-
sentation. Making the right choice requires planning ahead and weighing
the complexity of each. Of course, getting good at this is a question of
gaining experience.
|#