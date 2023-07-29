#|
Author: Mark Beltran
Date: July 29, 2023

Exercise 132. Use DrRacket to run contains-flatt? in this example:
|#

(cons "Fagan"
      (cons "Findler"
            (cons "Fisler"
                  (cons "Flanagan"
                        (cons "Flatt"
                              (cons "Felleisen"
                                    (cons "Friedman" '())))))))

; What answer do you expect?
;(list "Fagan" "Findler" ... etc.)
