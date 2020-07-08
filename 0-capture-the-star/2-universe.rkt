#lang racket

(require 2htdp/image 2htdp/universe)

(require "1-star-on-board.rkt")

; Number -> Pict
; the procedure for animate
(define (create-chessboard point)
  (star-on-chessboard 40 point))

; Number -> Number
; move the star t a random location
(define (move-star p)
  (loc (random 8) (random 8)))

; a world
(big-bang (loc 1 1)
  (to-draw create-chessboard)
  (on-tick move-star))
