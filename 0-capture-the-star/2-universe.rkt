#lang racket

(require 2htdp/image 2htdp/universe)

(require "1-star-on-board.rkt")


; Number -> Pict
; the procedure for animate
(define (create-chessboard height)
  (star-on-chessboard 40 height 1))

; Number -> Number
; move the star t a random location
(define (move-star height)
  (random 8))

; a world
(big-bang 0
  (check-with number?)
  (on-draw create-chessboard)
  (on-tick move-star))
