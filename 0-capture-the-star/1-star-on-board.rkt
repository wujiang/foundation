#lang racket
(require 2htdp/image)
(require "0-chessboard.rkt")

(struct loc (r f))

; Number Number -> Number
; calculate a location based on square's size and file/rank
(define (cal-location size n)
  (- (* size n) (/ size 2)))

; Number Number Number -> Pict
; draw a chessboard and place a star on it
(define (star-on-chessboard size loc)
  (let* ([cb (chessboard size)]
         [st (star (/ size 2) "solid" "yellow")]
         [x (cal-location size (loc-r loc))]
         [y (cal-location size (- 9 (loc-f loc)))])
    (place-image st x y cb)))

(provide star-on-chessboard loc)
