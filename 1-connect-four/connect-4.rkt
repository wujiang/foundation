#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define unit (square 50 "outline" "black"))

(struct pos (x y))

(struct state (position points))

(define (row n)
  (for/fold ([accumulator unit])
            ([i (- n 1)])
    (beside unit accumulator)))


(define (board n)
  (for/fold ([accumulator (row 7)])
            ([i (- n 1)])
    (above (row 7) accumulator)))

(define (draw-it st)
  (board 6))

(define (click-update st x y e)
  (board 6))

(big-bang (state (pos -1 -1) 0)
  (on-draw draw-it)
  (on-mouse click-update))