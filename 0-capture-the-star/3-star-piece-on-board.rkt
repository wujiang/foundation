#lang racket
(require (only-in pict pict->bitmap) 2htdp/image chess/pict)
(require "0-chessboard.rkt")

; Number Number -> loc
; a 2d point structure
(struct loc (x y) #:transparent)

; Integer Integer -> Integer
; given a index (rank/file), calculate the location
; on a checkerboard.
(define (idx-to-location size n)
  (- (* size n) (/ size 2)))

; Integer loc -> Pict
; draw a chessboard and place a star on it
(define (star-on-chessboard size loc)
  (let* ([cb (chessboard size)]
         [st (star (/ size 2) "solid" "gold")]
         [x (idx-to-location size (loc-x loc))]
         [y (idx-to-location size (loc-y loc))])
    (place-image st x y cb)))

; Pict Integer ChessPiece loc -> Pict
; place a chess piece on a chessboard at loc
(define (piece-on-chessboard board size piece loc)
  (let ([piece (scale 2 (pict->bitmap (chess-piece-pict piece)))]
        [x (idx-to-location size (loc-x loc))]
        [y (idx-to-location size (loc-y loc))])
    (place-image piece x y board)))

(provide star-on-chessboard loc piece-on-chessboard)
