#lang typed/racket

(require math/flonum)

(module+ main
  (require typed/racket/unsafe)
  (unsafe-require/typed "../original/benchmark-main.rkt"
    [run-benchmark (-> String Any Void)])
  (run-benchmark "typed-zfl-named-squared-mag" mandelbrot))

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
    (bytes-copy! dst
                 (+ dst-offset (* y dst-row-stride) (* x 4))
                 lut
                 (* iters 4)
                 (+ (* iters 4) 4)))
  (for* ([px-y : Natural (in-range 0 height)]
         [px-x : Natural (in-range 0 width)])
    (define c
      (+ (exact->inexact corner)
         (* (make-rectangular (exact->inexact px-x)
                              (- (exact->inexact px-y)))
            (exact->inexact scale))))
    (define iters : Natural
      (let iterate : Natural ([i : Natural 0]
                              [z : Float-Complex c])
        (cond
          [(and (< i max-iter)
                (let ([zr (real-part z)]
                      [zi (imag-part z)])
                  (fl<= (fl+ (fl* zr zr) (fl* zi zi)) 4.0)))
           (iterate (+ i 1) (+ (* z z) c))]
          [else i])))
    (set-pixel! px-x px-y iters)))
