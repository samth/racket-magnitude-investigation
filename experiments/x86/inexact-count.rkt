#lang racket

(provide mandelbrot iteration-count)

(define iteration-count 0)

(module+ main
  (require "benchmark-main.rkt")
  (run-benchmark "inexact" mandelbrot))

(define (mandelbrot #:width width
                    #:height height
                    #:max_iter max-iter
                    #:lut lut
                    #:corner corner
                    #:scale scale
                    #:dst dst
                    #:dst_offset dst-offset
                    #:dst_row_stride dst-row-stride)
  (define (set-pixel! x y iters)
    (bytes-copy!
     dst
     (+ dst-offset
        (* y dst-row-stride)
        (* x 4))
     lut
     (* iters 4)
     (+ (* iters 4) 4)))

  (for* ([px-y (in-range 0 height)]
         [px-x (in-range 0 width)])

    (define c
      (+ (exact->inexact corner)
         (* (make-rectangular
             (exact->inexact px-x)
             (- (exact->inexact px-y)))
            (exact->inexact scale))))

    (define (iterate i z)
      (cond
        [(and (< i max-iter)
              (<= (magnitude z) 2.0))
         (set! iteration-count (add1 iteration-count))
         (iterate (+ i 1) (+ (* z z) c))]
        [else i]))

    (set-pixel! px-x px-y (iterate 0 c))))
