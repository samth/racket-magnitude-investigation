#lang racket/base

(require math/bigfloat math/flonum racket/unsafe/ops racket/runtime-path)

(define (ratio x y)
  (define r (unsafe-flabs x))
  (define i (unsafe-flabs y))
  (cond [(unsafe-fl= i 0.0) r]
        [(unsafe-fl< i r)
         (define q (unsafe-fl/ i r))
         (unsafe-fl* r (unsafe-flsqrt (unsafe-fl+ 1.0 (unsafe-fl* q q))))]
        [else
         (define q (unsafe-fl/ r i))
         (unsafe-fl* i (unsafe-flsqrt (unsafe-fl+ 1.0 (unsafe-fl* q q))))]))

(define (hybrid x y)
  (define r (unsafe-flabs x))
  (define i (unsafe-flabs y))
  (define larger (if (unsafe-fl< r i) i r))
  (if (and (unsafe-fl>= larger 1e-150) (unsafe-fl<= larger 1e150))
      (unsafe-flsqrt (unsafe-fl+ (unsafe-fl* r r) (unsafe-fl* i i)))
      (ratio x y)))

(define (native x y)
  (magnitude (make-rectangular x y)))

(define (as-bits x)
  (integer-bytes->integer (real->floating-point-bytes x 8 #f) #f #f))

(define implementations
  (list (cons 'runtime-hypot native)
        (cons 'math/flonum-flhypot flhypot)
        (cons 'optimizer-ratio ratio)
        (cons 'optimizer-hybrid hybrid)))

(define (measure group pairs)
  (define stats (for/list ([entry (in-list implementations)])
                  (cons (car entry) (make-vector 6 0))))
  (parameterize ([bf-precision 256])
    (for ([pair (in-list pairs)])
      (define x (car pair))
      (define y (cdr pair))
      (define ideal
        (bigfloat->flonum
         (bfhypot (flonum->bigfloat x) (flonum->bigfloat y))))
      (for ([entry (in-list implementations)]
            [stat (in-list stats)])
        (define got ((cdr entry) x y))
        (define ulp (abs (- (as-bits got) (as-bits ideal))))
        (define v (cdr stat))
        (vector-set! v 0 (add1 (vector-ref v 0)))
        (vector-set! v 1 (+ ulp (vector-ref v 1)))
        (vector-set! v 2 (max ulp (vector-ref v 2)))
        (vector-set! v (+ 3 (min ulp 2))
                     (add1 (vector-ref v (+ 3 (min ulp 2)))))))
    )
  (printf "~a\n" group)
  (for ([stat (in-list stats)])
    (define v (cdr stat))
    (printf "  ~a: n=~a exact=~a 1-ulp=~a >=2-ulp=~a avg-ulp=~a max-ulp=~a\n"
            (car stat) (vector-ref v 0) (vector-ref v 3)
            (vector-ref v 4) (vector-ref v 5)
            (exact->inexact (/ (vector-ref v 1) (vector-ref v 0)))
            (vector-ref v 2))))

(define-runtime-path samples-path "../x86/magnitude-samples.rktd")
(define samples
  (call-with-input-file samples-path read))

(measure 'mandelbrot-orbit
         (for/list ([z (in-vector samples)])
           (cons (real-part z) (imag-part z))))

(random-seed 15483)
(define (random-scaled exponent)
  (* (+ 1.0 (/ (random 1000000) 1000000.0))
     (expt 2.0 exponent)))
(define (make-stress low high)
  (for/list ([j (in-range 8192)])
    (define e (+ low (random (- high low))))
    (define delta (- (random 51) 25))
    (cons (random-scaled e) (random-scaled (+ e delta)))))

(measure 'large-finite (make-stress 700 950))
(measure 'small-finite (make-stress -950 -700))
