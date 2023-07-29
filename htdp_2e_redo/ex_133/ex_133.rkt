#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 133. Here is another way of formulating the second cond
clause in contains-flatt?:

... (cond
      [(string=? (first alon) "Flatt") #true]
      [else (contains-flatt? (rest alon))]) ...

Explain why this expression produces the same answers as the or expression
in the version of figure 47. Which version is better? Explain.
|#

; I think that the use of or is better in this case. No need to write #true
; and its easier to read.

