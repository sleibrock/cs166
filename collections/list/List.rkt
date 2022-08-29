#lang racket/base


(provide (struct-out List)
         List:cons
         List:car
         List:cdr
         List:reverse
         List:init
         ;List:map
         ;List:for-each
         ;List:filter
         ;List:foldl
         ;List:foldr
         )


(struct List (items len))

(define (List:cons V L)
  (List (cons V (List-items L))
        (add1 (List-len L))))

(define (List:car L)
  (car (List-items L)))

(define (List:cdr L)
  (List (cdr (List-items L))
        (sub1 (List-len L))))

(define (List:reverse L)
  (List (reverse (List-items L))
        (List-len L)))

(define (List:init . args)
  (define (inner items acc)
    (if (eqv? '() items)
        acc
        (inner (cdr items)
               (List:cons (car items) acc))))
  (List:reverse (inner args (List '() 0))))
               


(module+ test
  (require rackunit)


  (check-eqv? 10 (List-len (List:init 1 2 3 4 5 6 7 8 9 10)))
  (check-equal? '(1 2 3 4)
                (List-items (List:init 1 2 3 4)))
  )

; end List.rkt
