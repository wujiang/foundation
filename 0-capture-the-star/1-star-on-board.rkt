#lang racket
(require 2htdp/image)
(require "0-chessboard.rkt")

; Number Number -> Number
; calculate a location based on square's size and file/rank
(define (cal-location size n)
  (- (* size n) (/ size 2)))

; Number Number Number -> Pict
; draw a chessboard and place a star on it
(define (star-on-chessboard size r f)
  (let* ([cb (chessboard size)]
         [st (star (/ size 2) "solid" "yellow")]
         [x (cal-location size r)]
         [y (cal-location size (- 9 f))])
    (place-image st x y cb)))

(provide star-on-chessboard)