#lang racket/base
(require racket/vector)

(define resolution 1024)
(define max-iter 1024)
(define sample-period 1024)
(define samples (make-vector 120000))
(define attempted 0)
(define stored 0)

(for* ([py (in-range resolution)] [px (in-range resolution)])
  (define c (+ -2+2i (* (make-rectangular (exact->inexact px)
                                           (- (exact->inexact py)))
                         (/ 4 resolution))))
  (let iterate ([i 0] [z c])
    (when (< i max-iter)
      (set! attempted (add1 attempted))
      (when (zero? (modulo attempted sample-period))
        (vector-set! samples stored
                     (make-rectangular (exact->inexact (real-part z))
                                       (exact->inexact (imag-part z))))
        (set! stored (add1 stored)))
      (when (<= (magnitude z) 2.0)
        (iterate (add1 i) (+ (* z z) c))))))

(define result (vector-copy samples 0 stored))
(call-with-output-file "magnitude-samples.rktd"
  (lambda (out) (write result out)) #:exists 'replace)
(printf "attempted ~a, stored ~a\n" attempted stored)
