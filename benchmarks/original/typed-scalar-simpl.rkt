#lang typed/racket

(require math/flonum)

(provide mandelbrot)

(module+ main
  (require typed/racket/unsafe)
  (unsafe-require/typed "benchmark-main.rkt"
    [run-benchmark (-> String Any Void)])
  (run-benchmark "typed-scalar-simpl" mandelbrot))

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

  (for* ([px-y : Natural (in-range 0 height)]
         [px-x : Natural (in-range 0 width)])

    (define c-rl
      (+ (fl (real-part corner))
         (* (fl px-x) (fl scale))))

    (define c-im
      (- (fl (imag-part corner))
         (* (fl px-y) (fl scale))))

    (define (iterate [i : Natural] [z-rl : Float] [z-im : Float]) : Natural
      (cond
        [(and (< i max-iter)
              (<= (+ (* z-rl z-rl) (* z-im z-im)) 4.0))
         (iterate (+ i 1)
                  (+ (- (* z-rl z-rl) (* z-im z-im)) c-rl)
                  (+ (* z-rl z-im 2.0) c-im))]
        [else i]))

    (set-pixel! px-x px-y (iterate 0 c-rl c-im))))
