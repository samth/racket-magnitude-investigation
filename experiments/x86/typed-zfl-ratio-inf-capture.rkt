#lang typed/racket

(require math/flonum)

(require typed/racket/unsafe)
(unsafe-provide mandelbrot get-captured-iterate)
(define captured-iterate : Any #f)
(define (get-captured-iterate) captured-iterate)

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
    (define r (flabs (real-part z)))
    (define i (flabs (imag-part z)))
    (if (fl= i 0.0)
        r
        (if (or (fl= r +inf.0) (fl= i +inf.0))
            +inf.0
            (if (fl< i r)
                (let ([q (fl/ i r)])
                  (fl* r (flsqrt (fl+ 1.0 (fl* q q)))))
                (let ([q (fl/ r i)])
                  (fl* i (flsqrt (fl+ 1.0 (fl* q q)))))))) )

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

    (when (not captured-iterate) (set! captured-iterate iterate))
    (set-pixel! px-x px-y (iterate 0 c))))
