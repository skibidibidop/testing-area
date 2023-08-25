#|
Author: Mark Beltran
Date: August 26, 2023

Exercise 341. Design du, a function that consumes a Dir and computes
the total size of all the files in the entire directory tree. Assume that
storing a directory in a Dir structure costs 1 file storage unit. In the real
world, a directory is basically a special file, and its size depends on how
large its associated directory is.
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

; Dir -> N
; Returns the total size of all files in a directory tree
; Sub-directories cost 1 file storage unit
(check-expect (du EMPTY_DIR_TREE) 0)
(check-expect (du NO_DIRS) 37)
(check-expect (du DIR_TREE) 211)
(check-expect (du DIR_TREE2) 219)

(define (du d)
  (local
    [(define (fsize_total f_list)
       (foldl
        (λ (a_file base)
          (+ (file-size a_file) base))
        0
        f_list))]

    (foldl
     (λ (a_dir base)
       (+ (du a_dir) base))
     (+ (length (dir-dirs d))
        (fsize_total (dir-files d)))
     (dir-dirs d))))
