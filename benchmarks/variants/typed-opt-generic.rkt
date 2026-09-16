#lang typed/racket

(require math/flonum
         racket/fixnum
         racket/unsafe/ops)

(provide mandelbrot)

(module+ main
  (require typed/racket/unsafe)
  (unsafe-require/typed "benchmark-main.rkt"
    [run-benchmark (-> String Any Void)])
  (run-benchmark "typed-opt-generic" mandelbrot))

(define (mandelbrot #:width [width : Positive-Integer]
                    #:height [height : Positive-Integer]
                    #:max_iter [max-iter : Positive-Integer]
                    #:lut [lut : Bytes]
                    #:corner [corner : Number]
                    #:scale [scale : Real]
                    #:dst [dst : Bytes]
                    #:dst_offset [dst-offset : Natural]
                    #:dst_row_stride [dst-row-stride : Natural]) : Void
  (define corner-rl
    (fl (real-part corner)))

  (define corner-im
    (fl (imag-part corner)))

  (define scale-fl
    (fl scale))

  (let row-loop ([px-y : Natural 0])
    (when (< px-y height)
      (define c-im
        (- corner-im
           (* (fl px-y) scale-fl)))

      (define row-offset
        (+ dst-offset
           (* px-y dst-row-stride)))

      (let col-loop ([px-x : Natural 0])
        (when (< px-x width)
          (define c-rl
            (+ corner-rl
               (* (fl px-x) scale-fl)))

          (define iters : Natural
            (let iterate ([i : Natural 0]
                          [z-rl : Float c-rl]
                          [z-im : Float c-im])
              (define z-rl-2 (* z-rl z-rl))
              (define z-im-2 (* z-im z-im))
              (cond
                [(and (< i max-iter)
                      (<= (+ z-rl-2 z-im-2) 4.0))
                 (iterate (+ i 1)
                          (+ (- z-rl-2 z-im-2) c-rl)
                          (+ (* z-rl z-im 2.0) c-im))]
                [else i])))

          (define lut-offset
            (* iters 4))

          (bytes-copy!
           dst
           (+ row-offset (* px-x 4))
           lut
           lut-offset
           (+ lut-offset 4))

          (col-loop (+ px-x 1))))

      (row-loop (+ px-y 1)))))
