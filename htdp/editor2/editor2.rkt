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

; An Lo1s (short for List_of_1Strings) is one of:
; - '()
; - (cons 1String Lo1s)

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

; Editor KeyEvent -> Editor
; Deals with a KeyEvent, given some Editor
(check-expect (khandler (create_editor "" "") "e")
              (create_editor "e" ""))
(check-expect (khandler (create_editor "cd" "fgh") "e")
              (create_editor "cde" "fgh"))
(check-expect (khandler (create_editor "" "") "\b")
              (create_editor "" ""))
(check-expect (khandler (create_editor "a" "b") "\b")
              (create_editor "" "b"))
(check-expect (khandler (create_editor "" "b") "b")
              (create_editor "" "b"))
(check-expect (khandler (create_editor "" "") "left")
              (create_editor "" ""))
(check-expect (khandler (create_editor "" " ") "left")
              (create_editor "" " "))
(check-expect (khandler (create_editor "abc" " ") "left")
              (create_editor "ab" "c "))
(check-expect (khandler (create_editor "" "") "right")
              (create_editor "" ""))
(check-expect (khandler (create_editor " " "") "right")
              (create_editor " " ""))
(check-expect (khandler (create_editor "efg" "hjk") "right")
              (create_editor "efgh" "jk"))
(check-expect (khandler (create_editor "" "") " ")
              (create_editor " " ""))
(check-expect (khandler (create_editor "zx" "yv") " ")
              (create_editor "zx " "yv"))

(define (khandler ed ke)
  (cond
    [(key=? ke "left") (editor_left ed)]
    [(key=? ke "right")(editor_right ed)]
    [(key=? ke "\b") (editor_del ed)]
    [(key=? ke "\t") ed]
    [(key=? ke "\r") ed]
    [(= (string-length k) 1) (editor_ins ed ke)]
    [else ed]))

; MAIN /////////////////////////////////////////////////////////////////////////

; String -> Editor
; Launches the editor given some initial string
(define (main str)
  (big-bang (create_editor str "")
    [to-draw render]
    [on-key khandler]))
