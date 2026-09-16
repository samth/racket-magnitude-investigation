#lang racket/base

(require "inexact-reference.rkt")

(provide run-benchmark)

(define resolution 1024)
(define max-iter 1024)
(define repeat 5)
(define corner -2+2i)

(define (make-iter-lut)
  (define lut (make-bytes (* 4 (add1 max-iter))))
  (for ([iter (in-range (add1 max-iter))])
    (define channel
      (min 255 (max 0 (inexact->exact
                       (round (* 255 (- 1 (expt (/ iter max-iter)
                                                 (/ 1.0 2.4)))))))))
    (define offset (* iter 4))
    (bytes-set! lut offset 255)
    (for ([channel-offset (in-range 1 4)])
      (bytes-set! lut (+ offset channel-offset) channel)))
  lut)

(define (run-benchmark name impl)
  (define lut (make-iter-lut))
  (define scale (/ 4 resolution))
  (define dst-row-stride (* resolution 4))
  (define dst-size (* resolution dst-row-stride))
  (define (run dst implementation)
    (implementation #:width resolution
                    #:height resolution
                    #:max_iter max-iter
                    #:lut lut
                    #:corner corner
                    #:scale scale
                    #:dst dst
                    #:dst_offset 0
                    #:dst_row_stride dst-row-stride))

  (define reference (make-bytes dst-size))
  (run reference mandelbrot)
  (run (make-bytes dst-size) impl) ; discarded warmup

  (define times '())
  (define allocations '())
  (for ([iteration (in-range repeat)])
    (define dst (make-bytes dst-size))
    (collect-garbage)
    (define start-allocation (current-memory-use 'cumulative))
    (define start-time (current-inexact-monotonic-milliseconds))
    (run dst impl)
    (define elapsed (- (current-inexact-monotonic-milliseconds) start-time))
    (define allocated (- (current-memory-use 'cumulative) start-allocation))
    (unless (bytes=? dst reference)
      (for ([i (in-range dst-size)])
        (unless (= (bytes-ref dst i) (bytes-ref reference i))
          (error 'run-benchmark
                 "result does not match reference; first mismatch at ~a; reference value ~a; benchmark value ~a"
                 i (bytes-ref reference i) (bytes-ref dst i)))))
    (set! times (cons elapsed times))
    (set! allocations (cons allocated allocations)))

  (define (fmt-time ms)
    (format "~ams" (inexact->exact (round ms))))
  (printf "----\n[~a] ~ax~a max_iter=~a\n" name resolution resolution max-iter)
  (printf "time min: ~a max: ~a avg: ~a\n"
          (fmt-time (apply min times))
          (fmt-time (apply max times))
          (fmt-time (/ (apply + times) repeat)))
  (printf "alloc avg: ~a MB\n"
          (round (/ (apply + allocations) repeat 1000000))))
