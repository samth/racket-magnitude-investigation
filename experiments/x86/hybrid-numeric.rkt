#lang racket/base
(require racket/unsafe/ops racket/math)

(define (ratio x y)
  (define r (unsafe-flabs x))
  (define i (unsafe-flabs y))
  (cond
    [(unsafe-fl= i 0.0) r]
    [(or (unsafe-fl= r +inf.0) (unsafe-fl= i +inf.0)) +inf.0]
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
  (cond
    [(or (unsafe-fl= r +inf.0) (unsafe-fl= i +inf.0)) +inf.0]
    [(and (unsafe-fl>= larger 1e-150) (unsafe-fl<= larger 1e150))
     (unsafe-flsqrt (unsafe-fl+ (unsafe-fl* r r) (unsafe-fl* i i)))]
    [else (ratio x y)]))

(define (as-bits x)
  (integer-bytes->integer (real->floating-point-bytes x 8 #f) #f #f))

(define samples (call-with-input-file "magnitude-samples.rktd" read))
(define unequal-ratio 0)
(define unequal-hybrid 0)
(define max-ulp-ratio 0)
(define max-ulp-hybrid 0)
(define first-hybrid #f)

(define (check x y)
  (define z (make-rectangular x y))
  (define n (magnitude z))
  (define r (ratio x y))
  (define h (hybrid x y))
  (when (and (flonum? n) (flonum? r) (not (nan? n)) (not (nan? r)))
    (define d (abs (- (as-bits n) (as-bits r))))
    (when (positive? d) (set! unequal-ratio (add1 unequal-ratio)))
    (set! max-ulp-ratio (max max-ulp-ratio d)))
  (when (and (flonum? n) (flonum? h) (not (nan? n)) (not (nan? h)))
    (define d (abs (- (as-bits n) (as-bits h))))
    (when (positive? d)
      (set! unequal-hybrid (add1 unequal-hybrid))
      (unless first-hybrid (set! first-hybrid (list x y n h d))))
    (set! max-ulp-hybrid (max max-ulp-hybrid d))))

(for ([z (in-vector samples)])
  (check (real-part z) (imag-part z)))
(printf "orbit samples=~a ratio differs=~a maxULP=~a hybrid differs=~a maxULP=~a first=~a\n"
        (vector-length samples) unequal-ratio max-ulp-ratio
        unequal-hybrid max-ulp-hybrid first-hybrid)

(for ([pair (list (cons 3e200 4e200)
                  (cons 3e-200 4e-200)
                  (cons 1e308 1e308)
                  (cons 5e-324 5e-324)
                  (cons +inf.0 +nan.0)
                  (cons +nan.0 1.0)
                  (cons 0.0 -0.0)
                  (cons 1e150 1e150)
                  (cons 1e-150 1e-150))])
  (define x (car pair))
  (define y (cdr pair))
  (printf "case (~a,~a) native=~a ratio=~a hybrid=~a\n"
          x y (magnitude (make-rectangular x y)) (ratio x y) (hybrid x y)))
