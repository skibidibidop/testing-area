#|
Author: Mark Beltran
Date: August 24, 023

Exercise 339. Design find?. The function consumes a Dir and a file
name and determines whether or not a file with this name occurs in the
directory tree.
|#

(require htdp/dir)

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define DIR_TREE
  (make-dir "TS"
               (list
                (make-dir "Text"
                             '()
                             (list
                              (make-file "part1" 99 "")
                              (make-file "part2" 52 "")
                              (make-file "part3" 17 "")))
                (make-dir "Libs"
                             (list
                              (make-dir "Code"
                                           '()
                                           (list
                                            (make-file "hang" 8 "")
                                            (make-file "draw" 2 "")))
                              (make-dir "Docs"
                                           '()
                                           (list
                                            (make-file "write!" 19 ""))))
                             '()))
               (list
                (make-file "read!" 10 ""))))

(define DIR_TREE2
  (make-dir
   "TS"
   (list
    (make-dir "Text"
                 '()
                 (list
                  (make-file "part1" 99 "")
                  (make-file "part2" 52 "")
                  (make-file "part3" 17 "")))
    (make-dir "Libs"
                 (list
                  (make-dir "Code"
                               '()
                               (list
                                (make-file "hang" 8 "")
                                (make-file "draw" 2 "")))
                  (make-dir "Docs"
                               (list
                                (make-dir "Extra"
                                             '()
                                             (list
                                              (make-file "hey" 3 "")
                                              (make-file "there" 4 ""))))
                               (list
                                (make-file "write!" 19 ""))))
                 '()))
   (list
    (make-file "read!" 10 ""))))

(define EMPTY_DIR_TREE (make-dir "Empty" '() '()))
(define NO_DIRS
  (make-dir
   "No Dirs"
   '()
   (list
    (make-file "f1" 5 "")
    (make-file "f2" 32 ""))))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Dir String -> Boolean
; Does d contain any file named fnam
(check-expect (find? EMPTY_DIR_TREE "hi") #false)
(check-expect (find? NO_DIRS "yo") #false)
(check-expect (find? NO_DIRS "f2") #true)
(check-expect (find? NO_DIRS "f1") #true)
(check-expect (find? DIR_TREE "draw") #true)
(check-expect (find? DIR_TREE2 "there") #true)
(check-expect (find? DIR_TREE2 "wow!") #false)

(define (find? d fnam)
  (local
    [; [List-of File] -> Boolean 
     (define (fname_in? f_list)
       (cond
         [(empty? f_list) #false]
         [else
          (or (string=? fnam (file-name (first f_list)))
              (fname_in? (rest f_list)))]))]
         
  (foldl
   (λ (a_dir base)
     (or (find? a_dir fnam)
         base))
   (fname_in? (dir-files d))
   (dir-dirs d))))

