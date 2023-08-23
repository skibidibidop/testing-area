#|
Author: Mark Beltran
Date: August 24, 023

Exercise 338. Use create-dir to turn some of your directories into
ISL+ data representations. Then use how-many from exercise 336 to count
how many files they contain. Why are you confident that how-many produces
correct results for these directories?
|#

(require htdp/dir)

; DATA DEFINITION //////////////////////////////////////////////////////////////


; FUNCTIONS ////////////////////////////////////////////////////////////////////

(define (how-many dir)
  (local
    [; Dir.v3 -> N
     (define (count_files d)
       (length (dir-files d)))

     ; Dir* -> N
     (define (traverse dirs)
       (cond
         [(empty? dirs) 0]
         [else
          (+ (count_files (first dirs))
             (traverse (dir-dirs (first dirs)))
             (traverse (rest dirs)))]))]

    (+ (count_files dir)
       (traverse (dir-dirs dir)))))

(define WIN_DIR_PATH
  (create-dir "D:\\DrRacket\\Racket\\projects"))

(how-many WIN_DIR_PATH)


