#|
Author: Mark Beltran
Date: August 5, 2023

Exercise 233. Develop alternatives to the following expressions that use
only list and produce the same values:

• `(0 ,@'(1 2 3) 4)
• this table-like shape:
`(("alan" ,(* 2 500))
  ("barb" 2000)
  (,@'("carl" " , the great") 1500)
  ("dawn" 2300))
• and this third web page:
`(html
  (body
   (table ((border "1"))
          (tr ((width "200"))
              ,@(make-row '( 1 2)))
          (tr ((width "200"))
              ,@(make-row '(99 65))))))

where make-row is the function from above.
Use check-expect to check your work.
|#

(check-expect `(0 ,@'(1 2 3) 4)
              (list 0 1 2 3 4))

(check-expect `(("alan" ,(* 2 500))
                ("barb" 2000)
                (,@'("carl" " , the great") 1500)
                ("dawn" 2300))
              (list (list "alan" 1000)
                    (list "barb" 2000)
                    (list "carl" " , the great" 1500)
                    (list "dawn" 2300)))

; List-of-numbers -> ¨ ¨ ¨ nested list ¨ ¨ ¨
; creates a row for an HTML table from l
(define (make-row l)
  (cond
    [(empty? l) '()]
    [else (cons (make-cell (first l))
                (make-row (rest l)))]))

; Number -> ¨ ¨ ¨ nested list ¨ ¨ ¨
; creates a cell for an HTML table from a number
(define (make-cell n)
  `(td ,(number->string n)))


(check-expect `(html
                (body
                 (table ((border "1"))
                        (tr ((width "200"))
                            ,@(make-row '( 1 2)))
                        (tr ((width "200"))
                            ,@(make-row '(99 65))))))
              (list 'html
                    (list 'body
                          (list 'table
                                (list (list 'border "1"))
                                (list 'tr (list (list 'width "200"))
                                      (list 'td "1")
                                      (list 'td "2"))
                                (list 'tr (list (list 'width "200"))
                                      (list 'td "99")
                                      (list 'td "65"))))))
