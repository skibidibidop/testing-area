#|
Author: Mark Beltran
Date: May 24, 2023

One line text editor
|#

(require 2htdp/image)
(require 2htdp/universe)

(define scaler 10)
(define box_width (* scaler 20))
(define box_height (* scaler 2))
(define xcenter (/ box_width 2))
(define ycenter (/ box_height 2))
(define text_box (empty-scene box_width box_height))
(define cursor (rectangle 1 box_height "solid" "red"))
(define MAX_CHAR (* scaler 2))

(define-struct editor [pre post])
; editor: a structure
; (make-editor string string)
; Interpretation: (make-editor l r)
; One line editor, visible text is
; (string-append left right), cursor is rendered
; between the two parts

; editor -> image
; Puts text image and cursor in text box. Cursor
; position is based on data from editor
(check-expect (render (make-editor "Hith" "ere!"))
              (place-image
               (beside
                (text "Hith" 16 "black")
                cursor
                (text "ere!" 16 "black"))
               xcenter ycenter
               text_box))

(define (render ed)
  (place-image
   (beside
    (text (editor-pre ed) 16 "black")
    cursor
    (text (editor-post ed) 16 "black"))
   xcenter ycenter
   text_box))

; string -> integer
; Get index number of the last string character
(check-expect (last_index "Hi!") 2)
(define (last_index str)
  (- (string-length str) 1))

; string -> string
; Removes the last character of a string
(check-expect (rmv_last "Hello") "Hell")
(check-expect (rmv_last "e") "")
(define (rmv_last s)
  (cond[(> (string-length s) 0)
        (substring s 0 (last_index s))]
       [else s]))

; editor -> editor
; Transfers the last character of editor-pre to the
; beginning of editor-post
(check-expect (to_left (make-editor "Tester" "one"))
              (make-editor "Teste" "rone"))
(check-expect (to_left (make-editor "one" ""))
              (make-editor "on" "e"))
(check-expect (to_left (make-editor "" "one"))
              (make-editor "" "one"))
(check-expect (to_left (make-editor "" ""))
              (make-editor "" ""))
(define (to_left ed)
  (cond[(> (string-length (editor-pre ed)) 0)
        (make-editor
         (substring
          (editor-pre ed)
          0 (last_index (editor-pre ed)))
         (string-append
          (string-ith
           (editor-pre ed)
           (last_index (editor-pre ed)))
          (editor-post ed)))]
       [else ed]))

; editor -> editor
; Appends the first character of editor-post to
; editor-pre
(check-expect (to_right (make-editor "Tester" "one"))
              (make-editor "Testero" "ne"))
(check-expect (to_right (make-editor "one" ""))
              (make-editor "one" ""))
(check-expect (to_right (make-editor "" "one"))
              (make-editor "o" "ne"))
(check-expect (to_right (make-editor "" "" ))
              (make-editor "" ""))
(define (to_right ed)
  (cond[(> (string-length (editor-post ed)) 0)
        (make-editor
         (string-append
          (editor-pre ed)
          (string-ith (editor-post ed) 0))
         (substring
          (editor-post ed)
          1 (string-length (editor-post ed))))]
       [else ed]))

; A keyevent is one of the following:
; -- "\b"
; -- "left"
; -- "right"
; -- 1String that  isn't "\t" or "\r"
; Interpretation: used to manipulate the text
; and cursor in the text box

; editor -> Boolean
; Checks if max no. of characters reached
(check-expect (check_length
               (make-editor "Hi" "there"))
              (#true))
(check-expect (check_length
               (make-editor "123456789" "01234567890123"))
              (#false))
(define (check_length ed)
  (<= (+ (string-length (editor-pre ed))
         (string-length (editor-post ed)))
      MAX_CHAR))

; editor keyevent -> editor
; If ke is \b, delete character to the left of the
; cursor (if any). If ke is a single character, add that
; character to the left of the cursor. If ke is "left" or
; "right", move cursor 1 character based on the direction
; if there are any characters left there.
(check-expect (edit (make-editor "Test" "one") "\b")
              (make-editor "Tes" "one"))
(check-expect (edit (make-editor "Testtwo" "") "\b")
              (make-editor "Testtw" ""))
(check-expect (edit (make-editor "" "Testthree") "\b")
              (make-editor "" "Testthree"))
(check-expect (edit (make-editor "Test" "four") "left")
              (make-editor "Tes" "tfour"))
(check-expect (edit (make-editor "Testfive" "") "left")
              (make-editor "Testfiv" "e"))
(check-expect (edit (make-editor "" "Testsix") "left")
              (make-editor "" "Testsix"))
(check-expect (edit (make-editor "T" "estseven") "left")
              (make-editor "" "Testseven"))
(check-expect (edit (make-editor "" "") "left")
              (make-editor "" ""))
(check-expect (edit (make-editor "Test" "eight") "right")
              (make-editor "Teste" "ight"))
(check-expect (edit (make-editor "Testnine" "") "right")
              (make-editor "Testnine" ""))
(check-expect (edit (make-editor "" "Testten") "right")
              (make-editor "T" "estten"))
(check-expect (edit (make-editor "Testeleve" "n") "right")
              (make-editor "Testeleven" ""))
(check-expect (edit (make-editor "" "") "right")
              (make-editor "" ""))
(check-expect (edit (make-editor "Test" "twelve") " ")
              (make-editor "Test " "twelve"))
(check-expect (edit (make-editor "" "Test13") " ")
              (make-editor " " "Test13"))
(check-expect (edit (make-editor "Test14" "") " ")
              (make-editor "Test14 " ""))
(check-expect (edit (make-editor "" "") "a")
              (make-editor "a" ""))
(check-expect (edit (make-editor "Hello" "there") "\r")
              (make-editor "Hello" "there"))
(check-expect (edit (make-editor "Hi" "there") "\t")
              (make-editor "Hi" "there"))
(define (edit ed ke)
  (cond[(<= (+ (string-length (editor-pre ed))
               (string-length (editor-post ed)))
            MAX_CHAR)
        (cond[(string=? ke "\b")
              (make-editor
               (rmv_last (editor-pre ed))
               (editor-post ed))]
             [(string=? ke "left") (to_left ed)]
             [(string=? ke "right") (to_right ed)]
             [(or (and (= (string-length ke) 1)
                       (string-alphabetic? ke))
                  (string=? ke " ")
                  (string-numeric? ke))
              (make-editor
               (string-append
                (editor-pre ed) ke)
               (editor-post ed))]
             [else ed])]
        [else ed]))

; editor ke -> editor
(define (run ed)
  (big-bang ed
    [to-draw render]
    [on-key edit]))
