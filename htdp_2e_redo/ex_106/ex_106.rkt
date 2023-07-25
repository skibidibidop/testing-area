#|
Author: Mark Beltran
Date: July 26, 2023

Exercise 106. In chapter 5.11 we discussed the creation of virtual pets
that come with happiness gauges. One of the virtual pets is a cat; the other
one, a chameleon. Each program is dedicated to a single pet, however.
Design the cat-cham world program. Given both a location and an animal,
it walks the latter across the canvas, starting from the given location.

Here is the chosen data representation for animals:

; A VAnimal is either
; -- a VCat
; -- a VCham

where VCat and VCham are your data definitions from exercises 88 and 92.

Given that VAnimal is the collection of world states, you need to design

• a rendering function from VAnimal to Image;
• a function for handling clock ticks, from VAnimal to VAnimal; and
• a function for dealing with key events so that you can feed and pet
and colorize your animal—as applicable.

It remains impossible to change the color of a cat or to pet a chameleon.
|#
