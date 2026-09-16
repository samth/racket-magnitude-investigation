#lang typed/racket

(require math/flonum typed/racket/unsafe)
(unsafe-provide run-flhypot)

(define (run-flhypot [zs : (Vectorof Float-Complex)] [rounds : Natural]) : Natural
  (define len : Natural (vector-length zs))
  (let outer : Natural ([round : Natural 0] [hits : Natural 0])
    (if (= round rounds)
        hits
        (let inner : Natural ([j : Natural 0] [hits : Natural hits])
          (if (= j len)
              (outer (add1 round) hits)
              (let ([z (vector-ref zs j)])
                (inner (add1 j)
                       (if (<= (flhypot (real-part z) (imag-part z)) 2.0)
                           (add1 hits) hits))))))))
