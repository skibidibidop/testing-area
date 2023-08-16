;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ca_19_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Code-along:
19.3 S-expressions

Sample Problem:
Design the function count, which determines
how many times some symbol occurs in some S-expression.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

; An S-expr is one of:
; -- Atom
; -- SL

; An Atom is one of:
; -- Number
; -- String
; -- Symbol

; An SL is one of:
; -- '()
; -- (cons S-expr SL)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Any -> Boolean
; Is a an Atom
(check-expect (atom? "hi!") #true)
(check-expect (atom? 1000) #true)
(check-expect (atom? 'z) #true)
(check-expect (atom? (make-posn 1 2)) #false)

(define (atom? a)
  (or (string? a)
      (number? a)
      (symbol? a)))

; S-expr Symbol -> N
; Counts all occurrences of sy in sexp
(check-expect (count 'world 'hello) 0)
(check-expect (count '(world hello) 'hello) 1)
(check-expect (count '(((world) hello) hello) 'hello) 2)

(define (count sexp sy)
  (cond
    [(atom? sexp) (count-atom sexp sy)]
    [else (count-sl sexp sy)]))

(define (count-sl sl sy)
  (cond
    [(empty? sl) 0]
    [else
     (+ (count (first sl) sy)
        (count-sl (rest sl) sy))]))

(define (count-atom at sy)
  (cond
    [(number? at) 0]
    [(string? at) 0]
    [(symbol? at)
     (if (symbol=? at sy) 1 0)]))
