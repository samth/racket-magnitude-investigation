#lang typed/racket

(require math/flonum typed/racket/unsafe)
(unsafe-provide run-default run-ratio-zero run-ratio run-simple run-hybrid)

(define-syntax-rule (ratio-magnitude-zero z)
  (let ([r (flabs (real-part z))]
        [i (flabs (imag-part z))])
    (if (zero? i)
        r
        (if (or (fl= r +inf.0) (fl= i +inf.0))
            +inf.0
            (if (fl< i r)
                (let ([q (fl/ i r)])
                  (fl* r (flsqrt (fl+ 1.0 (fl* q q)))))
                (let ([q (fl/ r i)])
                  (fl* i (flsqrt (fl+ 1.0 (fl* q q))))))))))

(define-syntax-rule (ratio-magnitude z)
  (let ([r (flabs (real-part z))]
        [i (flabs (imag-part z))])
    (if (fl= i 0.0)
        r
        (if (or (fl= r +inf.0) (fl= i +inf.0))
            +inf.0
            (if (fl< i r)
                (let ([q (fl/ i r)])
                  (fl* r (flsqrt (fl+ 1.0 (fl* q q)))))
                (let ([q (fl/ r i)])
                  (fl* i (flsqrt (fl+ 1.0 (fl* q q))))))))))

(define-syntax-rule (simple-magnitude z)
  (let ([r (real-part z)] [i (imag-part z)])
    (flsqrt (fl+ (fl* r r) (fl* i i)))))

(define-syntax-rule (hybrid-magnitude z)
  (let ([r (flabs (real-part z))]
        [i (flabs (imag-part z))])
    (let ([larger (if (fl< r i) i r)])
      (cond
        [(or (fl= r +inf.0) (fl= i +inf.0)) +inf.0]
        [(and (fl>= larger 1e-150) (fl<= larger 1e150))
         (flsqrt (fl+ (fl* r r) (fl* i i)))]
        [(fl= i 0.0) r]
        [(fl< i r)
         (let ([q (fl/ i r)])
           (fl* r (flsqrt (fl+ 1.0 (fl* q q)))))]
        [else
         (let ([q (fl/ r i)])
           (fl* i (flsqrt (fl+ 1.0 (fl* q q)))))]))))

(define-syntax-rule (define-runner name mag)
  (define (name [zs : (Vectorof Float-Complex)] [rounds : Natural]) : Natural
    (define len : Natural (vector-length zs))
    (let outer : Natural ([round : Natural 0] [hits : Natural 0])
      (if (= round rounds)
          hits
          (let inner : Natural ([j : Natural 0] [hits : Natural hits])
            (if (= j len)
                (outer (add1 round) hits)
                (let ([z (vector-ref zs j)])
                  (inner (add1 j)
                         (if (<= (mag z) 2.0)
                             (add1 hits) hits)))))))))

(define-runner run-default magnitude)
(define-runner run-ratio-zero ratio-magnitude-zero)
(define-runner run-ratio ratio-magnitude)
(define-runner run-simple simple-magnitude)
(define-runner run-hybrid hybrid-magnitude)
