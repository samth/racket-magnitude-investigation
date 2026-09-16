(module typed-opt-cross-add-unsafe-i typed/racket
  (#%module-begin
   (module configure-runtime '#%kernel
     (#%module-begin (#%require racket/runtime-config) (#%app configure '#f)))
   (begin-for-syntax
    (module*
     #%type-decl
     #f
     (#%plain-module-begin
      (#%declare #:empty-namespace)
      (#%require typed-racket/types/numeric-tower)
      (#%require typed-racket/env/type-name-env)
      (#%require typed-racket/env/global-env)
      (#%require typed-racket/env/type-alias-env)
      (#%require typed-racket/types/struct-table)
      (#%require typed-racket/types/abbrev)
      (#%require typed-racket/env/struct-name-env)
      (#%require
       (all-except racket/private/sort sort)
       (rename racket/private/sort raw-sort sort))
      (#%app
       register-type
       (t-quote-syntax mandelbrot)
       (#%app
        make-Fun
        (#%app
         list
         (#%app
          make-Arrow
          (#%app list)
          '#f
          (#%app
           list
           (#%app make-Keyword '#:corner -Number '#t)
           (#%app make-Keyword '#:dst -Bytes '#t)
           (#%app make-Keyword '#:dst_offset -NonNegFixnum '#t)
           (#%app make-Keyword '#:dst_row_stride -NonNegFixnum '#t)
           (#%app make-Keyword '#:height -PosFixnum '#t)
           (#%app make-Keyword '#:lut -Bytes '#t)
           (#%app make-Keyword '#:max_iter -PosFixnum '#t)
           (#%app make-Keyword '#:scale -Real '#t)
           (#%app make-Keyword '#:width -PosFixnum '#t))
          (#%app make-Values (#%app list (#%app -result -Void)))
          '#t)))))))
   (begin-for-syntax
    (#%app
     add-mod!
     (#%app variable-reference->module-path-index (#%variable-reference))))
   (define-values
    (blame19)
    (#%app
     module-name-fixup
     (#%app variable-reference->module-source/submod (#%variable-reference))
     (#%app list)))
   (begin-for-syntax
    (#%require typed-racket/utils/redirect-contract)
    (module #%contract-defs-reference racket/base
      (#%module-begin
       (module configure-runtime '#%kernel
         (#%module-begin
          (#%require racket/runtime-config)
          (#%app configure '#f)))
       (#%require racket/runtime-path)
       (#%require (for-meta 1 racket/base))
       (define-values
        (contract-defs-submod)
        (let-values (((contract-defs-submod)
                      (let-values (((runtime?) '#t))
                        (#%app
                         list
                         'module
                         '(submod ".." #%contract-defs)
                         (#%variable-reference)))))
          (let-values (((get-dir) void))
            (#%app
             apply
             values
             (#%app
              resolve-paths
              (#%variable-reference)
              get-dir
              (#%app list contract-defs-submod))))))
       (begin-for-syntax
        (#%app
         register-ext-files
         (#%variable-reference)
         (let-values (((contract-defs-submod)
                       (let-values (((runtime?) '#f))
                         (#%app
                          list
                          'module
                          '(submod ".." #%contract-defs)
                          (#%variable-reference)))))
           (#%app list contract-defs-submod))))
       (#%provide contract-defs-submod)))
    (#%require (submod "." #%contract-defs-reference))
    (define-values
     (make-redirect20)
     (#%app make-make-redirect-to-contract contract-defs-submod)))
   (module*
    #%contract-defs
    #f
    (#%plain-module-begin
     (#%declare #:empty-namespace)
     (#%require (submod typed-racket/private/type-contract predicates))
     (#%require typed-racket/utils/utils)
     (#%require (for-meta 1 typed-racket/utils/utils))
     (#%require typed-racket/utils/any-wrap)
     (#%require typed-racket/utils/struct-type-c)
     (#%require typed-racket/utils/prefab-c)
     (#%require typed-racket/utils/opaque-object)
     (#%require typed-racket/utils/evt-contract)
     (#%require typed-racket/utils/hash-contract)
     (#%require typed-racket/utils/vector-contract)
     (#%require typed-racket/utils/sealing-contract)
     (#%require typed-racket/utils/promise-not-name-contract)
     (#%require typed-racket/utils/simple-result-arrow)
     (#%require typed-racket/utils/eq-contract)
     (#%require racket/sequence)
     (#%require racket/contract/parametric)
     (#%require typed-racket/utils/shallow-contract)
     (define-values (g26) (#%app real-and/c-name fixnum? nonnegative?))
     (define-values (g27) (#%app real-and/c-name fixnum? positive?))
     (define-values
      (lifted/26 lifted/27 lifted/28 lifted/29 lifted/30)
      (#%app
       make-struct-type
       '...row-higher-order.rkt:387:44
       struct:keyword-procedure/arity-error
       '0
       '0
       '#f
       (#%app
        list
        (#%app
         cons
         prop:named-keyword-procedure
         (#%app
          vector
          '...row-higher-order.rkt:387:44
          '#f
          (case-lambda ((self) (#%app apply missing-kw self null))))))
       (#%app current-inspector)
       (case-lambda ((self) (#%app apply missing-kw self null)))))
     (define-values
      (lifted/92 lifted/93 lifted/94 lifted/95 lifted/96)
      (#%app
       make-struct-type
       '...row-higher-order.rkt:392:52
       struct:keyword-procedure/arity-error
       '0
       '0
       '#f
       (#%app
        list
        (#%app
         cons
         prop:named-keyword-procedure
         (#%app
          vector
          '...row-higher-order.rkt:392:52
          '#f
          (case-lambda ((self) (#%app apply missing-kw self null))))))
       (#%app current-inspector)
       (case-lambda ((self) (#%app apply missing-kw self null)))))
     (define-values
      (generated-contract23)
      (let-values (((corner5) number?)
                   ((dst6) bytes?)
                   ((dst_offset7) g26)
                   ((dst_row_stride8) g26)
                   ((height9) g27)
                   ((lut10) bytes?)
                   ((max_iter11) g27)
                   ((scale12) real?)
                   ((width13) g27))
        (#%app
         build-->
         '->*
         (#%app list)
         (#%app list)
         '(#:corner
           #:dst
           #:dst_offset
           #:dst_row_stride
           #:height
           #:lut
           #:max_iter
           #:scale
           #:width)
         (#%app
          list
          corner5
          dst6
          dst_offset7
          dst_row_stride8
          height9
          lut10
          max_iter11
          scale12
          width13)
         '()
         (#%app list)
         '#f
         '#f
         '#f
         '#f
         '#f
         '#f
         (lambda (blame
                  f
                  neg-party
                  blame-party-info
                  is-impersonator?
                  rng-ctcs
                  mandatory-dom-proj14
                  mandatory-dom-proj15
                  mandatory-dom-proj16
                  mandatory-dom-proj17
                  mandatory-dom-proj18
                  mandatory-dom-proj19
                  mandatory-dom-proj20
                  mandatory-dom-proj21
                  mandatory-dom-proj22)
           (let-values (((blame+neg-party) (#%app cons blame neg-party)))
             (#%app
              arity-checking-wrapper
              f
              blame
              neg-party
              blame+neg-party
              void
              void
              '#t
              '#f
              '#f
              '#f
              (let-values (((...row-higher-order.rkt:387:44)
                            (lambda (corner38
                                     dst39
                                     dst_offset40
                                     dst_row_stride41
                                     height42
                                     lut43
                                     max_iter44
                                     scale45
                                     width46)
                              (let-values (((corner28) corner38))
                                (let-values (((dst29) dst39))
                                  (let-values (((dst_offset30) dst_offset40))
                                    (let-values (((dst_row_stride31)
                                                  dst_row_stride41))
                                      (let-values (((height32) height42))
                                        (let-values (((lut33) lut43))
                                          (let-values (((max_iter34)
                                                        max_iter44))
                                            (let-values (((scale35) scale45))
                                              (let-values (((width36) width46))
                                                (let-values ()
                                                  (with-continuation-mark
                                                   contract-continuation-mark-key
                                                   blame+neg-party
                                                   (let-values ()
                                                     (let-values ()
                                                       (let-values (((kwd-results)
                                                                     (#%app
                                                                      cons
                                                                      (#%app
                                                                       mandatory-dom-proj14
                                                                       corner28
                                                                       neg-party)
                                                                      (#%app
                                                                       cons
                                                                       (#%app
                                                                        mandatory-dom-proj15
                                                                        dst29
                                                                        neg-party)
                                                                       (#%app
                                                                        cons
                                                                        (#%app
                                                                         mandatory-dom-proj16
                                                                         dst_offset30
                                                                         neg-party)
                                                                        (#%app
                                                                         cons
                                                                         (#%app
                                                                          mandatory-dom-proj17
                                                                          dst_row_stride31
                                                                          neg-party)
                                                                         (#%app
                                                                          cons
                                                                          (#%app
                                                                           mandatory-dom-proj18
                                                                           height32
                                                                           neg-party)
                                                                          (#%app
                                                                           cons
                                                                           (#%app
                                                                            mandatory-dom-proj19
                                                                            lut33
                                                                            neg-party)
                                                                           (#%app
                                                                            cons
                                                                            (#%app
                                                                             mandatory-dom-proj20
                                                                             max_iter34
                                                                             neg-party)
                                                                            (#%app
                                                                             cons
                                                                             (#%app
                                                                              mandatory-dom-proj21
                                                                              scale35
                                                                              neg-party)
                                                                             (#%app
                                                                              cons
                                                                              (#%app
                                                                               mandatory-dom-proj22
                                                                               width36
                                                                               neg-party)
                                                                              null)))))))))))
                                                         (#%app
                                                          values
                                                          kwd-results))))))))))))))))))
                (let-values (((...row-higher-order.rkt:387:44)
                              (lambda (given-kws given-args)
                                (let-values (((corner38)
                                              (#%app car given-args))
                                             ((kws3696) (#%app cdr given-kws))
                                             ((kw-args3697)
                                              (#%app cdr given-args)))
                                  (let-values (((dst39)
                                                (#%app car kw-args3697))
                                               ((kws3698) (#%app cdr kws3696))
                                               ((kw-args3699)
                                                (#%app cdr kw-args3697)))
                                    (let-values (((dst_offset40)
                                                  (#%app car kw-args3699))
                                                 ((kws3700)
                                                  (#%app cdr kws3698))
                                                 ((kw-args3701)
                                                  (#%app cdr kw-args3699)))
                                      (let-values (((dst_row_stride41)
                                                    (#%app car kw-args3701))
                                                   ((kws3702)
                                                    (#%app cdr kws3700))
                                                   ((kw-args3703)
                                                    (#%app cdr kw-args3701)))
                                        (let-values (((height42)
                                                      (#%app car kw-args3703))
                                                     ((kws3704)
                                                      (#%app cdr kws3702))
                                                     ((kw-args3705)
                                                      (#%app cdr kw-args3703)))
                                          (let-values (((lut43)
                                                        (#%app
                                                         car
                                                         kw-args3705))
                                                       ((kws3706)
                                                        (#%app cdr kws3704))
                                                       ((kw-args3707)
                                                        (#%app
                                                         cdr
                                                         kw-args3705)))
                                            (let-values (((max_iter44)
                                                          (#%app
                                                           car
                                                           kw-args3707))
                                                         ((kws3708)
                                                          (#%app cdr kws3706))
                                                         ((kw-args3709)
                                                          (#%app
                                                           cdr
                                                           kw-args3707)))
                                              (let-values (((scale45)
                                                            (#%app
                                                             car
                                                             kw-args3709))
                                                           ((kws3710)
                                                            (#%app
                                                             cdr
                                                             kws3708))
                                                           ((kw-args3711)
                                                            (#%app
                                                             cdr
                                                             kw-args3709)))
                                                (let-values (((width46)
                                                              (#%app
                                                               car
                                                               kw-args3711)))
                                                  (#%app
                                                   ...row-higher-order.rkt:387:44
                                                   corner38
                                                   dst39
                                                   dst_offset40
                                                   dst_row_stride41
                                                   height42
                                                   lut43
                                                   max_iter44
                                                   scale45
                                                   width46)))))))))))))
                  (#%app
                   lifted/27
                   (lambda (given-kws given-argc)
                     (if (#%app = given-argc '2)
                       (let-values (((l23712) given-kws))
                         (if (#%app pair? l23712)
                           (if (#%app eq? (#%app car l23712) '#:corner)
                             (let-values (((l23713) (#%app cdr l23712)))
                               (if (#%app pair? l23713)
                                 (if (#%app eq? (#%app car l23713) '#:dst)
                                   (let-values (((l23714) (#%app cdr l23713)))
                                     (if (#%app pair? l23714)
                                       (if (#%app
                                            eq?
                                            (#%app car l23714)
                                            '#:dst_offset)
                                         (let-values (((l23715)
                                                       (#%app cdr l23714)))
                                           (if (#%app pair? l23715)
                                             (if (#%app
                                                  eq?
                                                  (#%app car l23715)
                                                  '#:dst_row_stride)
                                               (let-values (((l23716)
                                                             (#%app
                                                              cdr
                                                              l23715)))
                                                 (if (#%app pair? l23716)
                                                   (if (#%app
                                                        eq?
                                                        (#%app car l23716)
                                                        '#:height)
                                                     (let-values (((l23717)
                                                                   (#%app
                                                                    cdr
                                                                    l23716)))
                                                       (if (#%app pair? l23717)
                                                         (if (#%app
                                                              eq?
                                                              (#%app
                                                               car
                                                               l23717)
                                                              '#:lut)
                                                           (let-values (((l23718)
                                                                         (#%app
                                                                          cdr
                                                                          l23717)))
                                                             (if (#%app
                                                                  pair?
                                                                  l23718)
                                                               (if (#%app
                                                                    eq?
                                                                    (#%app
                                                                     car
                                                                     l23718)
                                                                    '#:max_iter)
                                                                 (let-values (((l23719)
                                                                               (#%app
                                                                                cdr
                                                                                l23718)))
                                                                   (if (#%app
                                                                        pair?
                                                                        l23719)
                                                                     (if (#%app
                                                                          eq?
                                                                          (#%app
                                                                           car
                                                                           l23719)
                                                                          '#:scale)
                                                                       (let-values (((l23720)
                                                                                     (#%app
                                                                                      cdr
                                                                                      l23719)))
                                                                         (if (#%app
                                                                              pair?
                                                                              l23720)
                                                                           (if (#%app
                                                                                eq?
                                                                                (#%app
                                                                                 car
                                                                                 l23720)
                                                                                '#:width)
                                                                             (#%app
                                                                              null?
                                                                              (#%app
                                                                               cdr
                                                                               l23720))
                                                                             '#f)
                                                                           '#f))
                                                                       '#f)
                                                                     '#f))
                                                                 '#f)
                                                               '#f))
                                                           '#f)
                                                         '#f))
                                                     '#f)
                                                   '#f))
                                               '#f)
                                             '#f))
                                         '#f)
                                       '#f))
                                   '#f)
                                 '#f))
                             '#f)
                           '#f))
                       '#f))
                   (case-lambda
                    ((given-kws given-args)
                     (#%app
                      ...row-higher-order.rkt:387:44
                      given-kws
                      given-args)))
                   '(#:corner
                     #:dst
                     #:dst_offset
                     #:dst_row_stride
                     #:height
                     #:lut
                     #:max_iter
                     #:scale
                     #:width)
                   '(#:corner
                     #:dst
                     #:dst_offset
                     #:dst_row_stride
                     #:height
                     #:lut
                     #:max_iter
                     #:scale
                     #:width))))
              (let-values (((...row-higher-order.rkt:392:52)
                            (lambda (corner56
                                     dst57
                                     dst_offset58
                                     dst_row_stride59
                                     height60
                                     lut61
                                     max_iter62
                                     scale63
                                     width64)
                              (let-values (((corner28) corner56))
                                (let-values (((dst29) dst57))
                                  (let-values (((dst_offset30) dst_offset58))
                                    (let-values (((dst_row_stride31)
                                                  dst_row_stride59))
                                      (let-values (((height32) height60))
                                        (let-values (((lut33) lut61))
                                          (let-values (((max_iter34)
                                                        max_iter62))
                                            (let-values (((scale35) scale63))
                                              (let-values (((width36) width64))
                                                (let-values ()
                                                  (with-continuation-mark
                                                   contract-continuation-mark-key
                                                   blame+neg-party
                                                   (let-values ()
                                                     (let-values ()
                                                       (let-values (((kwd-results)
                                                                     (#%app
                                                                      cons
                                                                      (#%app
                                                                       mandatory-dom-proj14
                                                                       corner28
                                                                       neg-party)
                                                                      (#%app
                                                                       cons
                                                                       (#%app
                                                                        mandatory-dom-proj15
                                                                        dst29
                                                                        neg-party)
                                                                       (#%app
                                                                        cons
                                                                        (#%app
                                                                         mandatory-dom-proj16
                                                                         dst_offset30
                                                                         neg-party)
                                                                        (#%app
                                                                         cons
                                                                         (#%app
                                                                          mandatory-dom-proj17
                                                                          dst_row_stride31
                                                                          neg-party)
                                                                         (#%app
                                                                          cons
                                                                          (#%app
                                                                           mandatory-dom-proj18
                                                                           height32
                                                                           neg-party)
                                                                          (#%app
                                                                           cons
                                                                           (#%app
                                                                            mandatory-dom-proj19
                                                                            lut33
                                                                            neg-party)
                                                                           (#%app
                                                                            cons
                                                                            (#%app
                                                                             mandatory-dom-proj20
                                                                             max_iter34
                                                                             neg-party)
                                                                            (#%app
                                                                             cons
                                                                             (#%app
                                                                              mandatory-dom-proj21
                                                                              scale35
                                                                              neg-party)
                                                                             (#%app
                                                                              cons
                                                                              (#%app
                                                                               mandatory-dom-proj22
                                                                               width36
                                                                               neg-party)
                                                                              null)))))))))))
                                                         (#%app
                                                          values
                                                          kwd-results))))))))))))))))))
                (let-values (((...row-higher-order.rkt:392:52)
                              (lambda (given-kws given-args)
                                (let-values (((corner56)
                                              (#%app car given-args))
                                             ((kws3721) (#%app cdr given-kws))
                                             ((kw-args3722)
                                              (#%app cdr given-args)))
                                  (let-values (((dst57)
                                                (#%app car kw-args3722))
                                               ((kws3723) (#%app cdr kws3721))
                                               ((kw-args3724)
                                                (#%app cdr kw-args3722)))
                                    (let-values (((dst_offset58)
                                                  (#%app car kw-args3724))
                                                 ((kws3725)
                                                  (#%app cdr kws3723))
                                                 ((kw-args3726)
                                                  (#%app cdr kw-args3724)))
                                      (let-values (((dst_row_stride59)
                                                    (#%app car kw-args3726))
                                                   ((kws3727)
                                                    (#%app cdr kws3725))
                                                   ((kw-args3728)
                                                    (#%app cdr kw-args3726)))
                                        (let-values (((height60)
                                                      (#%app car kw-args3728))
                                                     ((kws3729)
                                                      (#%app cdr kws3727))
                                                     ((kw-args3730)
                                                      (#%app cdr kw-args3728)))
                                          (let-values (((lut61)
                                                        (#%app
                                                         car
                                                         kw-args3730))
                                                       ((kws3731)
                                                        (#%app cdr kws3729))
                                                       ((kw-args3732)
                                                        (#%app
                                                         cdr
                                                         kw-args3730)))
                                            (let-values (((max_iter62)
                                                          (#%app
                                                           car
                                                           kw-args3732))
                                                         ((kws3733)
                                                          (#%app cdr kws3731))
                                                         ((kw-args3734)
                                                          (#%app
                                                           cdr
                                                           kw-args3732)))
                                              (let-values (((scale63)
                                                            (#%app
                                                             car
                                                             kw-args3734))
                                                           ((kws3735)
                                                            (#%app
                                                             cdr
                                                             kws3733))
                                                           ((kw-args3736)
                                                            (#%app
                                                             cdr
                                                             kw-args3734)))
                                                (let-values (((width64)
                                                              (#%app
                                                               car
                                                               kw-args3736)))
                                                  (#%app
                                                   ...row-higher-order.rkt:392:52
                                                   corner56
                                                   dst57
                                                   dst_offset58
                                                   dst_row_stride59
                                                   height60
                                                   lut61
                                                   max_iter62
                                                   scale63
                                                   width64)))))))))))))
                  (#%app
                   lifted/93
                   (lambda (given-kws given-argc)
                     (if (#%app = given-argc '2)
                       (let-values (((l23737) given-kws))
                         (if (#%app pair? l23737)
                           (if (#%app eq? (#%app car l23737) '#:corner)
                             (let-values (((l23738) (#%app cdr l23737)))
                               (if (#%app pair? l23738)
                                 (if (#%app eq? (#%app car l23738) '#:dst)
                                   (let-values (((l23739) (#%app cdr l23738)))
                                     (if (#%app pair? l23739)
                                       (if (#%app
                                            eq?
                                            (#%app car l23739)
                                            '#:dst_offset)
                                         (let-values (((l23740)
                                                       (#%app cdr l23739)))
                                           (if (#%app pair? l23740)
                                             (if (#%app
                                                  eq?
                                                  (#%app car l23740)
                                                  '#:dst_row_stride)
                                               (let-values (((l23741)
                                                             (#%app
                                                              cdr
                                                              l23740)))
                                                 (if (#%app pair? l23741)
                                                   (if (#%app
                                                        eq?
                                                        (#%app car l23741)
                                                        '#:height)
                                                     (let-values (((l23742)
                                                                   (#%app
                                                                    cdr
                                                                    l23741)))
                                                       (if (#%app pair? l23742)
                                                         (if (#%app
                                                              eq?
                                                              (#%app
                                                               car
                                                               l23742)
                                                              '#:lut)
                                                           (let-values (((l23743)
                                                                         (#%app
                                                                          cdr
                                                                          l23742)))
                                                             (if (#%app
                                                                  pair?
                                                                  l23743)
                                                               (if (#%app
                                                                    eq?
                                                                    (#%app
                                                                     car
                                                                     l23743)
                                                                    '#:max_iter)
                                                                 (let-values (((l23744)
                                                                               (#%app
                                                                                cdr
                                                                                l23743)))
                                                                   (if (#%app
                                                                        pair?
                                                                        l23744)
                                                                     (if (#%app
                                                                          eq?
                                                                          (#%app
                                                                           car
                                                                           l23744)
                                                                          '#:scale)
                                                                       (let-values (((l23745)
                                                                                     (#%app
                                                                                      cdr
                                                                                      l23744)))
                                                                         (if (#%app
                                                                              pair?
                                                                              l23745)
                                                                           (if (#%app
                                                                                eq?
                                                                                (#%app
                                                                                 car
                                                                                 l23745)
                                                                                '#:width)
                                                                             (#%app
                                                                              null?
                                                                              (#%app
                                                                               cdr
                                                                               l23745))
                                                                             '#f)
                                                                           '#f))
                                                                       '#f)
                                                                     '#f))
                                                                 '#f)
                                                               '#f))
                                                           '#f)
                                                         '#f))
                                                     '#f)
                                                   '#f))
                                               '#f)
                                             '#f))
                                         '#f)
                                       '#f))
                                   '#f)
                                 '#f))
                             '#f)
                           '#f))
                       '#f))
                   (case-lambda
                    ((given-kws given-args)
                     (#%app
                      ...row-higher-order.rkt:392:52
                      given-kws
                      given-args)))
                   '(#:corner
                     #:dst
                     #:dst_offset
                     #:dst_row_stride
                     #:height
                     #:lut
                     #:max_iter
                     #:scale
                     #:width)
                   '(#:corner
                     #:dst
                     #:dst_offset
                     #:dst_row_stride
                     #:height
                     #:lut
                     #:max_iter
                     #:scale
                     #:width))))
              '0
              '0
              '(#:corner
                #:dst
                #:dst_offset
                #:dst_row_stride
                #:height
                #:lut
                #:max_iter
                #:scale
                #:width)
              '()
              '#f
              is-impersonator?)))
         '#f
         '#f)))
     (define-values
      (id-contract3)
      (let-values (((mandelbrot)
                    (#%app
                     coerce-contract
                     'define-module-boundary-contract
                     generated-contract23)))
        mandelbrot))
     (define-syntaxes
      (mandelbrot)
      (#%app
       make-provide/contract-transformer
       (quote-syntax mandelbrot)
       (quote-syntax id-contract3)
       (quote-syntax mandelbrot)
       '#f
       '#f
       (quote-syntax id-partially-applied1)
       (quote-syntax id-blame4)))
     (#%provide mandelbrot)
     (define-values
      (id-partially-applied1 id-blame4)
      (#%app
       do-partial-app
       id-contract3
       mandelbrot
       'mandelbrot
       blame19
       (#%app
        vector
        '#<path:/home/samth/tmp/racket-magnitude-investigation/benchmarks/variants/typed-opt-cross-add-unsafe-i.rkt>
        '15
        '9
        '320
        '10)
       '#f
       '#f))))
   (#%require math/flonum)
   (#%require racket/fixnum)
   (#%require racket/unsafe/ops)
   (define-values
    (lifted/1 lifted/2 lifted/3 lifted/4 lifted/5)
    (#%app
     make-struct-type
     'mandelbrot
     struct:keyword-procedure/arity-error
     '0
     '0
     '#f
     (#%app
      list
      (#%app
       cons
       prop:named-keyword-procedure
       (#%app
        vector
        'mandelbrot
        '#f
        (case-lambda ((self) (#%app apply missing-kw self null))))))
     (#%app current-inspector)
     (case-lambda ((self) (#%app apply missing-kw self null)))))
   (define-values
    (mandelbrot)
    (let-values (((mandelbrot)
                  (lambda (corner5
                           dst7
                           dst_offset8
                           dst_row_stride9
                           height2
                           lut4
                           max_iter3
                           scale6
                           width1)
                    (let-values (((width) width1))
                      (let-values (((height) height2))
                        (let-values (((max-iter) max_iter3))
                          (let-values (((lut) lut4))
                            (let-values (((corner) corner5))
                              (let-values (((scale) scale6))
                                (let-values (((dst) dst7))
                                  (let-values (((dst-offset) dst_offset8))
                                    (let-values (((dst-row-stride)
                                                  dst_row_stride9))
                                      (let-values ()
                                        (let-values (((corner-rl)
                                                      (#%app
                                                       real->double-flonum
                                                       (#%app
                                                        real-part
                                                        corner))))
                                          (let-values (((corner-im)
                                                        (#%app
                                                         real->double-flonum
                                                         (#%app
                                                          imag-part
                                                          corner))))
                                            (let-values (((scale-fl)
                                                          (#%app
                                                           real->double-flonum
                                                           scale)))
                                              (#%app
                                               (letrec-values (((row-loop)
                                                                (lambda (px-y)
                                                                  (if (#%app
                                                                       unsafe-fx<
                                                                       px-y
                                                                       height)
                                                                    (let-values ()
                                                                      (let-values (((c-im)
                                                                                    (#%app
                                                                                     unsafe-fl-
                                                                                     corner-im
                                                                                     (#%app
                                                                                      unsafe-fl*
                                                                                      (#%app
                                                                                       ->fl
                                                                                       px-y)
                                                                                      scale-fl))))
                                                                        (let-values (((row-offset)
                                                                                      (#%app
                                                                                       fx+
                                                                                       dst-offset
                                                                                       (#%app
                                                                                        fx*
                                                                                        px-y
                                                                                        dst-row-stride))))
                                                                          (#%app
                                                                           (letrec-values (((col-loop)
                                                                                            (lambda (px-x)
                                                                                              (if (#%app
                                                                                                   unsafe-fx<
                                                                                                   px-x
                                                                                                   width)
                                                                                                (let-values ()
                                                                                                  (let-values (((c-rl)
                                                                                                                (#%app
                                                                                                                 unsafe-fl+
                                                                                                                 corner-rl
                                                                                                                 (#%app
                                                                                                                  unsafe-fl*
                                                                                                                  (#%app
                                                                                                                   ->fl
                                                                                                                   px-x)
                                                                                                                  scale-fl))))
                                                                                                    (letrec-values ((()
                                                                                                                     (begin
                                                                                                                       (quote-syntax
                                                                                                                        (:-internal
                                                                                                                         iters
                                                                                                                         Fixnum)
                                                                                                                        #:local)
                                                                                                                       (#%plain-app
                                                                                                                        values)))
                                                                                                                    ((iters)
                                                                                                                     (#%app
                                                                                                                      (letrec-values (((iterate)
                                                                                                                                       (lambda (i
                                                                                                                                                z-rl
                                                                                                                                                z-im)
                                                                                                                                         (let-values (((z-rl-2)
                                                                                                                                                       (#%app
                                                                                                                                                        unsafe-fl*
                                                                                                                                                        z-rl
                                                                                                                                                        z-rl)))
                                                                                                                                           (let-values (((z-im-2)
                                                                                                                                                         (#%app
                                                                                                                                                          unsafe-fl*
                                                                                                                                                          z-im
                                                                                                                                                          z-im)))
                                                                                                                                             (if (if (#%app
                                                                                                                                                      unsafe-fx<
                                                                                                                                                      i
                                                                                                                                                      max-iter)
                                                                                                                                                   (#%app
                                                                                                                                                    unsafe-fl<=
                                                                                                                                                    (#%app
                                                                                                                                                     unsafe-fl+
                                                                                                                                                     z-rl-2
                                                                                                                                                     z-im-2)
                                                                                                                                                    '4.0)
                                                                                                                                                   '#f)
                                                                                                                                               (let-values ()
                                                                                                                                                 (#%app
                                                                                                                                                  iterate
                                                                                                                                                  (#%app
                                                                                                                                                   unsafe-fx+
                                                                                                                                                   i
                                                                                                                                                   '1)
                                                                                                                                                  (#%app
                                                                                                                                                   unsafe-fl+
                                                                                                                                                   (#%app
                                                                                                                                                    unsafe-fl-
                                                                                                                                                    z-rl-2
                                                                                                                                                    z-im-2)
                                                                                                                                                   c-rl)
                                                                                                                                                  (#%app
                                                                                                                                                   unsafe-fl+
                                                                                                                                                   (let-values (((z-rl-im)
                                                                                                                                                                 (#%app
                                                                                                                                                                  unsafe-fl*
                                                                                                                                                                  z-rl
                                                                                                                                                                  z-im)))
                                                                                                                                                     (#%app
                                                                                                                                                      unsafe-fl+
                                                                                                                                                      z-rl-im
                                                                                                                                                      z-rl-im))
                                                                                                                                                   c-im)))
                                                                                                                                               (let-values ()
                                                                                                                                                 i)))))))
                                                                                                                        iterate)
                                                                                                                      '0
                                                                                                                      c-rl
                                                                                                                      c-im))
                                                                                                                    ((lut-offset)
                                                                                                                     (#%app
                                                                                                                      fx*
                                                                                                                      iters
                                                                                                                      '4)))
                                                                                                      (#%app
                                                                                                       bytes-copy!
                                                                                                       dst
                                                                                                       (#%app
                                                                                                        fx+
                                                                                                        row-offset
                                                                                                        (#%app
                                                                                                         fx*
                                                                                                         px-x
                                                                                                         '4))
                                                                                                       lut
                                                                                                       lut-offset
                                                                                                       (#%app
                                                                                                        fx+
                                                                                                        lut-offset
                                                                                                        '4))
                                                                                                      (#%app
                                                                                                       col-loop
                                                                                                       (#%app
                                                                                                        fx+
                                                                                                        px-x
                                                                                                        '1)))))
                                                                                                (#%app
                                                                                                 void)))))
                                                                             col-loop)
                                                                           '0)
                                                                          (#%app
                                                                           row-loop
                                                                           (#%app
                                                                            fx+
                                                                            px-y
                                                                            '1)))))
                                                                    (#%app
                                                                     void)))))
                                                 row-loop)
                                               '0)))))))))))))))))
      (let-values (((mandelbrot)
                    (lambda (given-kws given-args)
                      (let-values (((corner5) (#%app car given-args))
                                   ((kws1309) (#%app cdr given-kws))
                                   ((kw-args1310) (#%app cdr given-args)))
                        (let-values (((dst7) (#%app car kw-args1310))
                                     ((kws1311) (#%app cdr kws1309))
                                     ((kw-args1312) (#%app cdr kw-args1310)))
                          (let-values (((dst_offset8) (#%app car kw-args1312))
                                       ((kws1313) (#%app cdr kws1311))
                                       ((kw-args1314) (#%app cdr kw-args1312)))
                            (let-values (((dst_row_stride9)
                                          (#%app car kw-args1314))
                                         ((kws1315) (#%app cdr kws1313))
                                         ((kw-args1316)
                                          (#%app cdr kw-args1314)))
                              (let-values (((height2) (#%app car kw-args1316))
                                           ((kws1317) (#%app cdr kws1315))
                                           ((kw-args1318)
                                            (#%app cdr kw-args1316)))
                                (let-values (((lut4) (#%app car kw-args1318))
                                             ((kws1319) (#%app cdr kws1317))
                                             ((kw-args1320)
                                              (#%app cdr kw-args1318)))
                                  (let-values (((max_iter3)
                                                (#%app car kw-args1320))
                                               ((kws1321) (#%app cdr kws1319))
                                               ((kw-args1322)
                                                (#%app cdr kw-args1320)))
                                    (let-values (((scale6)
                                                  (#%app car kw-args1322))
                                                 ((kws1323)
                                                  (#%app cdr kws1321))
                                                 ((kw-args1324)
                                                  (#%app cdr kw-args1322)))
                                      (let-values (((width1)
                                                    (#%app car kw-args1324)))
                                        (#%app
                                         mandelbrot
                                         corner5
                                         dst7
                                         dst_offset8
                                         dst_row_stride9
                                         height2
                                         lut4
                                         max_iter3
                                         scale6
                                         width1)))))))))))))
        (#%app
         lifted/2
         (lambda (given-kws given-argc)
           (if (#%app = given-argc '2)
             (let-values (((l21325) given-kws))
               (if (#%app pair? l21325)
                 (if (#%app eq? (#%app car l21325) '#:corner)
                   (let-values (((l21326) (#%app cdr l21325)))
                     (if (#%app pair? l21326)
                       (if (#%app eq? (#%app car l21326) '#:dst)
                         (let-values (((l21327) (#%app cdr l21326)))
                           (if (#%app pair? l21327)
                             (if (#%app eq? (#%app car l21327) '#:dst_offset)
                               (let-values (((l21328) (#%app cdr l21327)))
                                 (if (#%app pair? l21328)
                                   (if (#%app
                                        eq?
                                        (#%app car l21328)
                                        '#:dst_row_stride)
                                     (let-values (((l21329)
                                                   (#%app cdr l21328)))
                                       (if (#%app pair? l21329)
                                         (if (#%app
                                              eq?
                                              (#%app car l21329)
                                              '#:height)
                                           (let-values (((l21330)
                                                         (#%app cdr l21329)))
                                             (if (#%app pair? l21330)
                                               (if (#%app
                                                    eq?
                                                    (#%app car l21330)
                                                    '#:lut)
                                                 (let-values (((l21331)
                                                               (#%app
                                                                cdr
                                                                l21330)))
                                                   (if (#%app pair? l21331)
                                                     (if (#%app
                                                          eq?
                                                          (#%app car l21331)
                                                          '#:max_iter)
                                                       (let-values (((l21332)
                                                                     (#%app
                                                                      cdr
                                                                      l21331)))
                                                         (if (#%app
                                                              pair?
                                                              l21332)
                                                           (if (#%app
                                                                eq?
                                                                (#%app
                                                                 car
                                                                 l21332)
                                                                '#:scale)
                                                             (let-values (((l21333)
                                                                           (#%app
                                                                            cdr
                                                                            l21332)))
                                                               (if (#%app
                                                                    pair?
                                                                    l21333)
                                                                 (if (#%app
                                                                      eq?
                                                                      (#%app
                                                                       car
                                                                       l21333)
                                                                      '#:width)
                                                                   (#%app
                                                                    null?
                                                                    (#%app
                                                                     cdr
                                                                     l21333))
                                                                   '#f)
                                                                 '#f))
                                                             '#f)
                                                           '#f))
                                                       '#f)
                                                     '#f))
                                                 '#f)
                                               '#f))
                                           '#f)
                                         '#f))
                                     '#f)
                                   '#f))
                               '#f)
                             '#f))
                         '#f)
                       '#f))
                   '#f)
                 '#f))
             '#f))
         (case-lambda
          ((given-kws given-args) (#%app mandelbrot given-kws given-args)))
         '(#:corner
           #:dst
           #:dst_offset
           #:dst_row_stride
           #:height
           #:lut
           #:max_iter
           #:scale
           #:width)
         '(#:corner
           #:dst
           #:dst_offset
           #:dst_row_stride
           #:height
           #:lut
           #:max_iter
           #:scale
           #:width)))))
   (module*
    main
    #f
    (#%module-begin
     (module configure-runtime '#%kernel
       (#%module-begin
        (#%require racket/runtime-config)
        (#%app configure '#f)))
     (begin-for-syntax
      (module*
       #%type-decl
       #f
       (#%plain-module-begin
        (#%declare #:empty-namespace)
        (#%require typed-racket/types/numeric-tower)
        (#%require typed-racket/env/type-name-env)
        (#%require typed-racket/env/global-env)
        (#%require typed-racket/env/type-alias-env)
        (#%require typed-racket/types/struct-table)
        (#%require typed-racket/types/abbrev)
        (#%require typed-racket/env/struct-name-env)
        (#%require
         (all-except racket/private/sort sort)
         (rename racket/private/sort raw-sort sort))
        (#%app
         register-type
         (t-quote-syntax run-benchmark2)
         (let-values (((procedure) simple->27)
                      ((temp1) (#%app list -String Univ))
                      ((-Void2) -Void)
                      ((temp3) '#f))
           (if (#%app
                variable-reference-constant?
                (#%variable-reference simple->27))
             (#%app simple-> temp3 temp1 -Void2)
             (#%app
              (#%app
               checked-procedure-check-and-extract
               struct:keyword-procedure
               procedure
               keyword-procedure-extract
               '(#:T+)
               '4)
              '(#:T+)
              (#%app list temp3)
              temp1
              -Void2)))))))
     (begin-for-syntax
      (#%app
       add-mod!
       (#%app variable-reference->module-path-index (#%variable-reference))))
     (define-values
      (blame3)
      (#%app
       module-name-fixup
       (#%app variable-reference->module-source/submod (#%variable-reference))
       (#%app list)))
     (begin-for-syntax
      (#%require typed-racket/utils/redirect-contract)
      (module #%contract-defs-reference racket/base
        (#%module-begin
         (module configure-runtime '#%kernel
           (#%module-begin
            (#%require racket/runtime-config)
            (#%app configure '#f)))
         (#%require racket/runtime-path)
         (#%require (for-meta 1 racket/base))
         (define-values
          (contract-defs-submod)
          (let-values (((contract-defs-submod)
                        (let-values (((runtime?) '#t))
                          (#%app
                           list
                           'module
                           '(submod ".." #%contract-defs)
                           (#%variable-reference)))))
            (let-values (((get-dir) void))
              (#%app
               apply
               values
               (#%app
                resolve-paths
                (#%variable-reference)
                get-dir
                (#%app list contract-defs-submod))))))
         (begin-for-syntax
          (#%app
           register-ext-files
           (#%variable-reference)
           (let-values (((contract-defs-submod)
                         (let-values (((runtime?) '#f))
                           (#%app
                            list
                            'module
                            '(submod ".." #%contract-defs)
                            (#%variable-reference)))))
             (#%app list contract-defs-submod))))
         (#%provide contract-defs-submod)))
      (#%require (submod "." #%contract-defs-reference))
      (define-values
       (make-redirect4)
       (#%app make-make-redirect-to-contract contract-defs-submod)))
     (module*
      #%contract-defs
      #f
      (#%plain-module-begin
       (#%declare #:empty-namespace)
       (#%require (submod typed-racket/private/type-contract predicates))
       (#%require typed-racket/utils/utils)
       (#%require (for-meta 1 typed-racket/utils/utils))
       (#%require typed-racket/utils/any-wrap)
       (#%require typed-racket/utils/struct-type-c)
       (#%require typed-racket/utils/prefab-c)
       (#%require typed-racket/utils/opaque-object)
       (#%require typed-racket/utils/evt-contract)
       (#%require typed-racket/utils/hash-contract)
       (#%require typed-racket/utils/vector-contract)
       (#%require typed-racket/utils/sealing-contract)
       (#%require typed-racket/utils/promise-not-name-contract)
       (#%require typed-racket/utils/simple-result-arrow)
       (#%require typed-racket/utils/eq-contract)
       (#%require racket/sequence)
       (#%require racket/contract/parametric)
       (#%require typed-racket/utils/shallow-contract)))
     (#%require typed/racket/unsafe)
     (#%require
      (just-meta
       0
       (just-space
        #f
        (rename "benchmark-main.rkt" run-benchmark1 run-benchmark)))
      (only "benchmark-main.rkt"))
     (define-values (run-benchmark2) run-benchmark1)
     (define-syntaxes
      (run-benchmark)
      (#%app
       make-rename-transformer
       (#%app
        syntax-property
        (#%app
         syntax-property
         (#%app
          syntax-property
          (quote-syntax run-benchmark2)
          'not-free-identifier=?
          '#t)
         'original-name
         (quote-syntax run-benchmark1))
        'not-provide-all-defined
        '#t)))
     (define-values
      ()
      (begin
        (quote-syntax
         (require/typed-internal run-benchmark2 (-> String Any Void))
         #:local)
        (#%plain-app values)))
     (#%app
      call-with-values
      (lambda ()
        (#%app run-benchmark2 '"typed-opt-cross-add-unsafe-i" mandelbrot))
      print-values)
     (#%provide)
     (#%app void)))
   (define-syntaxes
    (mandelbrot)
    (#%app make-redirect20 (quote-syntax mandelbrot)))
   (define-syntaxes
    (mandelbrot)
    (#%app
     make-typed-renaming
     (t-quote-syntax mandelbrot)
     (t-quote-syntax mandelbrot)
     (t-quote-syntax mandelbrot)
     (t-quote-syntax mandelbrot)))
   (#%provide mandelbrot)
   (#%provide)
   (#%app void)))
