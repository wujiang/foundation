#lang racket
(require 2htdp/image)

; Pict -> Pict
; duplicate a picture twice and put them side by side
(define (two-p p)
  (beside p p))

; Pict -> Pict
; duplicate a picture 4 times and put them into a square
(define (four p)
  (above (two-p p) (two-p p)))

; Pict Pict -> Pict
; stack 2 pictures with alternate sequence
(define (checker p1 p2)
  (above (beside p1 p2)
         (beside p2 p1)))


; Number -> Pict
; create a chessboard with each square's size as s
(define (chessboard size)
  (let* ([wp (square size "solid" "white")]
         [dgp (square size "solid" "darkgreen")]
         [c (checker wp dgp)]
         [c4 (four c)])
    (frame (four c4))))

; export this function
(provide chessboard)
