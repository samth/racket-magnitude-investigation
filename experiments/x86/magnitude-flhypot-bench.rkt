#lang racket/base

(require "magnitude-flhypot-typed.rkt" "magnitude-cs-hypot-typed.rkt"
         "magnitude-typed.rkt")

(define all-samples (call-with-input-file "magnitude-samples.rktd" read))
(define count 8192)
(define zs
  (for/vector ([j (in-range count)])
    (vector-ref all-samples
                (quotient (* j (vector-length all-samples)) count))))
(define rounds 1024)
(define expected (run-default zs 1))
(for ([entry (list (cons 'optimizer-hybrid run-default)
                   (cons 'math/flonum-flhypot run-flhypot)
                   (cons 'cs-foreign-hypot run-cs-hypot))])
  ((cdr entry) zs 1)
  (for ([rep (in-range 5)])
    (collect-garbage)
    (define before (current-memory-use 'cumulative))
    (define t0 (current-inexact-monotonic-milliseconds))
    (define hits ((cdr entry) zs rounds))
    (define ms (- (current-inexact-monotonic-milliseconds) t0))
    (define mb (/ (- (current-memory-use 'cumulative) before) 1000000.0))
    (unless (= hits (* rounds expected))
      (error 'bench "incorrect count for ~a" (car entry)))
    (printf "~a rep~a ~ams ~aMB\n" (car entry) rep ms mb)))
