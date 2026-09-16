#lang typed/racket

(require math/flonum
         racket/fixnum
         racket/unsafe/ops)

(provide mandelbrot)

(module+ main
  (require typed/racket/unsafe)
  (unsafe-require/typed "benchmark-main.rkt"
    [run-benchmark (-> String Any Void)])
  (run-benchmark "typed-opt-cross-add-unsafe-i" mandelbrot))

(define (mandelbrot #:width [width : Positive-Fixnum]
                    #:height [height : Positive-Fixnum]
                    #:max_iter [max-iter : Positive-Fixnum]
                    #:lut [lut : Bytes]
                    #:corner [corner : Number]
                    #:scale [scale : Real]
                    #:dst [dst : Bytes]
                    #:dst_offset [dst-offset : Nonnegative-Fixnum]
                    #:dst_row_stride [dst-row-stride : Nonnegative-Fixnum]) : Void
  (define corner-rl
    (fl (real-part corner)))

  (define corner-im
    (fl (imag-part corner)))

  (define scale-fl
    (fl scale))

  (let row-loop ([px-y : Fixnum 0])
    (when (< px-y height)
      (define c-im
        (- corner-im
           (* (fl px-y) scale-fl)))

      (define row-offset
        (fx+ dst-offset
           (fx* px-y dst-row-stride)))

      (let col-loop ([px-x : Fixnum 0])
        (when (< px-x width)
          (define c-rl
            (+ corner-rl
               (* (fl px-x) scale-fl)))

          (define iters : Fixnum
            (let iterate ([i : Fixnum 0]
                          [z-rl : Float c-rl]
                          [z-im : Float c-im])
              (define z-rl-2 (* z-rl z-rl))
              (define z-im-2 (* z-im z-im))
              (cond
                [(and (< i max-iter)
                      (<= (+ z-rl-2 z-im-2) 4.0))
                 (iterate (unsafe-fx+ i 1)
                          (+ (- z-rl-2 z-im-2) c-rl)
                          (+ (let ([z-rl-im (* z-rl z-im)]) (+ z-rl-im z-rl-im)) c-im))]
                [else i])))

          (define lut-offset
            (fx* iters 4))

          (bytes-copy!
           dst
           (fx+ row-offset (fx* px-x 4))
           lut
           lut-offset
           (fx+ lut-offset 4))

          (col-loop (fx+ px-x 1))))

      (row-loop (fx+ px-y 1)))))
