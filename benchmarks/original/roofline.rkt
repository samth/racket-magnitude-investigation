#lang racket

(require math/flonum
         racket/unsafe/ops)

(provide mandelbrot)

(module+ main
  (require "benchmark-main.rkt")
  (run-benchmark "roofline" mandelbrot))

(define (mandelbrot #:width width
                    #:height height
                    #:max_iter max-iter
                    #:lut lut
                    #:corner corner
                    #:scale scale
                    #:dst dst
                    #:dst_offset dst-offset
                    #:dst_row_stride dst-row-stride)
  (define corner-rl
    (fl (real-part corner)))

  (define corner-im
    (fl (imag-part corner)))

  (define scale-fl
    (fl scale))

  (let row-loop ([px-y 0])
    (when (unsafe-fx< px-y height)
      (define c-im
        (unsafe-fl-
         corner-im
         (unsafe-fl* (unsafe-fx->fl px-y) scale-fl)))

      (define row-offset
        (unsafe-fx+
         dst-offset
         (unsafe-fx* px-y dst-row-stride)))

      (let col-loop ([px-x 0])
        (when (unsafe-fx< px-x width)
          (define c-rl
            (unsafe-fl+
             corner-rl
             (unsafe-fl* (unsafe-fx->fl px-x) scale-fl)))

          (define iters
            (let iterate ([i 0]
                          [z-rl c-rl]
                          [z-im c-im]
                          [four 4.0])
              (define z-rl-2 (unsafe-fl* z-rl z-rl))
              (define z-im-2 (unsafe-fl* z-im z-im))
              (cond
                [(and (unsafe-fx< i max-iter)
                      (unsafe-fl<= (unsafe-fl+ z-rl-2 z-im-2) four))
                 (iterate (unsafe-fx+ i 1)
                          (unsafe-fl+ (unsafe-fl- z-rl-2 z-im-2) c-rl)
                          (unsafe-fl+ (let ([z-rl-im (unsafe-fl* z-rl z-im)])
                                        (unsafe-fl+ z-rl-im z-rl-im))
                                      c-im)
                          four)]
                [else i])))

          (define lut-offset
            (unsafe-fx* iters 4))

          (unsafe-bytes-copy!
           dst
           (unsafe-fx+
            row-offset
            (unsafe-fx* px-x 4))
           lut
           lut-offset
           (unsafe-fx+ lut-offset 4))

          (col-loop (unsafe-fx+ px-x 1))))

      (row-loop (unsafe-fx+ px-y 1)))))
