#|
Author: Mark Beltran
Date: August 24, 023

Exercise 340. Design the function ls, which lists the names of all files
and directories in a given Dir.
|#

(require htdp/dir)

; DATA DEFINITION //////////////////////////////////////////////////////////////

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

; Dir -> [List-of File]
; Lists all file names in given directory
(check-expect (ls DIR_TREE)
              (list
               "TS (DIR)" "read!"
               "Text (DIR)" "part1" "part2" "part3"
               "Libs (DIR)"
               "Code (DIR)" "hang" "draw"
               "Docs (DIR)" "write!"))
(check-expect (ls DIR_TREE2)
              (list
               "TS (DIR)" "read!"
               "Text (DIR)" "part1" "part2" "part3"
               "Libs (DIR)"
               "Code (DIR)" "hang" "draw"
               "Docs (DIR)" "write!"
               "Extra (DIR)" "hey" "there"))
(check-expect (ls EMPTY_DIR_TREE) (list "Empty (DIR)"))
(check-expect (ls NO_DIRS) (list "No Dirs (DIR)" "f1" "f2"))

(define (ls d)
  (local
    [(define (fname_lister flist)
       (foldr
        (λ (an_f base)
          (cons (file-name an_f) base))
        '()
        flist))]

    (foldl
     (λ (a_dir base)
       (append base (ls a_dir)))
     (append (list (dir-name d))
             (fname_lister (dir-files d)))
     (dir-dirs d))))
