#lang racket
(module+ test
  (require rackunit))

(define (read-expr)
  (display "> ")
  (read))

(define (eval-expr expr)
    (displayln expr))

(define (quit? expr)
  (or (eq? expr 'quit)
      (eq? expr 'q)))

(define (bye)
  (displayln "bye."))

(define (repl)
  (let ([expr (read-expr)])
    (cond [(quit? expr) (bye)]
          [else
            (eval-expr expr)
            (repl)])))

(module+ test
  ;; Any code in this `test` submodule runs when this file is run using DrRacket
  ;; or with `raco test`. The code here does not run when this file is
  ;; required by another module.

  ;quit? test
  (check-equal? (quit? 'quit) #t)
  (check-equal? (quit? 'q) #t)
  (check-equal? (quit? 'hello) #f)

)

(module+ main
  ;; (Optional) main submodule. Put code here if you need it to be executed when
  ;; this file is run using DrRacket or the `racket` executable.  The code here
  ;; does not run when this file is required by another module. Documentation:
  ;; http://docs.racket-lang.org/guide/Module_Syntax.html#%28part._main-and-test%29
  (repl)
  #|
  (require racket/cmdline)
  (define who (box "world"))
  (command-line
    #:program "my-program"
    #:once-each
    [("-n" "--name") name "Who to say hello to" (set-box! who name)]
    #:args ()
    (printf "hello ~a~n" (unbox who))))
|#
)
