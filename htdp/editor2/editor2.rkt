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

(define ed_no_chars (create_editor "" ""))
(define ed_left_char (create_editor "a" ""))
(define ed_left_str (create_editor "abc" ""))
(define ed_right_char (create_editor "" "x"))
(define ed_right_str (create_editor "" "xyz"))
(define ed_both_char (create_editor "a" "b"))
(define ed_both_str (create_editor "abc" "xyz"))
(define ed_char_str (create_editor "a" "bcd"))
(define ed_str_char (create_editor "wxy" "z"))

; Editor KeyEvent -> Editor
; Deals with a KeyEvent, given some Editor
; (create_editor "" "")
(check-expect (khandler ed_no_chars "left")
              ed_no_chars)
(check-expect (khandler ed_no_chars "right")
              ed_no_chars)
(check-expect (khandler ed_no_chars "\b")
              ed_no_chars)
(check-expect (khandler ed_no_chars "\t")
              ed_no_chars)
(check-expect (khandler ed_no_chars "\r")
              ed_no_chars)
(check-expect (khandler ed_no_chars "a")
              (create_editor "a" ""))
; (create_editor "a" "")
(check-expect (khandler ed_left_char "left")
              (create_editor "" "a"))
(check-expect (khandler ed_left_char "right")
              ed_left_char)
(check-expect (khandler ed_left_char "\b")
              (create_editor "" ""))
(check-expect (khandler ed_left_char "\t")
              ed_left_char)
(check-expect (khandler ed_left_char "\r")
              ed_left_char)
(check-expect (khandler ed_left_char "a")
              (create_editor "aa" ""))
; (create_editor "abc" "")
(check-expect (khandler ed_left_str "left")
              (create_editor "ab" "c"))
(check-expect (khandler ed_left_str "right")
              ed_left_str)
(check-expect (khandler ed_left_str "\b")
              (create_editor "ab" ""))
(check-expect (khandler ed_left_str "\t")
              ed_left_str)
(check-expect (khandler ed_left_str "\r")
              ed_left_str)
(check-expect (khandler ed_left_str "a")
              (create_editor "abca" ""))
; (create_editor "" "x")
(check-expect (khandler ed_right_char "left")
              ed_right_char)
(check-expect (khandler ed_right_char "right")
              (create_editor "x" ""))
(check-expect (khandler ed_right_char "\b")
              ed_right_char)
(check-expect (khandler ed_right_char "\t")
              ed_right_char)
(check-expect (khandler ed_right_char "\r")
              ed_right_char)
(check-expect (khandler ed_right_char "a")
              (create_editor "a" "x"))
; (create_editor "" "xyz")
(check-expect (khandler ed_right_str "left")
              ed_right_str)
(check-expect (khandler ed_right_str "right")
              (create_editor "x" "yz"))
(check-expect (khandler ed_right_str "\b")
              ed_right_str)
(check-expect (khandler ed_right_str "\t")
              ed_right_str)
(check-expect (khandler ed_right_str "\r")
              ed_right_str)
(check-expect (khandler ed_right_str "a")
              (create_editor "a" "xyz"))
; (create_editor "a" "b")
(check-expect (khandler ed_both_char "left")
              (create_editor "" "ab"))
(check-expect (khandler ed_both_char "right")
              (create_editor "ab" ""))
(check-expect (khandler ed_both_char "\b")
              (create_editor "" "b"))
(check-expect (khandler ed_both_char "\t")
              ed_both_char)
(check-expect (khandler ed_both_char "\r")
              ed_both_char)
(check-expect (khandler ed_both_char "a")
              (create_editor "aa" "b"))
; (create_editor "abc" "xyz")
(check-expect (khandler ed_both_str "left")
              (create_editor "ab" "cxyz"))
(check-expect (khandler ed_both_str "right")
              (create_editor "abcx" "yz"))
(check-expect (khandler ed_both_str "\b")
              (create_editor "ab" "xyz"))
(check-expect (khandler ed_both_str "\t")
              ed_both_str)
(check-expect (khandler ed_both_str "\r")
              ed_both_str)
(check-expect (khandler ed_both_str "a")
              (create_editor "abca" "xyz"))
; (create_editor "a" "bcd")
(check-expect (khandler ed_char_str "left")
              (create_editor "" "abcd"))
(check-expect (khandler ed_char_str "right")
              (create_editor "ab" "cd"))
(check-expect (khandler ed_char_str "\b")
              (create_editor "" "bcd"))
(check-expect (khandler ed_char_str "\t")
              ed_char_str)
(check-expect (khandler ed_char_str "\r")
              ed_char_str)
(check-expect (khandler ed_char_str "a")
              (create_editor "aa" "bcd"))
; (create_editor "wxy" "z")
(check-expect (khandler ed_str_char "left")
              (create_editor "wx" "yz"))
(check-expect (khandler ed_str_char "right")
              (create_editor "wxyz" ""))
(check-expect (khandler ed_str_char "\b")
              (create_editor "wx" "z"))
(check-expect (khandler ed_str_char "\t")
              ed_str_char)
(check-expect (khandler ed_str_char "\r")
              ed_str_char)
(check-expect (khandler ed_str_char "a")
              (create_editor "wxya" "z"))

(define (khandler ed ke)
  (cond
    [(key=? ke "left") (editor_left ed)]
    [(key=? ke "right")(editor_right ed)]
    [(key=? ke "\b") (editor_del ed)]
    [(key=? ke "\t") ed]
    [(key=? ke "\r") ed]
    [(= (string-length ke) 1) (editor_ins ed ke)]
    [else ed]))

; Editor -> Editor
; Moves the last character of editor-pre to the beginning of editor-post
(check-expect (editor_left (create_editor "" ""))
              (create_editor "" ""))
(check-expect (editor_left (create_editor "abc" "xyz"))
              (create_editor "ab" "cxyz"))

(define (editor_left ed)
  (make-editor
   (cond[(empty?
          (first (rev (editor-pre ed)))) '()]
        [else
         (cons (...))])))

; Lo1s -> Lo1s
; Removes the first member of a Lo1s
(check-expect (rmv_first '()) '())
(check-expect (rmv_first (cons "a" (cons "b" '())))
              (cons "b" '()))

(define (rmv_first char_list) char_list)

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
