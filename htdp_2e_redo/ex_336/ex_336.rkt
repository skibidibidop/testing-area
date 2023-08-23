;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex_336) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: August 23, 2023

Exercise 336. Design the function how-many, which determines how
many files a given Dir.v3 contains. Exercise 335 provides you with data
examples. Compare your result with that of exercise 333.

Given the complexity of the data definition, contemplate how anyone
can design correct functions. Why are you confident that how-many produces
correct results?
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct file [name size content])
; A File.v3 is a structure:
; (make-file String N String)

(define-struct dir.v3 [name dirs files])
; A Dir.v3 is a structrue:
; (make-dir.v3 String Dir* File*)

; A Dir* is one of:
; '()
; (cons Dir.v3 Dir*)

; A File* is one of:
; '()
; (cons File.v3 File*)

(define DIR_TREE
  (make-dir.v3 "TS"
               (list
                (make-dir.v3 "Text"
                             '()
                             (list
                              (make-file "part1" 99 "")
                              (make-file "part2" 52 "")
                              (make-file "part3" 17 "")))
                (make-dir.v3 "Libs"
                             (list
                              (make-dir.v3 "Code"
                                           '()
                                           (list
                                            (make-file "hang" 8 "")
                                            (make-file "draw" 2 "")))
                              (make-dir.v3 "Docs"
                                           '()
                                           (list
                                            (make-file "write!" 19 ""))))
                             '()))
               (list
                (make-file "read!" 10 ""))))

(define DIR_TREE2
  (make-dir.v3
   "TS"
   (list
    (make-dir.v3 "Text"
                 '()
                 (list
                  (make-file "part1" 99 "")
                  (make-file "part2" 52 "")
                  (make-file "part3" 17 "")))
    (make-dir.v3 "Libs"
                 (list
                  (make-dir.v3 "Code"
                               '()
                               (list
                                (make-file "hang" 8 "")
                                (make-file "draw" 2 "")))
                  (make-dir.v3 "Docs"
                               (list
                                (make-dir.v3 "Extra"
                                             '()
                                             (list
                                              (make-file "hey" 3 "")
                                              (make-file "there" 4 ""))))
                               (list
                                (make-file "write!" 19 ""))))
                 '()))
   (list
    (make-file "read!" 10 ""))))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Dir.v3 -> N
; Returns the number of Files.v3 in dir
(check-expect (how-many (make-dir.v3 "Empty" '() '())) 0)
(check-expect (how-many (make-dir.v3 "Empty dirs"
                                     '()
                                     (list
                                      (make-file "A" 10 "")
                                      (make-file "B" 12 "")))) 2)
(check-expect (how-many (make-dir.v3 "Empty files"
                                     (list
                                      (make-dir.v3 "Dir1"
                                                   '()
                                                   '()))
                                     '())) 0)
(check-expect (how-many DIR_TREE) 7)
(check-expect (how-many DIR_TREE2) 9)

(define (how-many dir)
  (local
    [; Dir.v3 -> N
     (define (count_files d)
       (length (dir.v3-files d)))

     ; Dir* -> N
     (define (traverse dirs)
       (cond
         [(empty? dirs) 0]
         [else
          (+ (count_files (first dirs))
             (traverse (dir.v3-dirs (first dirs)))
             (traverse (rest dirs)))]))]

    (+ (count_files dir)
       (traverse (dir.v3-dirs dir)))))
