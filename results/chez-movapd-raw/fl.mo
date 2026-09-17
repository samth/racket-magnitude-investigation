
Starting mat flonum->fixnum.
(error? (flonum->fixnum))
Ignoring error check at optimization level 3.
(error? (flonum->fixnum 3.3 4.4))
Ignoring error check at optimization level 3.
(error? (flonum->fixnum 3))
Ignoring error check at optimization level 3.
(error? (flonum->fixnum 'a))
Ignoring error check at optimization level 3.
(error?
  (flonum->fixnum (* (inexact (most-positive-fixnum)) 2.0)))
Ignoring error check at optimization level 3.
(error?
  (flonum->fixnum (* (inexact (most-negative-fixnum)) 2.0)))
Ignoring error check at optimization level 3.
(eq? (+ (ash (most-positive-fixnum) -1) 1)
     (flonum->fixnum
       (* (+ (ash (most-positive-fixnum) -1) 1) 1.0)))
(eq? (most-negative-fixnum)
     (flonum->fixnum (* (most-negative-fixnum) 1.0)))
(eq? (+ (ash (most-positive-fixnum) -1) 1)
     (flonum->fixnum
       (fl+ (* (+ (ash (most-positive-fixnum) -1) 1) 1.0) 0.5)))
(or (not (fixnum?
           (inexact->exact (exact->inexact (most-positive-fixnum)))))
    (eq? (most-positive-fixnum)
         (flonum->fixnum (fl+ (* (most-positive-fixnum) 1.0) 0.5))))
(eq? (most-negative-fixnum)
     (flonum->fixnum (fl- (* (most-negative-fixnum) 1.0) 0.5)))
(eq? (flonum->fixnum 0.0) 0)
(eq? (flonum->fixnum 1.0) 1)
(eq? (flonum->fixnum 4.5) 4)
(eq? (flonum->fixnum 4.3) 4)
(eq? (flonum->fixnum 4.0) 4)
(eq? (flonum->fixnum 3.6) 3)
(eq? (flonum->fixnum 3.5) 3)
(eq? (flonum->fixnum 3.4) 3)
(eq? (flonum->fixnum 3.0) 3)
(eq? (flonum->fixnum 2.6) 2)
(eq? (flonum->fixnum 1.0) 1)
(eq? (flonum->fixnum 0.5) 0)
(eq? (flonum->fixnum -0.5) 0)
(eq? (flonum->fixnum -1.0) -1)
(eq? (flonum->fixnum -2.6) -2)
(eq? (flonum->fixnum -3.0) -3)
(eq? (flonum->fixnum -3.4) -3)
(eq? (flonum->fixnum -3.5) -3)
(eq? (flonum->fixnum -3.6) -3)
(eq? (flonum->fixnum -4.0) -4)
(eq? (flonum->fixnum -4.3) -4)
(eq? (flonum->fixnum -4.5) -4)
(test-cp0-expansion
  eq?
  '(+ (ash (most-positive-fixnum) -1) 1)
  (flonum->fixnum
    (* (+ (ash (most-positive-fixnum) -1) 1) 1.0)))
(test-cp0-expansion
  eq?
  '(most-negative-fixnum)
  (flonum->fixnum (* (most-negative-fixnum) 1.0)))
(test-cp0-expansion eq? '(flonum->fixnum 0.0) 0)
(test-cp0-expansion eq? '(flonum->fixnum 1.0) 1)
(test-cp0-expansion eq? '(flonum->fixnum 4.5) 4)
(test-cp0-expansion eq? '(flonum->fixnum 4.3) 4)
(test-cp0-expansion eq? '(flonum->fixnum 4.0) 4)
(test-cp0-expansion eq? '(flonum->fixnum 3.6) 3)
(test-cp0-expansion eq? '(flonum->fixnum 3.5) 3)
(test-cp0-expansion eq? '(flonum->fixnum 3.4) 3)
(test-cp0-expansion eq? '(flonum->fixnum 3.0) 3)
(test-cp0-expansion eq? '(flonum->fixnum 2.6) 2)
(test-cp0-expansion eq? '(flonum->fixnum 1.0) 1)
(test-cp0-expansion eq? '(flonum->fixnum 0.5) 0)
(test-cp0-expansion eq? '(flonum->fixnum -0.5) 0)
(test-cp0-expansion eq? '(flonum->fixnum -1.0) -1)
(test-cp0-expansion eq? '(flonum->fixnum -2.6) -2)
(test-cp0-expansion eq? '(flonum->fixnum -3.0) -3)
(test-cp0-expansion eq? '(flonum->fixnum -3.4) -3)
(test-cp0-expansion eq? '(flonum->fixnum -3.5) -3)
(test-cp0-expansion eq? '(flonum->fixnum -3.6) -3)
(test-cp0-expansion eq? '(flonum->fixnum -4.0) -4)
(test-cp0-expansion eq? '(flonum->fixnum -4.3) -4)
(test-cp0-expansion eq? '(flonum->fixnum -4.5) -4)

Starting mat fixnum->flonum.
(error? (fixnum->flonum))
Ignoring error check at optimization level 3.
(error? (fixnum->flonum 3 4))
Ignoring error check at optimization level 3.
(error? (fixnum->flonum 3.4))
Ignoring error check at optimization level 3.
(error? (fixnum->flonum 'a))
Ignoring error check at optimization level 3.
(error? (fixnum->flonum (+ (most-positive-fixnum) 1)))
Ignoring error check at optimization level 3.
(= (fixnum->flonum (most-positive-fixnum))
   (* (most-positive-fixnum) 1.0))
(= (fixnum->flonum 0) 0.0)
(= (fixnum->flonum 1) 1.0)
(test-cp0-expansion
  =
  '(fixnum->flonum (most-positive-fixnum))
  (* (most-positive-fixnum) 1.0))
(test-cp0-expansion = '(fixnum->flonum 0) 0.0)
(test-cp0-expansion = '(fixnum->flonum 1) 1.0)
(test-cp0-expansion = '(fixnum->flonum -1) -1.0)
(test-cp0-expansion = '(fixnum->flonum -1) -1.0)

Starting mat fl=.
(not (fl= 3.0 4.0))
(not (fl= 4.0 3.0))
(fl= 4.1 4.1)
(not (fl= -4.1 4.1))
(not (fl= 4.1 -4.1))
(not (fl= -4.272 -3.272))
(not (fl= -3.01e-10 -1e-5))
(fl= -4e-4)
(fl= -4e-4 -4e-4)
(fl= -40000.0 -40000.0 -40000.0)
(error? (fl=))
Ignoring error check at optimization level 3.
(error? (fl= (list 'a)))
Ignoring error check at optimization level 3.
(error? (fl= 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl= 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl= 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl= 3.0 3.1 3))
Ignoring error check at optimization level 3.
(error? (fl= 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl= 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl= 3.0 4.0 (error #f "oops")))
(guard (c [#t #t]) (fl= 3.0 (error #f "oops") 4.0))
(guard (c [#t #t]) (fl= (error #f "oops") 3.0 4.0))
(guard (c [#t #t]) (not (fl= (error #f "oops"))))

Starting mat fl<.
(fl< 3.0 4.0)
(not (fl< 4.0 3.0))
(not (fl< 4.1 4.1))
(fl< -4.1 4.1)
(not (fl< 4.1 -4.1))
(fl< -4.272 -3.272)
(not (fl< -3.01e-10 -1e-5))
(fl< -4e-4)
(not (fl< -4e-4 -4e-4))
(not (fl< -4e-4 -4e-4 -4e-4))
(error? (fl<))
Ignoring error check at optimization level 3.
(error? (fl< (list 'a)))
Ignoring error check at optimization level 3.
(error? (fl< 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl< 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl< 3.0 3.1 3))
Ignoring error check at optimization level 3.
(error? (fl< 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl< 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl< 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl< 4.0 3.0 (error #f "oops")))
(guard (c [#t #t]) (fl< 4.0 (error #f "oops") 3.0))
(guard (c [#t #t]) (fl< (error #f "oops") 4.0 3.0))
(guard (c [#t #t]) (not (fl< (error #f "oops"))))

Starting mat fl>.
(not (fl> 3.0 4.0))
(fl> 4.0 3.0)
(not (fl> 4.1 4.1))
(not (fl> -4.1 4.1))
(fl> 4.1 -4.1)
(not (fl> -4.272 -3.272))
(fl> -3.01e-10 -1e-5)
(fl> -4e-4)
(not (fl> -4e-4 -4e-4))
(not (fl> -4e-4 -4e-4 -4e-4))
(error? (fl>))
Ignoring error check at optimization level 3.
(error? (fl> (list 'a)))
Ignoring error check at optimization level 3.
(error? (fl> 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl> 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl> 3.1 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl> 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl> 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl> 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl> 3.0 4.0 (error #f "oops")))
(guard (c [#t #t]) (fl> 3.0 (error #f "oops") 4.0))
(guard (c [#t #t]) (fl> (error #f "oops") 3.0 4.0))
(guard (c [#t #t]) (not (fl> (error #f "oops"))))

Starting mat fl<=.
(fl<= 3.0 4.0)
(not (fl<= 4.0 3.0))
(fl<= 4.1 4.1)
(fl<= -4.1 4.1)
(not (fl<= 4.1 -4.1))
(fl<= -4.272 -3.272)
(not (fl<= -3.01e-10 -1e-5))
(fl<= -4e-4)
(fl<= -4e-4 -4e-4)
(fl<= -4e-4 -4e-4 -4e-4)
(error? (fl<=))
Ignoring error check at optimization level 3.
(error? (fl<= (list 'a)))
Ignoring error check at optimization level 3.
(error? (fl<= 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl<= 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl<= 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl<= 3.1 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl<= 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl<= 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl<= 4.0 3.0 (error #f "oops")))
(guard (c [#t #t]) (fl<= 4.0 (error #f "oops") 3.0))
(guard (c [#t #t]) (fl<= (error #f "oops") 4.0 3.0))
(guard (c [#t #t]) (not (fl<= (error #f "oops"))))

Starting mat fl>=.
(not (fl>= 3.0 4.0))
(fl>= 4.0 3.0)
(fl>= 4.1 4.1)
(not (fl>= -4.1 4.1))
(fl>= 4.1 -4.1)
(not (fl>= -4.272 -3.272))
(fl>= -3.01e-10 -1e-5)
(fl>= -4e-4)
(fl>= -4e-4 -4e-4)
(fl>= -4e-4 -4e-4 -4e-4)
(error? (fl>=))
Ignoring error check at optimization level 3.
(error? (fl>= (list 'a)))
Ignoring error check at optimization level 3.
(error? (fl>= 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl>= 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl>= 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl>= 3.0 3.1 3))
Ignoring error check at optimization level 3.
(error? (fl>= 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl>= 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl>= 3.0 4.0 (error #f "oops")))
(guard (c [#t #t]) (fl>= 3.0 (error #f "oops") 4.0))
(guard (c [#t #t]) (fl>= (error #f "oops") 3.0 4.0))
(guard (c [#t #t]) (not (fl>= (error #f "oops"))))

Starting mat fl=?.
(not (fl=? 3.0 4.0))
(not (fl=? 4.0 3.0))
(fl=? 4.1 4.1)
(not (fl=? -4.1 4.1))
(not (fl=? 4.1 -4.1))
(not (fl=? -4.272 -3.272))
(not (fl=? -3.01e-10 -1e-5))
(fl=? -4e-4 -4e-4)
(fl=? -40000.0 -40000.0 -40000.0)
(error? (fl=?))
Ignoring error check at optimization level 3.
(error? (fl=? 3.4))
Ignoring error check at optimization level 3.
(error? (fl=? 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl=? 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl=? 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl=? 3.0 3.1 3))
Ignoring error check at optimization level 3.
(error? (fl=? 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl=? 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl=? 3.0 4.0 (error #f "oops")))
(guard (c [#t #t]) (fl=? 3.0 (error #f "oops") 4.0))
(guard (c [#t #t]) (fl=? (error #f "oops") 3.0 4.0))
(guard (c [#t #t]) (not (fl=? (error #f "oops"))))

Starting mat fl<?.
(fl<? 3.0 4.0)
(not (fl<? 4.0 3.0))
(not (fl<? 4.1 4.1))
(fl<? -4.1 4.1)
(not (fl<? 4.1 -4.1))
(fl<? -4.272 -3.272)
(not (fl<? -3.01e-10 -1e-5))
(not (fl<? -4e-4 -4e-4))
(not (fl<? -4e-4 -4e-4 -4e-4))
(error? (fl<?))
Ignoring error check at optimization level 3.
(error? (fl<? 3.4))
Ignoring error check at optimization level 3.
(error? (fl<? 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl<? 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl<? 3.0 3.1 3))
Ignoring error check at optimization level 3.
(error? (fl<? 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl<? 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl<? 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl<? 4.0 3.0 (error #f "oops")))
(guard (c [#t #t]) (fl<? 4.0 (error #f "oops") 3.0))
(guard (c [#t #t]) (fl<? (error #f "oops") 4.0 3.0))
(guard (c [#t #t]) (not (fl<? (error #f "oops"))))

Starting mat fl>?.
(not (fl>? 3.0 4.0))
(fl>? 4.0 3.0)
(not (fl>? 4.1 4.1))
(not (fl>? -4.1 4.1))
(fl>? 4.1 -4.1)
(not (fl>? -4.272 -3.272))
(fl>? -3.01e-10 -1e-5)
(not (fl>? -4e-4 -4e-4))
(not (fl>? -4e-4 -4e-4 -4e-4))
(error? (fl>?))
Ignoring error check at optimization level 3.
(error? (fl>? 3.4))
Ignoring error check at optimization level 3.
(error? (fl>? 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl>? 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl>? 3.1 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl>? 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl>? 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl>? 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl>? 3.0 4.0 (error #f "oops")))
(guard (c [#t #t]) (fl>? 3.0 (error #f "oops") 4.0))
(guard (c [#t #t]) (fl>? (error #f "oops") 3.0 4.0))
(guard (c [#t #t]) (not (fl>? (error #f "oops"))))

Starting mat fl<=?.
(fl<=? 3.0 4.0)
(not (fl<=? 4.0 3.0))
(fl<=? 4.1 4.1)
(fl<=? -4.1 4.1)
(not (fl<=? 4.1 -4.1))
(fl<=? -4.272 -3.272)
(not (fl<=? -3.01e-10 -1e-5))
(fl<=? -4e-4 -4e-4)
(fl<=? -4e-4 -4e-4 -4e-4)
(error? (fl<=?))
Ignoring error check at optimization level 3.
(error? (fl<=? 3.4))
Ignoring error check at optimization level 3.
(error? (fl<=? 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl<=? 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl<=? 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl<=? 3.1 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl<=? 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl<=? 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl<=? 4.0 3.0 (error #f "oops")))
(guard (c [#t #t]) (fl<=? 4.0 (error #f "oops") 3.0))
(guard (c [#t #t]) (fl<=? (error #f "oops") 4.0 3.0))
(guard (c [#t #t]) (not (fl<=? (error #f "oops"))))

Starting mat fl>=?.
(not (fl>=? 3.0 4.0))
(fl>=? 4.0 3.0)
(fl>=? 4.1 4.1)
(not (fl>=? -4.1 4.1))
(fl>=? 4.1 -4.1)
(not (fl>=? -4.272 -3.272))
(fl>=? -3.01e-10 -1e-5)
(fl>=? -4e-4 -4e-4)
(fl>=? -4e-4 -4e-4 -4e-4)
(error? (fl>=?))
Ignoring error check at optimization level 3.
(error? (fl>=? 3.4))
Ignoring error check at optimization level 3.
(error? (fl>=? 'a 3.1))
Ignoring error check at optimization level 3.
(error? (fl>=? 3.1 'a))
Ignoring error check at optimization level 3.
(error? (fl>=? 3.0 3.0 3))
Ignoring error check at optimization level 3.
(error? (fl>=? 3.0 3.1 3))
Ignoring error check at optimization level 3.
(error? (fl>=? 3.5 3.5 7/2 4.5))
Ignoring error check at optimization level 3.
(error? (fl>=? 3.5 4.5 7/2 3.5))
Ignoring error check at optimization level 3.
(guard (c [#t #t]) (fl>=? 3.0 4.0 (error #f "oops")))
(guard (c [#t #t]) (fl>=? 3.0 (error #f "oops") 4.0))
(guard (c [#t #t]) (fl>=? (error #f "oops") 3.0 4.0))
(guard (c [#t #t]) (not (fl>=? (error #f "oops"))))

Starting mat fl+.
(eqv? (fl+) 0.0)
(eqv? (fl+ -3.0) -3.0)
(eqv? (fl+ -3.0 4.0) 1.0)
(eqv?
  (fl+ (inexact 1/3) (inexact 1/3))
  (+ (inexact 1/3) (inexact 1/3)))
(eqv? (fl+ 3.25 4.375 5.625) (+ 3.25 4.375 5.625))
(error? (fl+ '(a . b)))
Ignoring error check at optimization level 3.
(error? (fl+ 2.0 1))
Ignoring error check at optimization level 3.
(error? (fl+ 1.0 -3.0 2/3))
Ignoring error check at optimization level 3.
(string=? (number->string (fl+)) "0.0")
(test-cp0-expansion eqv? '(fl+) 0.0)
(test-cp0-expansion eqv? '(fl+ -3.0) -3.0)
(test-cp0-expansion eqv? '(fl+ -3.0 4.0) 1.0)
(test-cp0-expansion
  eqv?
  '(fl+ (inexact 1/3) (inexact 1/3))
  (+ (inexact 1/3) (inexact 1/3)))
(test-cp0-expansion
  eqv?
  '(fl+ 3.25 4.375 5.625)
  (+ 3.25 4.375 5.625))

Starting mat fl-.
(error? (fl-))
Ignoring error check at optimization level 3.
(eqv? (fl- -3.0) 3.0)
(eqv? (fl- -3.0 4.0) -7.0)
(eqv?
  (fl- (inexact 1/3) (inexact 1/7))
  (- (inexact 1/3) (inexact 1/7)))
(eqv? (fl- 3.25 4.375 5.625) (- 3.25 4.375 5.625))
(error? (fl- '(a . b)))
Ignoring error check at optimization level 3.
(error? (fl- 2.0 1))
Ignoring error check at optimization level 3.
(error? (fl- 'a 'b))
Ignoring error check at optimization level 3.
(error? (fl- 'a 'b 'c))
Ignoring error check at optimization level 3.
(error? (fl- 1.0 -3.0 2/3))
Ignoring error check at optimization level 3.
(error? (fl- 1.0 'b 2.0))
Ignoring error check at optimization level 3.
(test-cp0-expansion eqv? '(fl- -3.0) 3.0)
(test-cp0-expansion eqv? '(fl- -3.0 4.0) -7.0)
(test-cp0-expansion
  eqv?
  '(fl- (inexact 1/3) (inexact 1/7))
  (- (inexact 1/3) (inexact 1/7)))
(test-cp0-expansion
  eqv?
  '(fl- 3.25 4.375 5.625)
  (- 3.25 4.375 5.625))

Starting mat fl*.
(eqv? (fl*) 1.0)
(eqv? (fl* -3.0) -3.0)
(eqv? (fl* -3.0 4.0) -12.0)
(eqv?
  (fl* (inexact 1/3) (inexact 1/3))
  (* (inexact 1/3) (inexact 1/3)))
(eqv? (fl* 3.25 4.375 5.625) (* 3.25 4.375 5.625))
(error? (fl* '(a . b)))
Ignoring error check at optimization level 3.
(error? (fl* 2.0 1))
Ignoring error check at optimization level 3.
(error? (fl* 1.0 -3.0 2/3))
Ignoring error check at optimization level 3.
(string=? (number->string (fl*)) "1.0")
(test-cp0-expansion eqv? '(fl*) 1.0)
(test-cp0-expansion eqv? '(fl* -3.0) -3.0)
(test-cp0-expansion eqv? '(fl* -3.0 4.0) -12.0)
(test-cp0-expansion
  eqv?
  '(fl* (inexact 1/3) (inexact 1/3))
  (* (inexact 1/3) (inexact 1/3)))
(test-cp0-expansion
  eqv?
  '(fl* 3.25 4.375 5.625)
  (* 3.25 4.375 5.625))

Starting mat fl/.
(error? (fl/))
Ignoring error check at optimization level 3.
(eqv? (fl/ -3.0) (/ -3.0))
(eqv? (fl/ -3.0 4.0) -0.75)
(eqv?
  (fl/ (inexact 1/3) (inexact 1/7))
  (/ (inexact 1/3) (inexact 1/7)))
(eqv? (fl/ 3.25 4.375 5.625) (/ 3.25 4.375 5.625))
(error? (fl/ '(a . b)))
Ignoring error check at optimization level 3.
(error? (fl/ 2.0 1))
Ignoring error check at optimization level 3.
(error? (fl/ 1.0 -3.0 2/3))
Ignoring error check at optimization level 3.
(test-cp0-expansion eqv? '(fl/ -3.0) (/ -3.0))
(test-cp0-expansion eqv? '(fl/ -3.0 4.0) -0.75)
(test-cp0-expansion
  eqv?
  '(fl/ (inexact 1/3) (inexact 1/7))
  (/ (inexact 1/3) (inexact 1/7)))
(test-cp0-expansion
  eqv?
  '(fl/ 3.25 4.375 5.625)
  (/ 3.25 4.375 5.625))

Starting mat flabs.
(error? (flabs))
Ignoring error check at optimization level 3.
(error? (flabs 1 2))
Ignoring error check at optimization level 3.
(error? (flabs 'a))
Ignoring error check at optimization level 3.
(error? (flabs 1))
Ignoring error check at optimization level 3.
(error? (flabs -3/4))
Ignoring error check at optimization level 3.
(error? (flabs 3+4i))
Ignoring error check at optimization level 3.
(error? (flabs 3.3+4.5i))
Ignoring error check at optimization level 3.
(fl~= (flabs 1.83) 1.83)
(fl~= (flabs -0.093) 0.093)
(== (flabs -0.0) 0.0)
(== (flabs 0.0) 0.0)
(== (flabs +inf.0) +inf.0)
(== (flabs -inf.0) +inf.0)
(== (flabs +nan.0) +nan.0)
(eqv? (flabs 0.0) 0.0)
(eqv? (flabs -1.0) 1.0)
(eqv? (flabs 1.0) 1.0)

Starting mat fllog.
(error? (fllog))
Ignoring error check at optimization level 3.
(error? (fllog 3))
Ignoring error check at optimization level 3.
(error? (fllog 'a))
Ignoring error check at optimization level 3.
(error? (fllog 0))
Ignoring error check at optimization level 3.
(fl~= (fllog 1.0) 0.0)
(fl~= (fllog (exp 7.0)) 7.0)
(fl~= (fllog (exp 10.2)) 10.2)
(fl~=
  (fllog 1e30)
  (inexact (log 1000000000000000000000000000000)))
(fl~= (/ (log (expt 10 500)) (fllog 10.0)) 500.0)
(fl~= (log 3/4) (fllog 0.75))
(fl~= (fllog 10.0 10.0) 1.0)
(fl~= (fllog 50.0 50.0) 1.0)
(fl~= (fllog 1000.0 10.0) 3.0)
(== (fllog +inf.0) +inf.0)
(== (fllog 0.0) -inf.0)
(== (fllog -inf.0) +nan.0)

Starting mat flexp.
(error? (flexp))
Ignoring error check at optimization level 3.
(error? (flexp 3.0 4.0))
Ignoring error check at optimization level 3.
(error? (flexp 'a))
Ignoring error check at optimization level 3.
(error? (flexp 3))
Ignoring error check at optimization level 3.
(fl= (flexp 0.0) 1.0)
(~= (* (flexp 1.0) (flexp 1.0)) (flexp 2.0))
(fl~= (/ (flexp 24.2) (flexp 2.0)) (flexp 22.2))
(== (flexp +inf.0) +inf.0)
(== (flexp -inf.0) 0.0)

Starting mat flsin.
(and (> pi 3.14159265) (< pi 3.14159266))
(error? (flsin))
Ignoring error check at optimization level 3.
(error? (flsin 3.0 4.0))
Ignoring error check at optimization level 3.
(error? (flsin 'a))
Ignoring error check at optimization level 3.
(error? (flsin 3))
Ignoring error check at optimization level 3.
(fl~= (flsin (/ pi 6)) 0.5)

Starting mat flcos.
(error? (flcos))
Ignoring error check at optimization level 3.
(error? (flcos 3.0 4.0))
Ignoring error check at optimization level 3.
(error? (flcos 'a))
Ignoring error check at optimization level 3.
(error? (flcos 3))
Ignoring error check at optimization level 3.
(fl~= (flcos (/ pi 3)) 0.5)
(let ([x 3.3])
  (let ([s (flsin x)] [c (flcos x)])
    (~= (+ (* s s) (* c c)) 1.0)))

Starting mat fltan.
(error? (fltan))
Ignoring error check at optimization level 3.
(error? (fltan 3.0 4.0))
Ignoring error check at optimization level 3.
(error? (fltan 'a))
Ignoring error check at optimization level 3.
(error? (fltan 3))
Ignoring error check at optimization level 3.
(fl~= (fltan (/ pi 4)) 1.0)
(let ([x 4.4]) (~= (fltan x) (/ (flsin x) (flcos x))))

Starting mat flasin.
(error? (flasin))
Ignoring error check at optimization level 3.
(error? (flasin 3.0 4.0))
Ignoring error check at optimization level 3.
(error? (flasin 'a))
Ignoring error check at optimization level 3.
(error? (flasin 3))
Ignoring error check at optimization level 3.
(fl~= (flasin 1.0) (/ pi 2))
(let ([x 1.0]) (fl~= (flasin (flsin x)) x))
(let ([x 0.5]) (fl~= (flasin (flsin x)) x))

Starting mat flacos.
(error? (flacos))
Ignoring error check at optimization level 3.
(error? (flacos 3.0 4.0))
Ignoring error check at optimization level 3.
(error? (flacos 'a))
Ignoring error check at optimization level 3.
(error? (flacos 3))
Ignoring error check at optimization level 3.
(fl~= (flacos 0.5) (/ pi 3))
(let ([x 0.5]) (fl~= (flacos (flcos x)) x))

Starting mat flatan.
(error? (flatan))
Ignoring error check at optimization level 3.
(error? (flatan 3.0 4.0 5.0))
Ignoring error check at optimization level 3.
(error? (flatan 'a))
Ignoring error check at optimization level 3.
(error? (flatan 'a 3.0))
Ignoring error check at optimization level 3.
(error? (flatan 3.0 'a))
Ignoring error check at optimization level 3.
(error? (flatan 3 4))
Ignoring error check at optimization level 3.
(error? (flatan 0+1i))
Ignoring error check at optimization level 3.
(error? (flatan 0-1i))
Ignoring error check at optimization level 3.
(fl~= (flatan 1.0) (/ pi 4))
(fl~= (flatan 2.0 2.0) (/ pi 4))
(let ([x 0.5]) (fl~= (flatan (fltan x)) x))
(fl~= (flatan 10.0 -10.0) (angle -10+10i))
(fl~= (flatan 10.0 -10.0) (angle -10.0+10.0i))
(fl~= (flatan 10.0 -10.0) (flatan 10.0 -10.0))
(== (flatan -inf.0) -1.5707963267948966)
(== (flatan +inf.0) 1.5707963267948966)

Starting mat flsqrt.
(error? (flsqrt))
Ignoring error check at optimization level 3.
(error? (flsqrt 3.0 4.0))
Ignoring error check at optimization level 3.
(error? (flsqrt 'a))
Ignoring error check at optimization level 3.
(error? (flsqrt 3))
Ignoring error check at optimization level 3.
(== (flsqrt -1.0) (nan))
(~= (flsqrt 9.0) 3.0)
(~= (flsqrt 0.25) 1/2)
(~= (* (flsqrt 189.0) (flsqrt 189.0)) 189.0)
(fl~= (* (flsqrt 2.0) (flsqrt 2.0)) 2.0)
(~= (flsqrt 1e38)
    (sqrt 100000000000000000000000000000000000000))
(== (flsqrt +inf.0) +inf.0)
(== (flsqrt -0.0) -0.0)

Starting mat flexpt.
(error? (flexpt))
Ignoring error check at optimization level 3.
(error? (flexpt 5.0))
Ignoring error check at optimization level 3.
(error? (flexpt 3.0 4.0 5.0))
Ignoring error check at optimization level 3.
(error? (flexpt 'a 3.0))
Ignoring error check at optimization level 3.
(error? (flexpt 3.0 'a))
Ignoring error check at optimization level 3.
(error? (flexpt 0.0 -1))
Ignoring error check at optimization level 3.
(error? (flexpt 0.0 0+1i))
Ignoring error check at optimization level 3.
(fl~= (flexpt 10.0 -20.0) 1e-20)
(eqv? (flexpt 2.0 10.0) 1024.0)
(eqv? (flexpt 0.0 0.0) 1.0)
(eqv? (flexpt 0.0 2.0) 0.0)
(eqv? (flexpt 100.0 0.0) 1.0)
(eqv? (flexpt 2.0 -10.0) 9.765625e-4)
(eqv? (flexpt -0.5 5.0) -0.03125)
(fl~= (flexpt 9.0 0.5) 3.0)
(fl~= (flexpt 3.0 3.0) 27.0)
(~= (flexpt -0.5 2.0) 0.25)
(~= (flexpt -0.5 -2.0) 4.0)
(~= (flexpt 3.0 2.5) (flsqrt (* 3.0 3.0 3.0 3.0 3.0)))
(fl= (flexpt 0.0 2.0) 0.0)
(fl= (flexpt 0.0 0.0) 1.0)
(fl= (flexpt 2.0 0.0) 1.0)
(fl~= (flexpt -0.6666666666666666 -3.0) -3.375)
(fl= (flexpt 10.0 -1000.0) 0.0)
(fl= (flexpt 0.1 1000.0) 0.0)
(~= (flexpt 11.0 0.5) (flsqrt 11.0))
(fl~= (flexpt 1.5e-20 0.5) (flsqrt 1.5e-20))
(equal?
  (let ([ls '(a b c)])
    (let ([n (flexpt
               (begin (set! ls (append ls ls)) 2.0)
               (begin (set! ls (reverse ls)) 3.0))])
      (cons n ls)))
  '(8.0 c b a c b a))

Starting mat fltruncate.
(error? (fltruncate))
Ignoring error check at optimization level 3.
(error? (fltruncate 2.0 3.0))
Ignoring error check at optimization level 3.
(error? (fltruncate 'a))
Ignoring error check at optimization level 3.
(error? (fltruncate 3))
Ignoring error check at optimization level 3.
(error? (fltruncate 2.0+1.0i))
Ignoring error check at optimization level 3.
(error? (fltruncate 2+1i))
Ignoring error check at optimization level 3.
(eqv? (fltruncate 19.0) 19.0)
(eqv? (fltruncate 0.6666666666666666) 0.0)
(fl~= (fltruncate -0.6666666666666666) 0.0)
(fl= (fltruncate 17.3) 17.0)
(eqv? (fltruncate -8.5) -8.0)
(fl= (fltruncate 2.5) 2.0)
(== (fltruncate +nan.0) +nan.0)

Starting mat flfloor.
(error? (flfloor))
Ignoring error check at optimization level 3.
(error? (flfloor 2.0 3.0))
Ignoring error check at optimization level 3.
(error? (flfloor 'a))
Ignoring error check at optimization level 3.
(error? (flfloor 3))
Ignoring error check at optimization level 3.
(error? (flfloor 2.0+1.0i))
Ignoring error check at optimization level 3.
(error? (flfloor 2+1i))
Ignoring error check at optimization level 3.
(eqv? (flfloor 19.0) 19.0)
(eqv? (flfloor 0.6666666666666666) 0.0)
(eqv? (flfloor -0.6666666666666666) -1.0)
(fl= (flfloor 17.3) 17.0)
(eqv? (flfloor -8.5) -9.0)
(fl= (flfloor 2.5) 2.0)
(== (flfloor +inf.0) +inf.0)

Starting mat flceiling.
(error? (flceiling))
Ignoring error check at optimization level 3.
(error? (flceiling 2.0 3.0))
Ignoring error check at optimization level 3.
(error? (flceiling 'a))
Ignoring error check at optimization level 3.
(error? (flceiling 3))
Ignoring error check at optimization level 3.
(error? (flceiling 2.0+1.0i))
Ignoring error check at optimization level 3.
(eqv? (flceiling 19.0) 19.0)
(eqv? (flceiling 0.6666666666666666) 1.0)
(fl~= (flceiling -0.6666666666666666) 0.0)
(fl= (flceiling 17.3) 18.0)
(eqv? (flceiling -8.5) -8.0)
(fl= (flceiling 2.5) 3.0)
(== (flceiling -inf.0) -inf.0)

Starting mat flround.
(error? (flround))
Ignoring error check at optimization level 3.
(error? (flround 2.0 3))
Ignoring error check at optimization level 3.
(error? (flround 'a))
Ignoring error check at optimization level 3.
(error? (flround 2.0+1.0i))
Ignoring error check at optimization level 3.
(error? (flround 2+1i))
Ignoring error check at optimization level 3.
(error? (flround 19))
Ignoring error check at optimization level 3.
(error? (flround 2/3))
Ignoring error check at optimization level 3.
(fl= (flround 17.3) 17.0)
(fl= (flround 2.5) 2.0)
(fl= (flround 0.5) 0.0)
(fl= (flround 0.5000000000000001) 1.0)
(eqv? (flround 0.0) 0.0)
(eqv? (flround -0.0) -0.0)
(eqv? (flround 0.5) 0.0)
(eqv? (flround -0.5) -0.0)
(fl= (flround -0.5000000000000001) -1.0)

Starting mat flsingle.
(error? (flsingle))
Ignoring error check at optimization level 3.
(error? (flsingle 2.0 3.0))
Ignoring error check at optimization level 3.
(error? (flsingle 'a))
Ignoring error check at optimization level 3.
(error? (flsingle 3))
Ignoring error check at optimization level 3.
(error? (flsingle 2.0+1.0i))
Ignoring error check at optimization level 3.
(error? (flsingle 2+1i))
Ignoring error check at optimization level 3.
(eqv? (flsingle 19.0) 19.0)
(eqv? (flsingle -19.0) -19.0)
(eqv? (flsingle +nan.0) +nan.0)
(eqv? (flsingle +inf.0) +inf.0)
(eqv? (flsingle -inf.0) -inf.0)
(fl~= (flsingle 1.25e38) 1.2500000360947476e38)
(fl~= (flsingle 1.25e-37) 1.2500000449239123e-37)
(fl~= (flsingle -1.25e38) -1.2500000360947476e38)
(fl~= (flsingle -1.25e-37) -1.2500000449239123e-37)
(eqv? (flsingle 1e100) +inf.0)
(eqv? (flsingle -1e100) -inf.0)
(eqv? (flsingle 1e-100) 0.0)
(eqv? (flsingle -1e-100) -0.0)

Starting mat flinteger?.
(error? (flinteger? 'a))
Ignoring error check at optimization level 3.
(error? (flinteger? "hi"))
Ignoring error check at optimization level 3.
(error? (flinteger? (cons 3 4)))
Ignoring error check at optimization level 3.
(error? (flinteger? 3.0+0.0i))
Ignoring error check at optimization level 3.
(error? (flinteger? 3.0+1.0i))
Ignoring error check at optimization level 3.
(flinteger? 3.0)
(flinteger? 2.3048230482304e13)
(not (flinteger? -0.75))
(flinteger? -1.0)
(flinteger? 0.0)
(flinteger? -12083.0)
(flinteger? 4.0)
(not (flinteger? 3.5))
(not (flinteger? 1.8e-10))
(flinteger? 1.8e10)
(flinteger? -300000.0)
(not (flinteger? -1231.2344))

Starting mat flnan?.
(error? (flnan? 3))
Ignoring error check at optimization level 3.
(error? (flnan? 3/4))
Ignoring error check at optimization level 3.
(error? (flnan? 'hi))
Ignoring error check at optimization level 3.
(flnan? (nan))
(not (flnan? 5.0))
(not (flnan? +inf.0))
(not (flnan? -inf.0))

Starting mat flfinite?.
(error? (flfinite? 3))
Ignoring error check at optimization level 3.
(error? (flfinite? 3/4))
Ignoring error check at optimization level 3.
(error? (flfinite? 'hi))
Ignoring error check at optimization level 3.
(not (flfinite? (nan)))
(flfinite? 5.0)
(not (flfinite? +inf.0))
(not (flfinite? -inf.0))
(not (flfinite? +inf.0))
(flfinite? 5.0)

Starting mat flinfinite?.
(error? (flinfinite? 3))
Ignoring error check at optimization level 3.
(error? (flinfinite? 3/4))
Ignoring error check at optimization level 3.
(error? (flinfinite? 'hi))
Ignoring error check at optimization level 3.
(not (flinfinite? (nan)))
(not (flinfinite? 5.0))
(flinfinite? +inf.0)
(flinfinite? -inf.0)
(not (flinfinite? 5.0))
(flinfinite? +inf.0)

Starting mat flzero?.
(error? (flzero?))
Ignoring error check at optimization level 3.
(error? (flzero? 0.0 1.0))
Ignoring error check at optimization level 3.
(error? (flzero? 'a))
Ignoring error check at optimization level 3.
(error? (flzero? 3))
Ignoring error check at optimization level 3.
(flzero? 0.0)
(flzero? 0.0)
(not (flzero? 234.0))
(not (flzero? 0.09999701973876834))
(not (flzero? 23.4))
(not (flzero? -1734234.0))
(not (flzero? -0.6666666666666666))
(not (flzero? -0.1))

Starting mat flpositive?.
(error? (flpositive?))
Ignoring error check at optimization level 3.
(error? (flpositive? 0.0 1.0))
Ignoring error check at optimization level 3.
(error? (flpositive? 'a))
Ignoring error check at optimization level 3.
(error? (flpositive? 3))
Ignoring error check at optimization level 3.
(error? (flpositive? 1.0+1.0i))
Ignoring error check at optimization level 3.
(error? (flpositive? 1+1i))
Ignoring error check at optimization level 3.
(not (flpositive? 0.0))
(not (flpositive? 0.0))
(flpositive? 234.0)
(flpositive? 0.09999701973876834)
(flpositive? 23.4)
(not (flpositive? -1734234.0))
(not (flpositive? -0.6666666666666666))
(not (flpositive? -0.1))

Starting mat flnegative?.
(error? (flnegative?))
Ignoring error check at optimization level 3.
(error? (flnegative? 0.0 1.0))
Ignoring error check at optimization level 3.
(error? (flnegative? 'a))
Ignoring error check at optimization level 3.
(error? (flnegative? 3))
Ignoring error check at optimization level 3.
(error? (flnegative? 1.0+1.0i))
Ignoring error check at optimization level 3.
(error? (flnegative? 1+1i))
Ignoring error check at optimization level 3.
(not (flnegative? 0.0))
(not (flnegative? 0.0))
(not (flnegative? 234.0))
(not (flnegative? 0.09999701973876834))
(not (flnegative? 23.4))
(flnegative? -1734234.0)
(flnegative? -0.6666666666666666)
(flnegative? -0.1)
(not (flnegative? -0.0))

Starting mat flnonpositive?.
(error? (flnonpositive?))
Ignoring error check at optimization level 3.
(error? (flnonpositive? 0.0 1.0))
Ignoring error check at optimization level 3.
(error? (flnonpositive? 'a))
Ignoring error check at optimization level 3.
(error? (flnonpositive? 3))
Ignoring error check at optimization level 3.
(error? (flnonpositive? 1.0+1.0i))
Ignoring error check at optimization level 3.
(error? (flnonpositive? 1+1i))
Ignoring error check at optimization level 3.
(flnonpositive? 0.0)
(flnonpositive? 0.0)
(not (flnonpositive? 234.0))
(not (flnonpositive? 0.09999701973876834))
(not (flnonpositive? 23.4))
(flnonpositive? -1734234.0)
(flnonpositive? -0.6666666666666666)
(flnonpositive? -0.1)

Starting mat flnonnegative?.
(error? (flnonnegative?))
Ignoring error check at optimization level 3.
(error? (flnonnegative? 0.0 1.0))
Ignoring error check at optimization level 3.
(error? (flnonnegative? 'a))
Ignoring error check at optimization level 3.
(error? (flnonnegative? 3))
Ignoring error check at optimization level 3.
(error? (flnonnegative? 1+1i))
Ignoring error check at optimization level 3.
(error? (flnonnegative? 1.0+1.0i))
Ignoring error check at optimization level 3.
(flnonnegative? 0.0)
(flnonnegative? 0.0)
(flnonnegative? 234.0)
(flnonnegative? 0.09999701973876834)
(flnonnegative? 23.4)
(not (flnonnegative? -1734234.0))
(not (flnonnegative? -0.6666666666666666))
(not (flnonnegative? -0.1))

Starting mat fleven?.
(error? (fleven?))
Ignoring error check at optimization level 3.
(error? (fleven? 0.0 1.0))
Ignoring error check at optimization level 3.
(error? (fleven? 'a))
Ignoring error check at optimization level 3.
(error? (fleven? 3))
Ignoring error check at optimization level 3.
(error? (fleven? 3.2))
Ignoring error check at optimization level 3.
(error? (fleven? 3.0+1.0i))
Ignoring error check at optimization level 3.
(error? (fleven? 1+1i))
Ignoring error check at optimization level 3.
(error? (fleven? +inf.0))
Ignoring error check at optimization level 3.
(error? (fleven? +nan.0))
Ignoring error check at optimization level 3.
(not (fleven? -3.0))
(fleven? 2.0)
(not (fleven? 1.208312083280477e15))
(fleven? 1.208312083280478e15)
(fleven? 4.0)
(not (fleven? 3.0))

Starting mat flodd?.
(error? (flodd?))
Ignoring error check at optimization level 3.
(error? (flodd? 0.0 1.0))
Ignoring error check at optimization level 3.
(error? (flodd? 'a))
Ignoring error check at optimization level 3.
(error? (flodd? 3))
Ignoring error check at optimization level 3.
(error? (flodd? 3.2))
Ignoring error check at optimization level 3.
(error? (flodd? 3.0+1.0i))
Ignoring error check at optimization level 3.
(error? (flodd? 3+1i))
Ignoring error check at optimization level 3.
(error? (flodd? +inf.0))
Ignoring error check at optimization level 3.
(error? (flodd? +nan.0))
Ignoring error check at optimization level 3.
(flodd? -3.0)
(not (flodd? 2.0))
(flodd? 1.208312083280477e15)
(not (flodd? 1.208312083280478e15))
(not (flodd? 4.0))
(flodd? 3.0)

Starting mat flmin.
(error? (flmin))
Ignoring error check at optimization level 3.
(error? (flmin 'a))
Ignoring error check at optimization level 3.
(error? (flmin 1.0 'a))
Ignoring error check at optimization level 3.
(error? (flmin 1.0 'a 2.0))
Ignoring error check at optimization level 3.
(error? (flmin 1.0 3 2.0))
Ignoring error check at optimization level 3.
(error? (flmin 1.0 2.0 3.0 'a))
Ignoring error check at optimization level 3.
(error? (flmin 1.0 2.0 3.0 0.0+1.0i))
Ignoring error check at optimization level 3.
(error? (flmin 1.0 2.0 3.0 0+1i))
Ignoring error check at optimization level 3.
(eqv? (flmin -17.0) -17.0)
(eqv? (flmin 3.0 -3.0) -3.0)
(eqv? (flmin 3.2 1.0) 1.0)
(fl= (flmin 3.2 1.0) 1.0)
(fl= (flmin 0.5 0.5) 0.5)
(fl= (flmin -0.5 0.5) -0.5)
(eqv? (flmin 3.0 5.0 1.0 4.0 6.0 2.0) 1.0)
(== (flmin 4.5 (nan)) (nan))
(== (flmin (nan) 4.5) (nan))
(== (flmin +inf.0 (nan)) (nan))
(== (flmin (nan) +inf.0) (nan))
(== (flmin -inf.0 (nan)) (nan))
(== (flmin (nan) -inf.0) (nan))
(== (flmin 3.0 4.5 (nan) 17.3 -1.5) (nan))
(fl= (flmin 3.0 4.5 +inf.0 17.3 -1.5) -1.5)
(fl= (flmin 3.0 4.5 -inf.0 17.3 -1.5) -inf.0)

Starting mat flmax.
(error? (flmax))
Ignoring error check at optimization level 3.
(error? (flmax 'a))
Ignoring error check at optimization level 3.
(error? (flmax 1.0 'a))
Ignoring error check at optimization level 3.
(error? (flmax 1.0 3))
Ignoring error check at optimization level 3.
(error? (flmax 1.0 'a 2.0))
Ignoring error check at optimization level 3.
(error? (flmax 1.0 2.0 3.0 'a))
Ignoring error check at optimization level 3.
(error? (flmax 1.0 2.0 3.0 0.0+1.0i))
Ignoring error check at optimization level 3.
(error? (flmax 1.0 2.0 3.0 0+1i))
Ignoring error check at optimization level 3.
(eqv? (flmax 1.0) 1.0)
(eqv? (flmax 3.0 -3.0) 3.0)
(fl= (flmax 3.2 1.0) 3.2)
(fl= (flmax 3.2 1.0) 3.2)
(fl= (flmax 0.5 0.5) 0.5)
(fl= (flmax 0.5 -0.5) 0.5)
(eqv? (flmax 3.0 5.0 1.0 4.0 6.0 2.0) 6.0)
(== (flmax 4.5 (nan)) (nan))
(== (flmax (nan) 4.5) (nan))
(== (flmax +inf.0 (nan)) (nan))
(== (flmax (nan) +inf.0) (nan))
(== (flmax -inf.0 (nan)) (nan))
(== (flmax (nan) -inf.0) (nan))
(== (flmax 3.0 4.5 (nan) 17.3 -1.5) (nan))
(fl= (flmax 3.0 4.5 +inf.0 17.3 -1.5) +inf.0)
(fl= (flmax 3.0 4.5 -inf.0 17.3 -1.5) 17.3)

Starting mat flnumerator.
(error? (flnumerator))
Ignoring error check at optimization level 3.
(error? (flnumerator 3.0 4.0))
Ignoring error check at optimization level 3.
(error? (flnumerator 'a))
Ignoring error check at optimization level 3.
(error? (flnumerator 3))
Ignoring error check at optimization level 3.
(error? (flnumerator 0+1i))
Ignoring error check at optimization level 3.
(error? (flnumerator 2.2+1.1i))
Ignoring error check at optimization level 3.
(eqv? (flnumerator 3.25) 13.0)
(eqv? (flnumerator 9.0) 9.0)
(fl~=
  (let ([n (flnumerator 0.6666666666666666)]
        [d (fldenominator 0.6666666666666666)])
    (/ n d))
  0.6666666666666666)
(fl~= (flnumerator -2.25) -9.0)
(== (flnumerator +nan.0) +nan.0)
(== (flnumerator +inf.0) +inf.0)
(== (flnumerator -inf.0) -inf.0)
(== (flnumerator 0.75) 3.0)

Starting mat fldenominator.
(error? (fldenominator))
Ignoring error check at optimization level 3.
(error? (fldenominator 3.0 4.0))
Ignoring error check at optimization level 3.
(error? (fldenominator 'a))
Ignoring error check at optimization level 3.
(error? (fldenominator 3))
Ignoring error check at optimization level 3.
(error? (fldenominator 0+1i))
Ignoring error check at optimization level 3.
(error? (fldenominator 2.2+1.1i))
Ignoring error check at optimization level 3.
(eqv? (fldenominator 3.25) 4.0)
(eqv? (fldenominator 9.0) 1.0)
(eqv? (fldenominator -2.25) 4.0)
(== (fldenominator +nan.0) +nan.0)
(== (fldenominator +inf.0) 1.0)
(== (fldenominator -inf.0) 1.0)
(== (fldenominator 0.75) 4.0)

Starting mat fldiv-and-mod.
(error? (fldiv-and-mod 17 3.0))
Ignoring error check at optimization level 3.
(error? (fldiv-and-mod 3.0 17))
Ignoring error check at optimization level 3.
(error? (fldiv-and-mod 'a 17.0))
Ignoring error check at optimization level 3.
(error? (fldiv-and-mod 17.0 '(a)))
Ignoring error check at optimization level 3.
(error? (fldiv 17 3.0))
Ignoring error check at optimization level 3.
(error? (fldiv 3.0 17))
Ignoring error check at optimization level 3.
(error? (fldiv 'a 17.0))
Ignoring error check at optimization level 3.
(error? (fldiv 17.0 '(a)))
Ignoring error check at optimization level 3.
(error? (flmod 17 3.0))
Ignoring error check at optimization level 3.
(error? (flmod 3.0 17))
Ignoring error check at optimization level 3.
(error? (flmod 'a 17.0))
Ignoring error check at optimization level 3.
(error? (flmod 17.0 '(a)))
Ignoring error check at optimization level 3.
(begin
  (define $d&m fldiv-and-mod)
  (define ($dmpair x y)
    (call-with-values (lambda () ($d&m x y)) cons))
  (define ($dmpairs x y)
    (list ($dmpair x y) ($dmpair (- x) y) ($dmpair x (- y))
      ($dmpair (- x) (- y)) ($dmpair y x) ($dmpair (- y) x)
      ($dmpair y (- x)) ($dmpair (- y) (- x))))
  (define ($dmequal? x y)
    (cond
      [(pair? x)
       (and (pair? y)
            ($dmequal? (car x) (car y))
            ($dmequal? (cdr x) (cdr y)))]
      [(number? x)
       (and (number? y)
            (if (inexact? x)
                (and (inexact? y) (== x y))
                (and (exact? y) (= x y))))]
      [else (eq? x y)]))
  #t)
($dmequal?
  ($dmpairs 0.0 3.5)
  '((0.0 . 0.0) (-0.0 . 0.0) (-0.0 . 0.0) (0.0 . 0.0) (+inf.0 . +nan.0)
     (-inf.0 . +nan.0) (-inf.0 . +nan.0) (+inf.0 . +nan.0)))
($dmequal?
  ($dmpairs 3.5 11.25)
  '((0.0 . 3.5) (-1.0 . 7.75) (-0.0 . 3.5) (1.0 . 7.75)
     (3.0 . 0.75) (-4.0 . 2.75) (-3.0 . 0.75) (4.0 . 2.75)))
(begin
  (set! $d&m (lambda (x y) (values (fldiv x y) (flmod x y))))
  #t)
($dmequal?
  ($dmpairs 0.0 3.5)
  '((0.0 . 0.0) (-0.0 . 0.0) (-0.0 . 0.0) (0.0 . 0.0) (+inf.0 . +nan.0)
     (-inf.0 . +nan.0) (-inf.0 . +nan.0) (+inf.0 . +nan.0)))
($dmequal?
  ($dmpairs 3.5 11.25)
  '((0.0 . 3.5) (-1.0 . 7.75) (-0.0 . 3.5) (1.0 . 7.75)
     (3.0 . 0.75) (-4.0 . 2.75) (-3.0 . 0.75) (4.0 . 2.75)))

Starting mat fldiv0-and-mod0.
(error? (fldiv0-and-mod0 17 3.0))
Ignoring error check at optimization level 3.
(error? (fldiv0-and-mod0 3.0 17))
Ignoring error check at optimization level 3.
(error? (fldiv0-and-mod0 'a 17.0))
Ignoring error check at optimization level 3.
(error? (fldiv0-and-mod0 17.0 '(a)))
Ignoring error check at optimization level 3.
(error? (fldiv0 17 3.0))
Ignoring error check at optimization level 3.
(error? (fldiv0 3.0 17))
Ignoring error check at optimization level 3.
(error? (fldiv0 'a 17.0))
Ignoring error check at optimization level 3.
(error? (fldiv0 17.0 '(a)))
Ignoring error check at optimization level 3.
(error? (flmod0 17 3.0))
Ignoring error check at optimization level 3.
(error? (flmod0 3.0 17))
Ignoring error check at optimization level 3.
(error? (flmod0 'a 17.0))
Ignoring error check at optimization level 3.
(error? (flmod0 17.0 '(a)))
Ignoring error check at optimization level 3.
(begin
  (define $d&m fldiv0-and-mod0)
  (define ($dmpair x y)
    (call-with-values (lambda () ($d&m x y)) cons))
  (define ($dmpairs x y)
    (list ($dmpair x y) ($dmpair (- x) y) ($dmpair x (- y))
      ($dmpair (- x) (- y)) ($dmpair y x) ($dmpair (- y) x)
      ($dmpair y (- x)) ($dmpair (- y) (- x))))
  #t)
($dmequal?
  ($dmpairs 0.0 3.5)
  '((0.0 . 0.0) (-0.0 . 0.0) (-0.0 . 0.0) (0.0 . 0.0) (+inf.0 . +nan.0)
     (-inf.0 . +nan.0) (-inf.0 . +nan.0) (+inf.0 . +nan.0)))
($dmequal?
  ($dmpairs 3.5 11.25)
  '((0.0 . 3.5) (0.0 . -3.5) (-0.0 . 3.5) (0.0 . -3.5)
     (3.0 . 0.75) (-3.0 . -0.75) (-3.0 . 0.75) (3.0 . -0.75)))
($dmequal?
  ($dmpairs 10.0 4.0)
  '((3.0 . -2.0) (-2.0 . -2.0) (-3.0 . -2.0) (2.0 . -2.0)
     (0.0 . 4.0) (0.0 . -4.0) (-0.0 . 4.0) (0.0 . -4.0)))
(begin
  (set! $d&m
    (lambda (x y) (values (fldiv0 x y) (flmod0 x y))))
  #t)
($dmequal?
  ($dmpairs 0.0 3.5)
  '((0.0 . 0.0) (-0.0 . 0.0) (-0.0 . 0.0) (0.0 . 0.0) (+inf.0 . +nan.0)
     (-inf.0 . +nan.0) (-inf.0 . +nan.0) (+inf.0 . +nan.0)))
($dmequal?
  ($dmpairs 3.5 11.25)
  '((0.0 . 3.5) (0.0 . -3.5) (-0.0 . 3.5) (0.0 . -3.5)
     (3.0 . 0.75) (-3.0 . -0.75) (-3.0 . 0.75) (3.0 . -0.75)))
($dmequal?
  ($dmpairs 10.0 4.0)
  '((3.0 . -2.0) (-2.0 . -2.0) (-3.0 . -2.0) (2.0 . -2.0)
     (0.0 . 4.0) (0.0 . -4.0) (-0.0 . 4.0) (0.0 . -4.0)))

Starting mat flbit-field.
(error? (flbit-field))
Ignoring error check at optimization level 3.
(error? (flbit-field 0.0))
Ignoring error check at optimization level 3.
(error? (flbit-field 0.0 1))
Ignoring error check at optimization level 3.
(error? (flbit-field 0 1 2))
Ignoring error check at optimization level 3.
(error? (flbit-field 0.0 -1 2))
Ignoring error check at optimization level 3.
(error? (flbit-field 0.0 2 1))
Ignoring error check at optimization level 3.
(error? (flbit-field 0.0 2 -1))
Ignoring error check at optimization level 3.
(error? (flbit-field 0.0 65 65))
Ignoring error check at optimization level 3.
(error? (flbit-field 0.0 32 65))
Ignoring error check at optimization level 3.
(error? (flbit-field 0.0 (expt 2 100) (add1 (expt 2 100))))
Ignoring error check at optimization level 3.
(error? (flbit-field 0.0 0 (expt 2 100)))
Ignoring error check at optimization level 3.
(let loop ([i 0])
  (or (= i 65)
      (and (eqv? 0 (flbit-field 3.14 i i)) (loop (add1 i)))))
(let loop ([i 0])
  (or (= i 64)
      (and (eqv? 0 (flbit-field 0.0 i (add1 i)))
           (loop (add1 i)))))
(let loop ([i 0])
  (if (= i 63)
      (eqv? 1 (flbit-field -0.0 i (add1 i)))
      (and (eqv? 0 (flbit-field -0.0 i (add1 i)))
           (loop (add1 i)))))
(let loop ([i 0])
  (or (= i 64)
      (and (eqv? 0 (flbit-field 0.0 0 (add1 i)))
           (loop (add1 i)))))
(eqv? (flbit-field 3.141579e132 0 64) 6589245870702747814)
(eqv? (flbit-field 3.141579e132 0 63) 6589245870702747814)
(eqv? (flbit-field 3.141579e132 1 64) 3294622935351373907)
(eqv? (flbit-field 3.141579e132 4 60) 51539896729282058)
(eqv? (flbit-field 3.141579e132 8 56) 125018801762912)
(eqv? (flbit-field 3.141579e132 32 64) 1534178357)
(eqv? (flbit-field 3.141579e132 0 32) 1156735142)
(eqv? (flbit-field 3.141579e132 16 48) 3023389938)
(let iloop ([i 0])
  (or (= i 64)
      (let jloop ([j i])
        (if (= j 64)
            (iloop (add1 i))
            (and (eqv?
                   (flbit-field 3.141579e132 i j)
                   (bitwise-bit-field 6589245870702747814 i j))
                 (jloop (add1 j)))))))
(let iloop ([i 0])
  (or (= i 64)
      (let jloop ([j i])
        (if (= j 64)
            (iloop (add1 i))
            (and (eqv?
                   ((eval `(lambda (x) (flbit-field x ,i ,j)))
                     3.141579e132)
                   (bitwise-bit-field 6589245870702747814 i j))
                 (jloop (add1 j)))))))

Starting mat fp-unboxing.
(begin
  (define-syntax check-loop-allocation
    (syntax-rules ()
      [(_ proc val-example)
       (or (eq? (current-eval) interpret)
           (#%$suppress-primitive-inlining)
           (let ([before (+ (bytes-allocated) (bytes-deallocated))]
                 [N 100000])
             (and (box?
                    (let loop ([i N] [bx (box val-example)])
                      (if (zero? i)
                          bx
                          (loop
                            (sub1 i)
                            (let ([v (unbox bx)]) (box (proc v)))))))
                  (let ([allocated (- (+ (bytes-allocated)
                                         (bytes-deallocated))
                                      before)]
                        [expected (* N
                                     (+ (compute-size val-example)
                                        (compute-size (box #f))))])
                    (printf "~s ~s\n" allocated expected)
                    (<= expected allocated (* 1.2 expected))))))]
      [(_ proc) (check-loop-allocation proc 1.0)]))
  #t)
(check-loop-allocation (lambda (v) (fl+ v v)))
(check-loop-allocation (lambda (v) (fl* v v)))
(check-loop-allocation (lambda (v) (fl- v 1.0)))
(check-loop-allocation (lambda (v) (fl/ v 2.0)))
(check-loop-allocation (lambda (v) (fl+ v 2.0 v)))
(check-loop-allocation (lambda (v) (fl+ v (fl* 2.0 v))))
(check-loop-allocation (lambda (v) (fl+ v v v)))
(check-loop-allocation
  (lambda (v) (fl+ v (fl* v v) (fl/ v 2.0))))
(check-loop-allocation (lambda (v) (flabs v)))
(check-loop-allocation (lambda (v) (fl- v)))
(check-loop-allocation (lambda (v) (flabs (fl+ v v))))
(check-loop-allocation (lambda (v) (fl- (fl+ v v))))
(check-loop-allocation (lambda (v) (flmin v 2.0)))
(check-loop-allocation (lambda (v) (flmin v v v)))
(check-loop-allocation (lambda (v) (flmax v 2.0)))
(check-loop-allocation (lambda (v) (flmax v v v v)))
(check-loop-allocation (lambda (v) (flround v)))
(check-loop-allocation (lambda (v) (fltruncate v)))
(check-loop-allocation (lambda (v) (flfloor v)))
(check-loop-allocation (lambda (v) (flceiling v)))
(check-loop-allocation (lambda (v) (flsqrt v)))
(check-loop-allocation (lambda (v) (flsin v)))
(check-loop-allocation (lambda (v) (flcos v)))
(check-loop-allocation (lambda (v) (fltan v)))
(check-loop-allocation (lambda (v) (flasin v)))
(check-loop-allocation (lambda (v) (flacos v)))
(check-loop-allocation (lambda (v) (flatan v)))
(check-loop-allocation (lambda (v) (flatan v v)))
(check-loop-allocation (lambda (v) (flexp v)))
(check-loop-allocation (lambda (v) (fllog v)))
(check-loop-allocation (lambda (v) (fllog v v)))
(check-loop-allocation (lambda (v) (flexpt v v)))
(check-loop-allocation
  (lambda (v) (exact->inexact (flbit-field v 1 23))))
(check-loop-allocation
  (lambda (v)
    (exact->inexact (flbit-field (fl+ v 2.0) 1 23))))
(check-loop-allocation
  (lambda (v) (exact->inexact (flbit-field v 40 63))))
(check-loop-allocation
  (lambda (v)
    (exact->inexact (flbit-field (fl+ v 2.0) 40 63))))
(let ([i 0])
  (check-loop-allocation
    (lambda (v)
      (begin (set! i (add1 i)) (fl+ v (fixnum->flonum i))))))
(let ([i 0])
  (check-loop-allocation
    (lambda (v)
      (begin (set! i (flonum->fixnum v)) (fl+ v 1.0)))))
(check-loop-allocation
  (lambda (v) (let ([u (fl+ v v)]) (fl* u u))))
(check-loop-allocation
  (lambda (v)
    (if (fl= (fl+ v (fl* 2.0 v)) 7.0) (fl+ v 1.0) (fl- v 1.0))))
(check-loop-allocation
  (lambda (v) (if (fl< (fl+ v v) v) (fl+ v 1.0) (fl- v 1.0))))
(check-loop-allocation
  (lambda (v) (if (fl> (fl+ v v) v) (fl+ v 1.0) (fl- v 1.0))))
(check-loop-allocation
  (lambda (v)
    (if (fl<= (fl+ v v) v) (fl+ v 1.0) (fl- v 1.0))))
(check-loop-allocation
  (lambda (v)
    (if (fl>= (fl+ v v) v) (fl+ v 1.0) (fl- v 1.0))))
(or (and (not (enable-cp0)) (not (= 3 (optimize-level))))
    (check-loop-allocation
      (lambda (v)
        (fl-make-rectangular
          (fl- (cfl-real-part v) 1.0)
          (fl+ 1.0 (cfl-imag-part v))))
      1.0-3.0i))
(check-loop-allocation
  (lambda (v)
    (let loop ([n 100] [v (fl+ v)])
      (if (fx= n 0) (fl+ v) (loop (fx- n 1) (fl+ v 1.0))))))
(let ([bv (make-bytevector 8 0)])
  (check-loop-allocation
    (lambda (v)
      (fl+ v (bytevector-ieee-double-native-ref bv 0)))))
(let ([bv (make-bytevector 8 0)])
  (check-loop-allocation
    (lambda (v)
      (begin
        (bytevector-ieee-double-native-set! bv 0 (fl+ v 0.1))
        (fl* v 0.99)))))
(let ([bv (make-bytevector 8 0)])
  (check-loop-allocation
    (lambda (v)
      (let ([v (fl+ v 1.0)])
        (bytevector-ieee-double-native-set! bv 0 v)
        (fl* v 0.99)))))
(let ([flv (make-flvector 8 0.0)])
  (check-loop-allocation
    (lambda (v) (fl+ v (flvector-ref flv 0)))))
(let ([flv (make-flvector 8 0.0)])
  (check-loop-allocation
    (lambda (v)
      (let ([v (fl+ v 1.0)])
        (flvector-set! flv 0 v)
        (fl* v 0.99)))))
(or (not (enable-cp0))
    (let ()
      (define-record pseudo-random-generator ((mutable double x10)
                                              (mutable double x11)
                                              (mutable double x12)
                                              (mutable double x20)
                                              (mutable double x21)
                                              (mutable double x22))
        ())
      (let ([s (make-pseudo-random-generator 1.0 2.0 3.0 4.0 5.0
                 6.0)])
        (check-loop-allocation
          (lambda (v)
            (let ([v (fl+ (pseudo-random-generator-x10 s) 1.0)])
              (set-pseudo-random-generator-x11! s v)
              (set-pseudo-random-generator-x12! s v)
              (pseudo-random-generator-x20 s)))))))
(let ()
  (define-ftype V2d (struct [x double] [y double]))
  (define v2d
    (make-ftype-pointer V2d (foreign-alloc (ftype-sizeof V2d))))
  (check-loop-allocation
    (lambda (v)
      (fl+ (ftype-ref V2d (x) v2d) (ftype-ref V2d (y) v2d)))))
(let ()
  (define-ftype V2d (struct [x double] [y double]))
  (define v2d
    (make-ftype-pointer V2d (foreign-alloc (ftype-sizeof V2d))))
  (check-loop-allocation
    (lambda (v)
      (ftype-set! V2d (x) v2d v)
      (ftype-set! V2d (y) v2d v)
      (fl- v))))
(let ()
  (define-ftype V2f (struct [x float] [y float]))
  (define v2f
    (make-ftype-pointer V2f (foreign-alloc (ftype-sizeof V2f))))
  (check-loop-allocation
    (lambda (v)
      (ftype-set! V2f (x) v2f v)
      (ftype-set! V2f (y) v2f v)
      (fl- v))))
(let ()
  (define-ftype V2f (struct [x float] [y float]))
  (define v2f
    (make-ftype-pointer V2f (foreign-alloc (ftype-sizeof V2f))))
  (check-loop-allocation
    (lambda (v)
      (fl+ (ftype-ref V2f (x) v2f) (ftype-ref V2f (y) v2f)))))
(or (not (enable-cp0))
    (let ([my-flsin (foreign-procedure __atomic "(cs)sin"
                      (double)
                      double)])
      (check-loop-allocation
        (lambda (v) (my-flsin (my-flsin v))))))
(begin
  (define many-compare
    (lambda (a b c d e f g h i j k)
      (fl<= a b c d e f g h i j k)))
  (many-compare 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0
    11.0))
(begin
  (define many-add
    (lambda (a b c d e f g h i j k)
      (fl+ a b c d e f g h i j k)))
  (fl= 66.0
       (many-add 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0)))
(eqv? (let ([x 4.0]) (fl+ x)) 4.0)
(eqv? (let ([x 4.0]) (fl+ (fl- x 1.0))) 3.0)
(eqv? (let ([x 5.0]) (fl* x)) 5.0)
Finished loading mat
