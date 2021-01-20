#lang racket

(require rackunit "./Solution475.rkt")

(define file-tests
  (test-suite
   "Solution 475"

   (test-case
    "(1 2 3) 2 = 2"
    (define house 2)
    (define heaters '(1 2 3))
    (check-equal? (find-heater house heaters)  1 "1")
    )

   (test-case
    "(1 2 3 6 8) 6 = 3"
    (define house 6)
    (define heaters '(1 2 3 6 8))
    (check-equal? (find-heater house heaters) 3 "3")
    )
   
   (test-case
    "(1 2 3) (2) = 1"
    (define houses '(1 2 3))
    (define heaters '(2))
    (check-equal? (find-radius houses heaters) 1 "1")
    )

   (test-case
    "(1 3 2) (2) = 1"
    (define houses '(1 3 2))
    (define heaters '(2))
    (check-equal? (find-radius houses heaters) 1 "1")
    )

   (test-case
    "(1 2 3 4) (1 4) = 1"
    (define houses '(1 2 3 4))
    (define heaters '(1 4))
    (check-equal? (find-radius houses heaters) 1 "1")
    )

   (test-case
    "(1 5) (2) = 3"
    (define houses '(1 5))
    (define heaters '(2))
    (check-equal? (find-radius houses heaters) 3 "3")
    )

   (test-case
    "(1 5) (10) = 9"
    (define houses '(1 5))
    (define heaters '(10))
    (check-equal? (find-radius houses heaters) 9 "9")
    )

   (test-case
    "unsorted"
    (define houses '(282475249 622650073 984943658 144108930 470211272 101027544 457850878 458777923))
    (define heaters '(823564440 115438165 784484492 74243042 114807987 137522503 441282327 16531729 823378840 143542612))
    (check-equal? (find-radius houses heaters) 161834419 "161834419")
    )

   (test-case
    "[474833169,264817709,998097157,817129560],[197493099,404280278,893351816,505795335]"
    (define houses '(474833169 264817709 998097157 817129560))
    (define heaters '(197493099 404280278 893351816 505795335))
    (check-equal? (find-radius houses heaters) 104745341 "104745341")
    )
   )
  )
   
(require rackunit/text-ui)
 
(run-tests file-tests 'verbose)