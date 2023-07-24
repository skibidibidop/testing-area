;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_92) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 24, 2023

Exercise 92. Design the cham program, which has the chameleon con-
tinuously walking across the canvas from left to right. When it reaches the
right end of the canvas, it disappears and immediately reappears on the
left. Like the cat, the chameleon gets hungry from all the walking, and, as
time passes by, this hunger expresses itself as unhappiness.

For managing the chameleon’s happiness gauge, you may reuse the
happiness gauge from the virtual cat. To make the chameleon happy, you
feed it (down arrow, two points only); petting isn’t allowed. Of course, like
all chameleons, ours can change color, too: "r" turns it red, "b" blue, and
"g" green. Add the chameleon world program to the virtual cat game and
reuse functions from the latter when possible.

Start with a data definition, VCham, for representing chameleons.
|#

