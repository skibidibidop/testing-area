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
; Interp.: represents a text editor with the text before the cursor (pre) and
; after the cursor (post)
; (define good
;   (cons "g" (cons "o" (cons "o" (cons "d" '())))))
; (define all
;   (cons "a" (cons "l" (cons "l" '()))))
; (define lla
;   (cons "l" (cons "l" (cons "a" '()))))
;
; (make-editor all good)
; (make-editor lla good)

; An Lo1s (short for List_of_1Strings) is one of:
; - '()
; - (cons 1String Lo1s)
; Interp.: a list of 1Strings
; (define lo1s1 (cons "a" (cons "b" '())))

; A KeyEvent is one of:
; - 1Strings
; - "\b"
; - "'t"
; - "left"
; - "right"
; Interp.: valid keystrokes while an editor is active
; (define ke1 "a")

; FUNCTIONS ////////////////////////////////////////////////////////////////////

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
(check-expect (editor_left (create_editor "abc" ""))
              (create_editor "ab" "c"))
(check-expect (editor_left (create_editor "ab" "c"))
              (create_editor "a" "bc"))
(check-expect (editor_left (create_editor "a" "bc"))
              (create_editor "" "abc"))
(check-expect (editor_left (create_editor "" "abc"))
              (create_editor "" "abc"))

(define (editor_left ed)
  (make-editor
   (cond
     [(empty? (editor-pre ed)) '()]
     [else
      (reverse (rmv_first (reverse (editor-pre ed))))])
   (cond
     [(empty? (editor-pre ed)) (editor-post ed)]
     [else
      (cons (first (reverse (editor-pre ed)))
            (editor-post ed))])))

; Lo1s -> Lo1s
; Removes the first element of a Lo1s
(check-expect (rmv_first '()) '())
(check-expect (rmv_first (cons "a" (cons "b" '())))
              (cons "b" '()))

(define (rmv_first char_list)
  (cond
    [(empty? char_list) '()]
    [else (rest char_list)])) 

; Editor -> Editor
; Moves the first character of editor-post to the end of editor-pre
(check-expect (editor_right (create_editor "" ""))
              (create_editor "" ""))
(check-expect (editor_right (create_editor "" "abc"))
              (create_editor "a" "bc"))
(check-expect (editor_right (create_editor "a" "bc"))
              (create_editor "ab" "c"))
(check-expect (editor_right (create_editor "ab" "c"))
              (create_editor "abc" ""))
(check-expect (editor_right (create_editor "abc" ""))
              (create_editor "abc" ""))

(define (editor_right ed)
  (make-editor
   (cond
     [(empty? (editor-post ed)) (editor-pre ed)]
     [else
      (list_append (editor-pre ed)
                   (first (editor-post ed)))])
   (cond
     [(empty? (editor-post ed)) '()]
     [else
      (rest (editor-post ed))])))

; Lo1s 1String -> Lo1s
; Appends a 1String to a Lo1s
(check-expect (list_append '() "a") (cons "a" '()))
(check-expect (list_append (cons "a" '()) "b")
              (cons "a" (cons "b" '())))

(define (list_append char_list char)
  char_list)

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
