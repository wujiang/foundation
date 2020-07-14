#lang racket
(require 2htdp/image chess/pict)
(require "0-chessboard.rkt")

; Number Number -> loc
; a 2d point structure
(struct loc (x y) #:transparent)

(define chess-piece-data
  (hash
   "white-king" "\u2654"
   "white-queen" "\u2655"
   "white-rook" "\u2656"
   "white-bishop" "\u2657"
   "white-knight" "\u2658"
   "white-pawn" "\u2659"
   "black-king" "\u265A"
   "black-queen" "\u265B"
   "black-rook" "\u265C"
   "black-bishop" "\u265D"
   "black-knight" "\u265E"
   "black-pawn" "\u265F"))

(define (chess-piece name size color)
  (text (hash-ref chess-piece-data name)size color))

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
  (let ([piece (chess-piece piece (/ size 2) "DarkGoldenrod")]
        [x (idx-to-location size (loc-x loc))]
        [y (idx-to-location size (loc-y loc))])
    (place-image piece x y board)))

(provide star-on-chessboard loc piece-on-chessboard)
