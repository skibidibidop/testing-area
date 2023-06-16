#|
Author: Mark Beltran
Date: June 16, 2023

Code-along: 10.4 Graphical Editor, Revisited
|#

(require 2htdp/image)
(require 2htdp/universe)

; CONSTANTS ////////////////////////////////////////////////////////////////////

(define SCALER 10)

(define EWIDTH (* SCALER 30))
(define EHEIGHT (* SCALER 5))
(define FONT_SIZE (* SCALER 3))
(define FONT_COLOR "black")

(define BG (empty-scene EWIDTH EHEIGHT))
(define CURSOR (rectangle 1 EHEIGHT "solid" "red"))

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct editor [pre post])
; Editor: (make-editor Lo1s Lo1s)
(define good
  (cons "g" (cons "o" (cons "o" (cons "d" '())))))
(define all
  (cons "a" (cons "l" (cons "l" '()))))
(define lla
  (cons "l" (cons "l" (cons "a" '()))))

(make-editor all good)
(make-editor lla good)

; An Lo1s (short for List_of_1Strings) is one of:
; - '()
; - (cons 1String Lo1s)
; Interp.: a list of 1Strings
(define lo1s1 (cons "a" (cons "b" '())))

; A KeyEvent is one of:
; - 1Strings
; - "\b"
; - "'t"
; - "left"
; - "right"
; Interp.: valid keystrokes while an editor is active
(define ke1 "a")

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Lo1s -> Lo1s
; Produces a reverse version of the given list
(check-expect
 (rev (cons "a" (cons "b" (cons "c" '()))))
 (cons "c" (cons "b" (cons "a" '()))))

(define (rev l)
  (cond[(empty? l) '()]
       [else
        (list_append
         (rev (rest l)) (first l))]))

; Lo1s 1String -> Lo1s
; Adds 1String to end of Lo1s
(check-expect (list_append (cons "a" (cons "b" '())) "c")
              (cons "a" (cons "b" (cons "c" '()))))

(define (list_append ls char)
  (cond[(empty? ls) (cons char '())]
       [else
        (cons (first ls) (list_append (rest ls) char))]))

; String String -> Editor
; Produces an Editor out of 2 Strings
(define hello
  (cons "h" (cons "e" (cons "l" (cons "l" (cons "o" '()))))))
(define there
  (cons "t" (cons "h" (cons "e" (cons "r" (cons "e" '()))))))

(check-expect (create_editor "hello" "there")
              (make-editor hello there))

(define (create_editor pre post)
  (make-editor (explode pre)
               (explode post)))

; Editor -> Image
; Renders image of text separated by a cursor
(define (render in_editor) BG)

(define ed_no_chars (create-editor "" ""))
(define ed_left_char (create-editor "a" ""))
(define ed_left_str (create-editor "abc" ""))
(define ed_right_char (create-editor "" "x"))
(define ed_right_str (create-editor "" "xyz"))
(define ed_both_char (create-editor "a" "b"))
(define ed_both_str (create-editor "abc" "xyz"))
(define ed_char_str (create-editor "a" "bcd"))
(define ed_str_char (create-editor "wxy" "z"))

; Editor KeyEvent -> Editor
; Deals with a KeyEvent, given some Editor


(define (khandler ed ke)
  (cond
    [(key=? ke "left") (editor_left ed)]
    [(key=? ke "right")(editor_right ed)]
    [(key=? ke "\b") (editor_del ed)]
    [(key=? ke "\t") ed]
    [(key=? ke "\r") ed]
    [(= (string-length k) 1) (editor_ins ed ke)]
    [else ed]))

; Editor -> Editor
; Moves the last character of editor-pre to the beginning of editor-post
(check-expect (editor_left 

(define (editor_left ed) ed)

; Editor -> Editor
; Moves the first character of editor-post to the end of editor-pre
(define (editor_right ed) ed)

; Editor -> Editor
; Deletes the last character of editor-pre
(define (editor_del ed) ed)

; Editor KeyEvent -> Editor
; Appends ke to editor-pre if it is a 1String
(define (editor_ins ed ke) ed)

; MAIN /////////////////////////////////////////////////////////////////////////

; String -> Editor
; Launches the editor given some initial string
(define (main str)
  (big-bang (create_editor str "")
    [to-draw render]
    [on-key khandler]))
