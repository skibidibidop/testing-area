;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex_86) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Author: Mark Beltran
Date: July 22, 2023

Exercise 86. Notice that if you type a lot, your editor program does not
display all of the text. Instead the text is cut off at the right margin. Modify
your function edit from exercise 84 so that it ignores a keystroke if adding
it to the end of the pre field would mean the rendered text is too wide for
your canvas.
|#

(require 2htdp/universe)
(require 2htdp/image)

(define SCALER  1)
(define SWIDTH  (* SCALER 200))
(define SHEIGHT (* SCALER 20))

(define BG      (empty-scene SWIDTH SHEIGHT))
(define XCENTER (/ SWIDTH 2))
(define YCENTER (/ SHEIGHT 2))
  
(define CURSOR     (rectangle SCALER (* SCALER 20) "solid" "red"))
(define FONT_SIZE  (* SCALER 16))
(define FONT_COLOR "black")

(define FIRST_POS 0)
(define SECOND_POS 1)

(define CHAR_LIM 22)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct editor [pre post])
; An Editor is a structure:
; (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with
; the cursor displayed between s and t

; Develop the image for a sample string in DrRacket’s interactions area:
(overlay/align "left" "center"
               (text "hello world" 11 "black")
               (empty-scene 200 20))

; A Valid_key is one of:
; "a" to "z"
; "A" to "Z"
; "left"
; "right"
; "\b"
; special characters (!, ?, *, ,, (, ), etc.)

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Editor -> Image
; Produces an Image based on the data from the provided Editor
(check-expect (render (make-editor " " " "))
              (overlay/align "left" "center"
                             (beside
                              (text " " FONT_SIZE FONT_COLOR)
                              CURSOR
                              (text " " FONT_SIZE FONT_COLOR))
                             BG))

(define (render ed)
  (overlay/align "left" "center"
                 (beside
                  (text (editor-pre ed) FONT_SIZE FONT_COLOR)
                  CURSOR
                  (text (editor-post ed) FONT_SIZE FONT_COLOR))
                 BG))

; Editor Valid_key -> Editor
; Updates Editor ed based on Valid_key vk
(define empty_both  (make-editor "" ""))
(define spaces_only (make-editor " " " "))
(define single_pre  (make-editor "a" ""))
(define single_post (make-editor "" "b"))
(define multi_both  (make-editor "ghi" "!jk"))

(check-expect (edit empty_both "z")      (make-editor "z" ""))
(check-expect (edit empty_both "F")      (make-editor "F" ""))
(check-expect (edit empty_both "left")   empty_both)
(check-expect (edit empty_both "right")  empty_both)
(check-expect (edit empty_both "*")      (make-editor "*" ""))
(check-expect (edit empty_both "\b")     empty_both)
(check-expect (edit empty_both "\r")     empty_both)
(check-expect (edit spaces_only "u")     (make-editor " u" " "))
(check-expect (edit spaces_only "I")     (make-editor " I" " "))
(check-expect (edit spaces_only "left")  (make-editor "" "  "))
(check-expect (edit spaces_only "right") (make-editor "  " ""))
(check-expect (edit spaces_only "(")     (make-editor " (" " "))
(check-expect (edit spaces_only "\b")    (make-editor "" " "))
(check-expect (edit spaces_only "\t")    spaces_only)
(check-expect (edit single_pre "r")      (make-editor "ar" ""))
(check-expect (edit single_pre "S")      (make-editor "aS" ""))
(check-expect (edit single_pre "left")   (make-editor "" "a"))
(check-expect (edit single_pre "right")  (make-editor "a" ""))
(check-expect (edit single_pre "&")      (make-editor "a&" ""))
(check-expect (edit single_pre "\b")     (make-editor "" ""))
(check-expect (edit single_pre "\t")     single_pre)
(check-expect (edit single_post "l")     (make-editor "l" "b"))
(check-expect (edit single_post "left")  single_post)
(check-expect (edit single_post "right") (make-editor "b" ""))
(check-expect (edit single_post "#")     (make-editor "#" "b"))
(check-expect (edit single_post "\b")    single_post)
(check-expect (edit single_post "\r")    single_post)
(check-expect (edit multi_both "j")      (make-editor "ghij" "!jk"))
(check-expect (edit multi_both "C")      (make-editor "ghiC" "!jk"))
(check-expect (edit multi_both "left")   (make-editor "gh" "i!jk"))
(check-expect (edit multi_both "right")  (make-editor "ghi!" "jk"))
(check-expect (edit multi_both "@")      (make-editor "ghi@" "!jk"))
(check-expect (edit multi_both "\b")     (make-editor "gh" "!jk"))
(check-expect (edit multi_both "\t")     multi_both)

(define (edit ed vk)
  (cond
    [(key=? vk "\b")
     (make-editor
      (del_last (editor-pre ed)) (editor-post ed))]
    [(key=? vk "right")
     (make-editor
      (string-append (editor-pre ed) (get_first (editor-post ed)))
      (del_first (editor-post ed)))]
    [(key=? vk "left")
     (make-editor
      (del_last (editor-pre ed))
      (string-append (get_last (editor-pre ed)) (editor-post ed)))]
    [(and (= (string-length vk) 1)
          (not (key=? vk "\t"))
          (not (key=? vk "\r"))
          (< (string-length (string-append (editor-pre ed) (editor-post ed)))
             CHAR_LIM))
     (make-editor
      (string-append (editor-pre ed) vk) (editor-post ed))]
    [else ed]))

; String -> String
; Removes the last 1String of String str
(check-expect (del_last "") "")
(check-expect (del_last "a") "")
(check-expect (del_last "A!") "A")

(define (del_last str)
  (cond
    [(string=? str "") ""]
    [else
     (substring str FIRST_POS (- (string-length str) 1))]))

; String -> 1String
; Returns the first 1String of String str
(check-expect (get_first "") "")
(check-expect (get_first "b") "b")
(check-expect (get_first "B?") "B")
              
(define (get_first str)
  (cond
    [(string=? str "") ""]
    [else
     (string-ith str FIRST_POS)]))

; String -> String
; Removes the first 1String of String str
(check-expect (del_first "") "")
(check-expect (del_first "c") "")
(check-expect (del_first "C*") "*")

(define (del_first str)
  (cond
    [(string=? str "") ""]
    [else
     (substring str SECOND_POS)]))

; String -> 1String
; Returns the last 1String of String str
(check-expect (get_last "") "")
(check-expect (get_last "d") "d")
(check-expect (get_last "D&") "&")
              
(define (get_last str)
  (cond
    [(string=? str "") ""]
    [else
     (string-ith str (- (string-length str) 1))]))

; MAIN /////////////////////////////////////////////////////////////////////////

; Editor -> Editor
(define (run to_edit)
  (big-bang to_edit
    [to-draw render]
    [on-key edit]))

(run (make-editor "" ""))