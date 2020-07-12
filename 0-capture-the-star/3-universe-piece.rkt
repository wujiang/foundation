#lang racket

(require 2htdp/image 2htdp/universe chess/pict chess/piece)

(require "3-star-piece-on-board.rkt")

(struct board-state (star-loc piece piece-loc))

; Integer Integer -> Integer
; given a location, caluculate the index (rank/file)
; it lands on a checkerboard
(define (coordinate-to-idx size x)
  (+ 1 (quotient x size)))

; loc -> Pict
; the procedure for animate
(define (create-chessboard s)
  (piece-on-chessboard
   (star-on-chessboard 100 ( board-state-star-loc s))
   100
   (board-state-piece s)
   (board-state-piece-loc s)))


; loc Number Number MouseEvent -> loc
; mouse event handler
(define (move-star-to s x y e)
  (cond [(mouse=? e "button-down")
         (board-state (loc (+ 1 (random 8)) (+ 1 (random 8)))
                      (board-state-piece s)
                      (loc (+ 1 (random 8)) (+ 1 (random 8))))
         ]
        [else s]))

; a world
(big-bang (board-state (loc 1 1) white-rook (loc 2 2))
          (to-draw create-chessboard)
          (on-mouse move-star-to))
