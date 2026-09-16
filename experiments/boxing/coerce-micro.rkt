#lang racket/base

(require racket/fixnum racket/unsafe/ops)

(provide raw coerce)

(define n 100000000)

(define (raw)
  (let loop ([i 0] [x 0.25] [y 0.75])
    (if (unsafe-fx< i n)
        (let ([nx (unsafe-fl+ (unsafe-fl* x 0.99999999) 1e-9)]
              [ny (unsafe-fl- (unsafe-fl* y 0.99999998) 1e-9)])
          (loop (unsafe-fx+ i 1) nx ny))
        (unsafe-fl+ x y))))

(define (coerce)
  (let loop ([i 0] [x 0.25] [y 0.75])
    (if (unsafe-fx< i n)
        (let ([nx (unsafe-fl+ (unsafe-fl* x 0.99999999) 1e-9)]
              [ny (unsafe-fl- (unsafe-fl* y 0.99999998) 1e-9)])
          (loop (unsafe-fx+ i 1)
                (real->double-flonum nx)
                (real->double-flonum ny)))
        (unsafe-fl+ x y))))

(module+ main
  (define mode (vector-ref (current-command-line-arguments) 0))
  (define proc (if (equal? mode "raw") raw coerce))
  (void (proc))
  (collect-garbage)
  (define start-real (current-inexact-monotonic-milliseconds))
  (define start-cpu (current-process-milliseconds))
  (define start-gc (current-gc-milliseconds))
  (define start-allocation (current-memory-use 'cumulative))
  (define answer (proc))
  (printf "~a result ~a real-ms ~a cpu-ms ~a gc-ms ~a alloc-bytes ~a\n"
          mode answer
          (- (current-inexact-monotonic-milliseconds) start-real)
          (- (current-process-milliseconds) start-cpu)
          (- (current-gc-milliseconds) start-gc)
          (- (current-memory-use 'cumulative) start-allocation)))
