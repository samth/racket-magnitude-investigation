#lang typed/racket

(require math/flonum)

(provide mandelbrot)

(module+ main
  (require typed/racket/unsafe)
  (unsafe-require/typed "benchmark-main.rkt"
    [run-benchmark (-> String Any Void)])
  (run-benchmark "typed-zfl-alt-mag" mandelbrot))

(define (mandelbrot #:width [width : Positive-Integer]
                    #:height [height : Positive-Integer]
                    #:max_iter [max-iter : Positive-Integer]
                    #:lut [lut : Bytes]
                    #:corner [corner : Number]
                    #:scale [scale : Real]
                    #:dst [dst : Bytes]
                    #:dst_offset [dst-offset : Natural]
                    #:dst_row_stride [dst-row-stride : Natural])
  (define (set-pixel! [x : Natural] [y : Natural] [iters : Natural])
    (bytes-copy!
     dst
     (+ dst-offset
        (* y dst-row-stride)
        (* x 4))
     lut
     (* iters 4)
     (+ (* iters 4) 4)))

  (define (magnitude [z : Float-Complex])
    (flsqrt (+ (sqr (real-part z))
               (sqr (imag-part z)))))

  (for* ([px-y : Natural (in-range 0 height)]
         [px-x : Natural (in-range 0 width)])

    (define c
      (+ (exact->inexact corner)
         (* (make-rectangular
             (exact->inexact px-x)
             (- (exact->inexact px-y)))
            (exact->inexact scale))))

    (define (iterate [i : Natural] [z : Float-Complex]) : Natural
      (cond
        [(and (< i max-iter)
              (<= (magnitude z) 2.0))
         (iterate (+ i 1) (+ (* z z) c))]
        [else i]))

    (set-pixel! px-x px-y (iterate 0 c))))
