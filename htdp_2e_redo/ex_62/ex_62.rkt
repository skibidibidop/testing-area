;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_62) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 20, 2023

Sample Problem
Design a world program that simulates the
working of a door with an automatic door closer. If this kind
of door is locked, you can unlock it with a key. An unlocked
door is closed, but someone pushing at the door opens it. Once
the person has passed through the door and lets go, the auto-
matic door takes over and closes the door again. When a door
is closed, it can be locked again.

Exercise 62
During a door simulation the “open” state is barely vis-
ible. Modify door-simulation so that the clock ticks once every three
seconds. Rerun the simulation.
|#