#lang racket

(require 2htdp/image 2htdp/universe)

(require "1-star-on-board.rkt")

; Integer Integer -> Integer
; given a location, caluculate the index (rank/file)
; it lands on a checkerboard
(define (coordinate-to-idx size x)
  (+ 1 (quotient x size)))

; loc -> Pict
; the procedure for animate
(define (create-chessboard l)
  (star-on-chessboard 100 l))

(struct board-state (star-loc piece piece-loc))

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
(big-bang (board-state (loc 1 1) white-rook (loc 2 2))
  (to-draw create-chessboard)
  ; (on-tick move-star)
  (on-mouse move-star-to))
