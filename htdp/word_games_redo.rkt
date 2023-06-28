#|
Author: Mark Beltran
Date: June 27, 2023

Redoing the Word Games project.
|#

(require 2htdp/batch-io)

; DATA DEFINITION //////////////////////////////////////////////////////////////

#|
For Linux:
(define DICT_LOC "/usr/share/dict/words")
|#

; For Windows:
(define DICT_LOC "D:\\DrRacket\\Racket\\projects\\dict\\words")

; A Dictionary is a String_list
(define AS_LIST (read-lines DICT_LOC))

; A String_list is one of:
; - '()
; - (cons String String_list)
; Interp.: a list of Strings

; A Word is one of:
; - '()
; - (cons 1String Word)
; Interp.: a list of 1Strings
(define w1 '())
(define w2 (list "a" "b" "c"))

; A Word_list is one of:
; - '()
; - (cons Word Word_list)
; - Interp.: a list of Words
(define wl1 '())
(define wl2 (list (list "a")
                  (list "b" "c")))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; String -> String_list
; Produces all anagrams of String s
(check-member-of (anagrams "cat")
                 (list "act" "cat")
                 (list "cat" "act"))
(check-satisfied (anagrams "rat")
                 all_words_from_rat?)

(define (anagrams s)
  (in_dict
   (words->strings (arrangements (string->word s)))))

; String_list -> Boolean
(define (all_words_from_rat? w)
  (and (member "rat" w)
       (member "tar" w)
       (member "art" w)))

; Word -> Word_list
; Produces all rearrangements of Word w
(check-expect (arrangements '()) (list '()))
(check-expect (arrangements (list "a"))
              (list (list "a")))
(check-expect (arrangements (list "b" "a"))
              (list (list "b" "a")
                    (list "a" "b")))
(check-expect (arrangements (list "c" "b" "a"))
              (list (list "c" "b" "a")
                    (list "b" "c" "a")
                    (list "b" "a" "c")
                    (list "c" "a" "b")
                    (list "a" "c" "b")
                    (list "a" "b" "c")))

(define (arrangements w)
  (cond
    [(empty? w) (list '())]
    [else
     (insert_everywhere/in_all_words
      (first w)
      (arrangements (rest w)))]))

; 1String Word_list -> Word_list
; Creates a list where ltr is inserted before, in between 1Strings,
; and after all Words in wlist
(check-expect (insert_everywhere/in_all_words "a" (list '()))
              (list (list "a")))
(check-expect (insert_everywhere/in_all_words "b" (list (list "a")))
              (list (list "b" "a")
                    (list "a" "b")))
(check-expect (insert_everywhere/in_all_words "c" (list (list "b" "a")
                                                        (list "a" "b")))
              (list (list "c" "b" "a")
                    (list "b" "c" "a")
                    (list "b" "a" "c")
                    (list "c" "a" "b")
                    (list "a" "c" "b")
                    (list "a" "b" "c")))

(define (insert_everywhere/in_all_words ltr wlist)
  (cond
    [(and (empty? (first wlist)) (empty? (rest wlist))) '()]
    [else
     (append (insert_everywhere/in_a_word ltr (first wlist))
             (insert_everywhere/in_all_words ltr (rest wlist)))]))

; 1String Word -> Word_list
; Creates a list where ltr is inserted before, in between 1Strings,
; and after Word w
(check-expect (insert_everywhere/in_a_word "a" '()) (list "a"))
(check-expect (insert_everywhere/in_a_word "b" (list "a"))
              (list (list "b" "a")
                    (list "a" "b")))
(check-expect (insert_everywhere/in_a_word "c" (list "b" "a"))
              (list (list "c" "b" "a")
                    (list "b" "c" "a")
                    (list "b" "a" "c")))

(define (insert_everywhere/in_a_word ltr w)
  (cond
    [(empty? w) '()]
    [else
      (combine (get_left ltr w) (get_right w))]))

; Word -> Word_list
; Generates right side of each arrangement
(check-expect (get_right '()) (list '()))
(check-expect (get_right (list "a"))
              (list (list "a")
                    (list '())))
(check-expect (get_right (list "b" "a"))
              (list (list "b" "a")
                    (list "a")
                    (list '())))

(define (get_right w)
  (cond
    [(empty? w) (list '())]
    [else
     (cons w
           (get_right (rest w)))]))

; 1String Word -> Word_list
; Generates left side of each arrangement
(define (get_left ltr w)
  (cond
    [(empty? w) '()]
    [else
     (reverse (add_ltr ltr (list_left w)))]))

; Word -> Word_list
; Generates a list from a Word, each member without the last letter
; from the previous member
(check-expect (list_left (explode "bcd"))
              (list (explode "bcd")
                    (explode "bc")
                    (list "b")
                    (list '())))

(define (list_left w)
  (cond
    [(empty? w) (list '())]
    [else
     (cons w
           (list_left (reverse (rest (reverse w)))))]))

; 1String Word_list -> Word_list
; Adds ltr to the end of each member of wlist
(check-expect (add_ltr "a" (list (explode "bcd")
                                 (explode "bc")
                                 (list "b")))
              (list (explode "bcda")
                    (explode "bca")
                    (explode "ba")
                    (list "a")))

(define (add_ltr ltr wlist)
  (cond
    [(and (empty? (first wlist)) (empty? (rest wlist))) (list ltr)]
    [else
     (cons
      (append (first wlist) (list ltr))
      (add_ltr ltr (rest wlist)))]))

; Word_list Word_list -> Word_list
; Combines generated left and right sides of each arrangement
(define (combine left right)
  (cond
    [(or (empty? left) (empty? right)) '()]
    [else
     (cons
      (append (first left) (first right))
      (combine (rest left) (rest right)))]))

; String -> Word
; Converts String s to Word
(check-expect (string->word "") '())
(check-expect (string->word "hi!") (list "h" "i" "!"))

(define (string->word s)
  (explode s))

; Word -> String
; Converts Word w to String
(check-expect (word->string '()) "")
(check-expect (word->string (list "h" "e" "y"))
              "hey")

(define (word->string w)
  (implode w))

; Word_list -> String_list
; Converts all Words in Word_list wl to Strings
(check-expect (words->strings '()) '())
(check-expect (words->strings (list (explode "hi!")
                                    (explode "hello")))
              (list "hi!" "hello"))

(define (words->strings wl)
  (cond
    [(empty? wl) '()]
    [else
     (cons (word->string (first wl))
           (words->strings (rest wl)))]))

; String_list -> String_list
; Picks out all Strings in String_list sl that occur in the dictionary
(check-expect (in_dict '()) '())
(check-expect (in_dict (list "zdx" "Benetton" "asdf"))
              (list "Benetton"))

(define (in_dict sl)
  (cond
    [(empty? sl) '()]
    [else
     (if (member? (first sl) AS_LIST)
         (cons (first sl) (in_dict (rest sl)))
         (in_dict (rest sl)))]))
