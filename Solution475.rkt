#lang racket

(define/contract (find-heater house heaters-sorted)
  (-> exact-integer? (listof exact-integer?) exact-integer?)

  (define/contract (find-heater-helper left right)
    (-> exact-integer? exact-integer? exact-integer?)
    (define mid (floor (/ (+ left right) 2)))
    (if (> left right)
        left
        (if (equal? (list-ref heaters-sorted mid) house)
            mid
            (if (< (list-ref heaters-sorted mid) house)
                (find-heater-helper (+ mid 1) right)
                (find-heater-helper left (- mid 1))
                )
            )
        )
    )
  
  (find-heater-helper 0 (- (length heaters-sorted) 1))
  )

(define/contract (find-radius houses heaters)
  (-> (listof exact-integer?) (listof exact-integer?) exact-integer?)
  (define heaters-sorted (sort heaters < ))

  (define (left-dist-fn house heater-index) (- house (list-ref heaters-sorted (- heater-index 1))))
  (define (right-dist-fn house heater-index) (- (list-ref heaters-sorted heater-index) house))
  
  (foldr max 0 (map (lambda (house)
                      (define heater-index (find-heater house heaters-sorted))                      
  
                      (if (equal? heater-index 0)
                          (right-dist-fn house heater-index)
                          (if (equal? heater-index (length heaters-sorted))
                              (left-dist-fn house heater-index)
                              (min (left-dist-fn house heater-index) (right-dist-fn house heater-index))
                              )
                          )) (sort houses <)))
  )

(provide find-heater find-radius)
