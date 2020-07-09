#lang racket

(require 2htdp/image 2htdp/universe)

(require "1-star-on-board.rkt")

; loc -> Pict
; the procedure for animate
(define (create-chessboard l)
  (star-on-chessboard 100 l))

; loc -> loc
; move the star t a random location
(define (move-star l)
  (loc (random 8) (random 8)))

; loc Number Number MouseEvent -> loc
; mouse event handler
(define (move-star-to l x y e)
  (cond [(mouse=? e "button-down")
         (loc (+ 1 (random 8)) (+ 1 (random 8)))]
        [else l]))

; a world
(big-bang (loc 1 1)
  (to-draw create-chessboard)
  ; (on-tick move-star)
  (on-mouse move-star-to))
