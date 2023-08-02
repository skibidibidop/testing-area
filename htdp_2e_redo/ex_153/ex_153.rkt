;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_153) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: Aug 2, 2023

Exercise 153. The goal of this exercise is to visualize the result of a
1968-style European student riot. Here is the rough idea. A small group
of students meets to make paint-filled balloons, enters some lecture hall,
and randomly throws the balloons at the attendees. Your program displays
how the balloons color the seats in the lecture hall.

Use the two functions from exercise 152 to create a rectangle of 8 by 18
squares, each of which has size 10 by 10. Place it in an empty-scene of
the same size. This image is your lecture hall.

Design add-balloons. The function consumes a list of Posn whose
coordinates fit into the dimensions of the lecture hall. It produces an image
of the lecture hall with red dots added as specified by the Posns.

Figure 60 shows the output of our solution when given some list of
Posns. The left-most is the clean lecture hall, the second one is after two
balloons have hit, and the last one is a highly unlikely distribution of 10
hits. Where is the 10th?
|#