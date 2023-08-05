#|
Author: Mark Beltran
Date: August 5, 2023

Exercise 231. Eliminate quote in favor of list from these expressions:

• '(1 "a" 2 #false 3 "c")
• '()
• and this table-like shape:
'(("alan" 1000)
  ("barb" 2000)
  ("carl" 1500))

Now eliminate list in favor of cons where needed
|#


(check-expect '(1 "a" 2 #false 3 "c")
              (list 1 "a" 2 #false 3 "c"))

(check-expect '() (list))

(check-expect '(("alan" 1000)
                ("barb" 2000)
                ("carl" 1500))
              (list (list "alan" 1000)
                    (list "barb" 2000)
                    (list "carl" 1500)))

(check-expect '(1 "a" 2 #false 3 "c")
              (cons 1
                    (cons "a"
                          (cons 2
                                (cons #false
                                      (cons 3
                                            (cons "c" '())))))))

(check-expect '(("alan" 1000)
                ("barb" 2000)
                ("carl" 1500))
              (cons
               (cons "alan"
                     (cons 1000 '()))
               (cons
                (cons "barb"
                      (cons 2000 '()))
                (cons
                 (cons "carl"
                       (cons 1500 '()))
                 '()))))
