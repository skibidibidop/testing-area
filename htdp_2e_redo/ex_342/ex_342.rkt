#|
Author: Mark Beltran
Date: August 26, 2023

Exercise 342. Design find. The function consumes a directory d and a
file name f. If (find? d f) is #true, find produces a path to a file with
name f; otherwise it produces #false.

Hint: while it is tempting to first check whether the file name occurs in
the directory tree, you have to do so for every single sub-directory. Hence
it is better to combine the functionality of find? and find.

Challenge: The find function discovers only one of the two files named
read! in figure 123. Design find-all, which generalizes find and produces
the list of all paths that lead to f in d. What should find-all produce when
(find? d f) is #false? Is this part of the problem really a challenge
compared to the basic problem?
|#

(require htdp/dir)

; DATA DEFINITION //////////////////////////////////////////////////////////////

; A Path is a [List-of String]
; Interp.: directions into a directory tree

; A MatchOrNot is one of:
; #false
; Path

; A Dir* is a [List-of Dir]

; A File* is a [List-of File]

(define DIR_TREE
  (make-dir "TS (DIR)"
            (list
             (make-dir "Text (DIR)"
                       '()
                       (list
                        (make-file "part1" 99 "")
                        (make-file "part2" 52 "")
                        (make-file "part3" 17 "")))
             (make-dir "Libs (DIR)"
                       (list
                        (make-dir "Code (DIR)"
                                  '()
                                  (list
                                   (make-file "hang" 8 "")
                                   (make-file "draw" 2 "")))
                        (make-dir "Docs (DIR)"
                                  '()
                                  (list
                                   (make-file "write!" 19 ""))))
                       '()))
            (list
             (make-file "read!" 10 ""))))

(define DIR_TREE2
  (make-dir
   "TS (DIR)"
   (list
    (make-dir "Text (DIR)"
              '()
              (list
               (make-file "part1" 99 "")
               (make-file "part2" 52 "")
               (make-file "part3" 17 "")))
    (make-dir "Libs (DIR)"
              (list
               (make-dir "Code (DIR)"
                         '()
                         (list
                          (make-file "hang" 8 "")
                          (make-file "draw" 2 "")))
               (make-dir "Docs (DIR)"
                         (list
                          (make-dir "Extra (DIR)"
                                    '()
                                    (list
                                     (make-file "hey" 3 "")
                                     (make-file "there" 4 ""))))
                         (list
                          (make-file "write!" 19 ""))))
              '()))
   (list
    (make-file "read!" 10 ""))))

(define EMPTY_DIR_TREE (make-dir "Empty (DIR)" '() '()))
(define NO_DIRS
  (make-dir
   "No Dirs (DIR)"
   '()
   (list
    (make-file "f1" 5 "")
    (make-file "f2" 32 ""))))

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Dir String -> MatchOrNot
; Returns Path if f is in d, #false otherwise
(check-expect (find EMPTY_DIR_TREE "write!") #false)
(check-expect (find NO_DIRS "write!") #false)
(check-expect (find NO_DIRS "f2")
              (list "No Dirs (DIR)" "f2"))
(check-expect (find DIR_TREE "Docs (DIR)")
              (list "TS (DIR)" "Libs (DIR)" "Docs (DIR)"))
(check-expect (find DIR_TREE2 "there")
              (list "TS (DIR)" "Libs (DIR)" "Docs (DIR)"
                    "Extra (DIR)" "there"))

(define (find d f)
  (local
    [; Dir -> Boolean
     ; Is f in a_dir
     (define (find? a_dir)
       (or (string=? f (dir-name a_dir))
           (in_dir_list? (dir-dirs a_dir))
           (in_file_list? (dir-files a_dir))))
     
     ; Dir* -> Boolean
     (define (in_dir_list? dl)
       (foldl
        (λ (a_dir base)
          (or (string=? f (dir-name a_dir))
              base))
        #false
        dl))

     ; File* -> Boolean
     (define (in_file_list? fl)
       (foldl
        (λ (a_file base)
          (or (string=? f (file-name a_file))
              base))
        #false
        fl))

     ; Print dir-name only until f is found
     (define (print_path 
     ]

    (if (find? d)
        (print_path d)
        #false)))
