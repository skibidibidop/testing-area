;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_107) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 26, 2023

Exercise 107. Design the cham-and-cat program, which deals with
both a virtual cat and a virtual chameleon. You need a data definition for a
“zoo” containing both animals and functions for dealing with it.
The problem statement leaves open how keys manipulate the two ani-
mals. Here are two possible interpretations:

1. Each key event goes to both animals.
2. Each key event applies to only one of the two animals.

For this alternative, you need a data representation that specifies a
focus animal, that is, the animal that can currently be manipulated. To
switch focus, have the key-handling function interpret "k" for “kitty”
and "l" for lizard. Once a player hits "k", the following keystrokes
apply to the cat only—until the player hits "l".

Choose one of the alternatives and design the appropriate program.
|#

