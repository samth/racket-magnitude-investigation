#lang racket/base

(require racket/unsafe/ops)

(define iterations 100000000)

(define (explicit n)
  (define (loop n x y)
    (if (unsafe-fx= n 0)
        (unsafe-fl+ x y)
        (loop (unsafe-fx- n 1)
              (unsafe-fl+ x 1.0)
              (unsafe-fl+ y 2.0))))
  (unsafe-fl+ 3.0 (loop n 0.0 0.0)))

(define (named n)
  (unsafe-fl+
   3.0
   (let loop ([n n] [x 0.0] [y 0.0])
     (if (unsafe-fx= n 0)
         (unsafe-fl+ x y)
         (loop (unsafe-fx- n 1)
               (unsafe-fl+ x 1.0)
               (unsafe-fl+ y 2.0))))))

(define (measure name f)
  (collect-garbage)
  (define allocation-start (current-memory-use 'cumulative))
  (define time-start (current-inexact-monotonic-milliseconds))
  (define result (f iterations))
  (define elapsed
    (- (current-inexact-monotonic-milliseconds) time-start))
  (define allocated
    (- (current-memory-use 'cumulative) allocation-start))
  (printf "~a: result ~a; ~a ms; ~a MB allocated\n"
          name result (round elapsed) (round (/ allocated 1000000))))

(module+ main
  (measure 'explicit explicit)
  (measure 'named named))

(provide explicit named)
