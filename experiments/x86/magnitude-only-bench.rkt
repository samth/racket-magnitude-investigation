#lang racket/base

(require racket/vector racket/format
         "magnitude-plain.rkt"
         "magnitude-typed.rkt")

(define all-samples (call-with-input-file "magnitude-samples.rktd" read))
(define sample-count 8192)
(define zs
  (for/vector ([j (in-range sample-count)])
    (vector-ref all-samples
                (quotient (* j (vector-length all-samples)) sample-count))))
(define rounds 1024)
(define implementations
  (list (cons 'native run-native)
        (cons 'native-fl<= run-native-fl<=)
        (cons 'tr-default run-default)
        (cons 'ratio-zero? run-ratio-zero)
        (cons 'tr-ratio-fl= run-ratio)
        (cons 'simple run-simple)
        (cons 'hybrid run-hybrid)))

(define expected (run-native zs 1))
(printf "inputs=~a calls/run=~a hits/round=~a\n"
        (vector-length zs) (* sample-count rounds) expected)

(for ([entry implementations]) ((cdr entry) zs 1))

(for ([entry implementations])
  (for ([rep (in-range 5)])
    (collect-garbage)
    (define start-memory (current-memory-use 'cumulative))
    (define start-time (current-inexact-monotonic-milliseconds))
    (define hits ((cdr entry) zs rounds))
    (define ms (- (current-inexact-monotonic-milliseconds) start-time))
    (define mb (/ (- (current-memory-use 'cumulative) start-memory) 1000000.0))
    (unless (= hits (* expected rounds))
      (error 'magnitude-only-bench "~a produced ~a hits; expected ~a"
             (car entry) hits (* expected rounds)))
    (printf "~a rep=~a ms=~a allocMB=~a\n" (car entry) rep
            (real->decimal-string ms 1) (real->decimal-string mb 1))))
