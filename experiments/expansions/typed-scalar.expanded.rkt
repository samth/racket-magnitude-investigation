(module typed-scalar typed/racket
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
           (#%app make-Keyword '#:dst_offset -Nat '#t)
           (#%app make-Keyword '#:dst_row_stride -Nat '#t)
           (#%app make-Keyword '#:height -PosInt '#t)
           (#%app make-Keyword '#:lut -Bytes '#t)
           (#%app make-Keyword '#:max_iter -PosInt '#t)
           (#%app make-Keyword '#:scale -Real '#t)
           (#%app make-Keyword '#:width -PosInt '#t))
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
     (define-values (g26) (#%app real-and/c-name exact-integer? positive?))
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
                   ((dst_offset7) exact-nonnegative-integer?)
                   ((dst_row_stride8) exact-nonnegative-integer?)
                   ((height9) g26)
                   ((lut10) bytes?)
                   ((max_iter11) g26)
                   ((scale12) real?)
                   ((width13) g26))
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
                                             ((kws3719) (#%app cdr given-kws))
                                             ((kw-args3720)
                                              (#%app cdr given-args)))
                                  (let-values (((dst39)
                                                (#%app car kw-args3720))
                                               ((kws3721) (#%app cdr kws3719))
                                               ((kw-args3722)
                                                (#%app cdr kw-args3720)))
                                    (let-values (((dst_offset40)
                                                  (#%app car kw-args3722))
                                                 ((kws3723)
                                                  (#%app cdr kws3721))
                                                 ((kw-args3724)
                                                  (#%app cdr kw-args3722)))
                                      (let-values (((dst_row_stride41)
                                                    (#%app car kw-args3724))
                                                   ((kws3725)
                                                    (#%app cdr kws3723))
                                                   ((kw-args3726)
                                                    (#%app cdr kw-args3724)))
                                        (let-values (((height42)
                                                      (#%app car kw-args3726))
                                                     ((kws3727)
                                                      (#%app cdr kws3725))
                                                     ((kw-args3728)
                                                      (#%app cdr kw-args3726)))
                                          (let-values (((lut43)
                                                        (#%app
                                                         car
                                                         kw-args3728))
                                                       ((kws3729)
                                                        (#%app cdr kws3727))
                                                       ((kw-args3730)
                                                        (#%app
                                                         cdr
                                                         kw-args3728)))
                                            (let-values (((max_iter44)
                                                          (#%app
                                                           car
                                                           kw-args3730))
                                                         ((kws3731)
                                                          (#%app cdr kws3729))
                                                         ((kw-args3732)
                                                          (#%app
                                                           cdr
                                                           kw-args3730)))
                                              (let-values (((scale45)
                                                            (#%app
                                                             car
                                                             kw-args3732))
                                                           ((kws3733)
                                                            (#%app
                                                             cdr
                                                             kws3731))
                                                           ((kw-args3734)
                                                            (#%app
                                                             cdr
                                                             kw-args3732)))
                                                (let-values (((width46)
                                                              (#%app
                                                               car
                                                               kw-args3734)))
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
                       (let-values (((l23735) given-kws))
                         (if (#%app pair? l23735)
                           (if (#%app eq? (#%app car l23735) '#:corner)
                             (let-values (((l23736) (#%app cdr l23735)))
                               (if (#%app pair? l23736)
                                 (if (#%app eq? (#%app car l23736) '#:dst)
                                   (let-values (((l23737) (#%app cdr l23736)))
                                     (if (#%app pair? l23737)
                                       (if (#%app
                                            eq?
                                            (#%app car l23737)
                                            '#:dst_offset)
                                         (let-values (((l23738)
                                                       (#%app cdr l23737)))
                                           (if (#%app pair? l23738)
                                             (if (#%app
                                                  eq?
                                                  (#%app car l23738)
                                                  '#:dst_row_stride)
                                               (let-values (((l23739)
                                                             (#%app
                                                              cdr
                                                              l23738)))
                                                 (if (#%app pair? l23739)
                                                   (if (#%app
                                                        eq?
                                                        (#%app car l23739)
                                                        '#:height)
                                                     (let-values (((l23740)
                                                                   (#%app
                                                                    cdr
                                                                    l23739)))
                                                       (if (#%app pair? l23740)
                                                         (if (#%app
                                                              eq?
                                                              (#%app
                                                               car
                                                               l23740)
                                                              '#:lut)
                                                           (let-values (((l23741)
                                                                         (#%app
                                                                          cdr
                                                                          l23740)))
                                                             (if (#%app
                                                                  pair?
                                                                  l23741)
                                                               (if (#%app
                                                                    eq?
                                                                    (#%app
                                                                     car
                                                                     l23741)
                                                                    '#:max_iter)
                                                                 (let-values (((l23742)
                                                                               (#%app
                                                                                cdr
                                                                                l23741)))
                                                                   (if (#%app
                                                                        pair?
                                                                        l23742)
                                                                     (if (#%app
                                                                          eq?
                                                                          (#%app
                                                                           car
                                                                           l23742)
                                                                          '#:scale)
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
                                                                                '#:width)
                                                                             (#%app
                                                                              null?
                                                                              (#%app
                                                                               cdr
                                                                               l23743))
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
                                             ((kws3744) (#%app cdr given-kws))
                                             ((kw-args3745)
                                              (#%app cdr given-args)))
                                  (let-values (((dst57)
                                                (#%app car kw-args3745))
                                               ((kws3746) (#%app cdr kws3744))
                                               ((kw-args3747)
                                                (#%app cdr kw-args3745)))
                                    (let-values (((dst_offset58)
                                                  (#%app car kw-args3747))
                                                 ((kws3748)
                                                  (#%app cdr kws3746))
                                                 ((kw-args3749)
                                                  (#%app cdr kw-args3747)))
                                      (let-values (((dst_row_stride59)
                                                    (#%app car kw-args3749))
                                                   ((kws3750)
                                                    (#%app cdr kws3748))
                                                   ((kw-args3751)
                                                    (#%app cdr kw-args3749)))
                                        (let-values (((height60)
                                                      (#%app car kw-args3751))
                                                     ((kws3752)
                                                      (#%app cdr kws3750))
                                                     ((kw-args3753)
                                                      (#%app cdr kw-args3751)))
                                          (let-values (((lut61)
                                                        (#%app
                                                         car
                                                         kw-args3753))
                                                       ((kws3754)
                                                        (#%app cdr kws3752))
                                                       ((kw-args3755)
                                                        (#%app
                                                         cdr
                                                         kw-args3753)))
                                            (let-values (((max_iter62)
                                                          (#%app
                                                           car
                                                           kw-args3755))
                                                         ((kws3756)
                                                          (#%app cdr kws3754))
                                                         ((kw-args3757)
                                                          (#%app
                                                           cdr
                                                           kw-args3755)))
                                              (let-values (((scale63)
                                                            (#%app
                                                             car
                                                             kw-args3757))
                                                           ((kws3758)
                                                            (#%app
                                                             cdr
                                                             kws3756))
                                                           ((kw-args3759)
                                                            (#%app
                                                             cdr
                                                             kw-args3757)))
                                                (let-values (((width64)
                                                              (#%app
                                                               car
                                                               kw-args3759)))
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
                       (let-values (((l23760) given-kws))
                         (if (#%app pair? l23760)
                           (if (#%app eq? (#%app car l23760) '#:corner)
                             (let-values (((l23761) (#%app cdr l23760)))
                               (if (#%app pair? l23761)
                                 (if (#%app eq? (#%app car l23761) '#:dst)
                                   (let-values (((l23762) (#%app cdr l23761)))
                                     (if (#%app pair? l23762)
                                       (if (#%app
                                            eq?
                                            (#%app car l23762)
                                            '#:dst_offset)
                                         (let-values (((l23763)
                                                       (#%app cdr l23762)))
                                           (if (#%app pair? l23763)
                                             (if (#%app
                                                  eq?
                                                  (#%app car l23763)
                                                  '#:dst_row_stride)
                                               (let-values (((l23764)
                                                             (#%app
                                                              cdr
                                                              l23763)))
                                                 (if (#%app pair? l23764)
                                                   (if (#%app
                                                        eq?
                                                        (#%app car l23764)
                                                        '#:height)
                                                     (let-values (((l23765)
                                                                   (#%app
                                                                    cdr
                                                                    l23764)))
                                                       (if (#%app pair? l23765)
                                                         (if (#%app
                                                              eq?
                                                              (#%app
                                                               car
                                                               l23765)
                                                              '#:lut)
                                                           (let-values (((l23766)
                                                                         (#%app
                                                                          cdr
                                                                          l23765)))
                                                             (if (#%app
                                                                  pair?
                                                                  l23766)
                                                               (if (#%app
                                                                    eq?
                                                                    (#%app
                                                                     car
                                                                     l23766)
                                                                    '#:max_iter)
                                                                 (let-values (((l23767)
                                                                               (#%app
                                                                                cdr
                                                                                l23766)))
                                                                   (if (#%app
                                                                        pair?
                                                                        l23767)
                                                                     (if (#%app
                                                                          eq?
                                                                          (#%app
                                                                           car
                                                                           l23767)
                                                                          '#:scale)
                                                                       (let-values (((l23768)
                                                                                     (#%app
                                                                                      cdr
                                                                                      l23767)))
                                                                         (if (#%app
                                                                              pair?
                                                                              l23768)
                                                                           (if (#%app
                                                                                eq?
                                                                                (#%app
                                                                                 car
                                                                                 l23768)
                                                                                '#:width)
                                                                             (#%app
                                                                              null?
                                                                              (#%app
                                                                               cdr
                                                                               l23768))
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
        '#<path:/home/samth/tmp/racket-magnitude-investigation/benchmarks/original/typed-scalar.rkt>
        '13
        '9
        '254
        '10)
       '#f
       '#f))))
   (#%require math/flonum)
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
                                        (let-values (((set-pixel!)
                                                      (lambda (x y iters)
                                                        (#%app
                                                         bytes-copy!
                                                         dst
                                                         (#%app
                                                          +
                                                          dst-offset
                                                          (#%app
                                                           *
                                                           y
                                                           dst-row-stride)
                                                          (#%app * x '4))
                                                         lut
                                                         (#%app * iters '4)
                                                         (#%app
                                                          +
                                                          (#%app * iters '4)
                                                          '4)))))
                                          (begin
                                            (let-values ()
                                              (let-values (((start) '0))
                                                (let-values (((end) height))
                                                  (let-values (((inc) '1))
                                                    (if (#%app
                                                         variable-reference-from-unsafe?
                                                         (#%variable-reference))
                                                      (#%app void)
                                                      (let-values ()
                                                        (#%app
                                                         check-range
                                                         start
                                                         end
                                                         inc)))
                                                    (#%app
                                                     (letrec-values (((for-loop)
                                                                      (lambda (pos)
                                                                        (if (#%app
                                                                             <
                                                                             pos
                                                                             end)
                                                                          (let-values (((px-y)
                                                                                        pos))
                                                                            (if (begin
                                                                                  '#t
                                                                                  '#t)
                                                                              (let-values ()
                                                                                (let-values ((()
                                                                                              (if (begin
                                                                                                    '#t
                                                                                                    '#t)
                                                                                                (let-values ((()
                                                                                                              (let-values ()
                                                                                                                (let-values ()
                                                                                                                  (begin
                                                                                                                    (let-values ()
                                                                                                                      (let-values (((start)
                                                                                                                                    '0))
                                                                                                                        (let-values (((end)
                                                                                                                                      width))
                                                                                                                          (let-values (((inc)
                                                                                                                                        '1))
                                                                                                                            (if (#%app
                                                                                                                                 variable-reference-from-unsafe?
                                                                                                                                 (#%variable-reference))
                                                                                                                              (#%app
                                                                                                                               void)
                                                                                                                              (let-values ()
                                                                                                                                (#%app
                                                                                                                                 check-range
                                                                                                                                 start
                                                                                                                                 end
                                                                                                                                 inc)))
                                                                                                                            (#%app
                                                                                                                             (letrec-values (((for-loop)
                                                                                                                                              (lambda (pos)
                                                                                                                                                (if (#%app
                                                                                                                                                     <
                                                                                                                                                     pos
                                                                                                                                                     end)
                                                                                                                                                  (let-values (((px-x)
                                                                                                                                                                pos))
                                                                                                                                                    (if (begin
                                                                                                                                                          '#t
                                                                                                                                                          '#t)
                                                                                                                                                      (let-values ()
                                                                                                                                                        (let-values ((()
                                                                                                                                                                      (if (begin
                                                                                                                                                                            '#t
                                                                                                                                                                            '#t)
                                                                                                                                                                        (let-values ((()
                                                                                                                                                                                      (let-values ()
                                                                                                                                                                                        (let-values ()
                                                                                                                                                                                          (begin
                                                                                                                                                                                            (let-values ()
                                                                                                                                                                                              (let-values ((()
                                                                                                                                                                                                            (let-values ()
                                                                                                                                                                                                              (let-values ()
                                                                                                                                                                                                                (let-values (((c-rl)
                                                                                                                                                                                                                              (#%app
                                                                                                                                                                                                                               unsafe-fl+
                                                                                                                                                                                                                               (#%app
                                                                                                                                                                                                                                real->double-flonum
                                                                                                                                                                                                                                (#%app
                                                                                                                                                                                                                                 real-part
                                                                                                                                                                                                                                 corner))
                                                                                                                                                                                                                               (#%app
                                                                                                                                                                                                                                unsafe-fl*
                                                                                                                                                                                                                                (#%app
                                                                                                                                                                                                                                 ->fl
                                                                                                                                                                                                                                 px-x)
                                                                                                                                                                                                                                (#%app
                                                                                                                                                                                                                                 real->double-flonum
                                                                                                                                                                                                                                 scale)))))
                                                                                                                                                                                                                  (let-values (((c-im)
                                                                                                                                                                                                                                (#%app
                                                                                                                                                                                                                                 unsafe-fl-
                                                                                                                                                                                                                                 (#%app
                                                                                                                                                                                                                                  real->double-flonum
                                                                                                                                                                                                                                  (#%app
                                                                                                                                                                                                                                   imag-part
                                                                                                                                                                                                                                   corner))
                                                                                                                                                                                                                                 (#%app
                                                                                                                                                                                                                                  unsafe-fl*
                                                                                                                                                                                                                                  (#%app
                                                                                                                                                                                                                                   ->fl
                                                                                                                                                                                                                                   px-y)
                                                                                                                                                                                                                                  (#%app
                                                                                                                                                                                                                                   real->double-flonum
                                                                                                                                                                                                                                   scale)))))
                                                                                                                                                                                                                    (letrec-values ((()
                                                                                                                                                                                                                                     (begin
                                                                                                                                                                                                                                       (quote-syntax
                                                                                                                                                                                                                                        (:-internal
                                                                                                                                                                                                                                         iterate
                                                                                                                                                                                                                                         (Natural
                                                                                                                                                                                                                                          Float
                                                                                                                                                                                                                                          Float
                                                                                                                                                                                                                                          ->
                                                                                                                                                                                                                                          Natural))
                                                                                                                                                                                                                                        #:local)
                                                                                                                                                                                                                                       (#%plain-app
                                                                                                                                                                                                                                        values)))
                                                                                                                                                                                                                                    ((iterate)
                                                                                                                                                                                                                                     (lambda (i
                                                                                                                                                                                                                                              z-rl
                                                                                                                                                                                                                                              z-im)
                                                                                                                                                                                                                                       (if (if (#%app
                                                                                                                                                                                                                                                <
                                                                                                                                                                                                                                                i
                                                                                                                                                                                                                                                max-iter)
                                                                                                                                                                                                                                             (#%app
                                                                                                                                                                                                                                              unsafe-fl<=
                                                                                                                                                                                                                                              (#%app
                                                                                                                                                                                                                                               flhypot
                                                                                                                                                                                                                                               z-rl
                                                                                                                                                                                                                                               z-im)
                                                                                                                                                                                                                                              '2.0)
                                                                                                                                                                                                                                             '#f)
                                                                                                                                                                                                                                         (let-values ()
                                                                                                                                                                                                                                           (#%app
                                                                                                                                                                                                                                            iterate
                                                                                                                                                                                                                                            (#%app
                                                                                                                                                                                                                                             +
                                                                                                                                                                                                                                             i
                                                                                                                                                                                                                                             '1)
                                                                                                                                                                                                                                            (#%app
                                                                                                                                                                                                                                             unsafe-fl+
                                                                                                                                                                                                                                             (#%app
                                                                                                                                                                                                                                              unsafe-fl-
                                                                                                                                                                                                                                              (#%app
                                                                                                                                                                                                                                               unsafe-fl*
                                                                                                                                                                                                                                               z-rl
                                                                                                                                                                                                                                               z-rl)
                                                                                                                                                                                                                                              (#%app
                                                                                                                                                                                                                                               unsafe-fl*
                                                                                                                                                                                                                                               z-im
                                                                                                                                                                                                                                               z-im))
                                                                                                                                                                                                                                             c-rl)
                                                                                                                                                                                                                                            (#%app
                                                                                                                                                                                                                                             unsafe-fl+
                                                                                                                                                                                                                                             (#%app
                                                                                                                                                                                                                                              unsafe-fl+
                                                                                                                                                                                                                                              (#%app
                                                                                                                                                                                                                                               unsafe-fl*
                                                                                                                                                                                                                                               z-rl
                                                                                                                                                                                                                                               z-im)
                                                                                                                                                                                                                                              (#%app
                                                                                                                                                                                                                                               unsafe-fl*
                                                                                                                                                                                                                                               z-rl
                                                                                                                                                                                                                                               z-im))
                                                                                                                                                                                                                                             c-im)))
                                                                                                                                                                                                                                         (let-values ()
                                                                                                                                                                                                                                           i)))))
                                                                                                                                                                                                                      (#%app
                                                                                                                                                                                                                       set-pixel!
                                                                                                                                                                                                                       px-x
                                                                                                                                                                                                                       px-y
                                                                                                                                                                                                                       (#%app
                                                                                                                                                                                                                        iterate
                                                                                                                                                                                                                        '0
                                                                                                                                                                                                                        c-rl
                                                                                                                                                                                                                        c-im))))))
                                                                                                                                                                                                              (#%app
                                                                                                                                                                                                               values))))
                                                                                                                                                                                                (#%app
                                                                                                                                                                                                 values)))
                                                                                                                                                                                            (#%app
                                                                                                                                                                                             void)))
                                                                                                                                                                                        (#%app
                                                                                                                                                                                         values))))
                                                                                                                                                                          (#%app
                                                                                                                                                                           values))
                                                                                                                                                                        (#%app
                                                                                                                                                                         values))))
                                                                                                                                                          (if (begin
                                                                                                                                                                (if (begin
                                                                                                                                                                      '#t
                                                                                                                                                                      '#t)
                                                                                                                                                                  (#%app
                                                                                                                                                                   not
                                                                                                                                                                   '#f)
                                                                                                                                                                  '#f)
                                                                                                                                                                '#t)
                                                                                                                                                            (#%app
                                                                                                                                                             for-loop
                                                                                                                                                             (#%app
                                                                                                                                                              +
                                                                                                                                                              pos
                                                                                                                                                              inc))
                                                                                                                                                            (#%app
                                                                                                                                                             values))))
                                                                                                                                                      (#%app
                                                                                                                                                       values)))
                                                                                                                                                  (#%app
                                                                                                                                                   values)))))
                                                                                                                               for-loop)
                                                                                                                             start)))))
                                                                                                                    (#%app
                                                                                                                     void)))
                                                                                                                (#%app
                                                                                                                 values))))
                                                                                                  (#%app
                                                                                                   values))
                                                                                                (#%app
                                                                                                 values))))
                                                                                  (if (begin
                                                                                        (if (begin
                                                                                              '#t
                                                                                              '#t)
                                                                                          (#%app
                                                                                           not
                                                                                           '#f)
                                                                                          '#f)
                                                                                        '#t)
                                                                                    (#%app
                                                                                     for-loop
                                                                                     (#%app
                                                                                      +
                                                                                      pos
                                                                                      inc))
                                                                                    (#%app
                                                                                     values))))
                                                                              (#%app
                                                                               values)))
                                                                          (#%app
                                                                           values)))))
                                                       for-loop)
                                                     start)))))
                                            (#%app void))))))))))))))))
      (let-values (((mandelbrot)
                    (lambda (given-kws given-args)
                      (let-values (((corner5) (#%app car given-args))
                                   ((kws1312) (#%app cdr given-kws))
                                   ((kw-args1313) (#%app cdr given-args)))
                        (let-values (((dst7) (#%app car kw-args1313))
                                     ((kws1314) (#%app cdr kws1312))
                                     ((kw-args1315) (#%app cdr kw-args1313)))
                          (let-values (((dst_offset8) (#%app car kw-args1315))
                                       ((kws1316) (#%app cdr kws1314))
                                       ((kw-args1317) (#%app cdr kw-args1315)))
                            (let-values (((dst_row_stride9)
                                          (#%app car kw-args1317))
                                         ((kws1318) (#%app cdr kws1316))
                                         ((kw-args1319)
                                          (#%app cdr kw-args1317)))
                              (let-values (((height2) (#%app car kw-args1319))
                                           ((kws1320) (#%app cdr kws1318))
                                           ((kw-args1321)
                                            (#%app cdr kw-args1319)))
                                (let-values (((lut4) (#%app car kw-args1321))
                                             ((kws1322) (#%app cdr kws1320))
                                             ((kw-args1323)
                                              (#%app cdr kw-args1321)))
                                  (let-values (((max_iter3)
                                                (#%app car kw-args1323))
                                               ((kws1324) (#%app cdr kws1322))
                                               ((kw-args1325)
                                                (#%app cdr kw-args1323)))
                                    (let-values (((scale6)
                                                  (#%app car kw-args1325))
                                                 ((kws1326)
                                                  (#%app cdr kws1324))
                                                 ((kw-args1327)
                                                  (#%app cdr kw-args1325)))
                                      (let-values (((width1)
                                                    (#%app car kw-args1327)))
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
             (let-values (((l21328) given-kws))
               (if (#%app pair? l21328)
                 (if (#%app eq? (#%app car l21328) '#:corner)
                   (let-values (((l21329) (#%app cdr l21328)))
                     (if (#%app pair? l21329)
                       (if (#%app eq? (#%app car l21329) '#:dst)
                         (let-values (((l21330) (#%app cdr l21329)))
                           (if (#%app pair? l21330)
                             (if (#%app eq? (#%app car l21330) '#:dst_offset)
                               (let-values (((l21331) (#%app cdr l21330)))
                                 (if (#%app pair? l21331)
                                   (if (#%app
                                        eq?
                                        (#%app car l21331)
                                        '#:dst_row_stride)
                                     (let-values (((l21332)
                                                   (#%app cdr l21331)))
                                       (if (#%app pair? l21332)
                                         (if (#%app
                                              eq?
                                              (#%app car l21332)
                                              '#:height)
                                           (let-values (((l21333)
                                                         (#%app cdr l21332)))
                                             (if (#%app pair? l21333)
                                               (if (#%app
                                                    eq?
                                                    (#%app car l21333)
                                                    '#:lut)
                                                 (let-values (((l21334)
                                                               (#%app
                                                                cdr
                                                                l21333)))
                                                   (if (#%app pair? l21334)
                                                     (if (#%app
                                                          eq?
                                                          (#%app car l21334)
                                                          '#:max_iter)
                                                       (let-values (((l21335)
                                                                     (#%app
                                                                      cdr
                                                                      l21334)))
                                                         (if (#%app
                                                              pair?
                                                              l21335)
                                                           (if (#%app
                                                                eq?
                                                                (#%app
                                                                 car
                                                                 l21335)
                                                                '#:scale)
                                                             (let-values (((l21336)
                                                                           (#%app
                                                                            cdr
                                                                            l21335)))
                                                               (if (#%app
                                                                    pair?
                                                                    l21336)
                                                                 (if (#%app
                                                                      eq?
                                                                      (#%app
                                                                       car
                                                                       l21336)
                                                                      '#:width)
                                                                   (#%app
                                                                    null?
                                                                    (#%app
                                                                     cdr
                                                                     l21336))
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
      (lambda () (#%app run-benchmark2 '"typed-scalar" mandelbrot))
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
