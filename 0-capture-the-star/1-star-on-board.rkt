#lang racket
(require 2htdp/image)
(require "0-chessboard.rkt")

; Number Number -> loc
; a 2d point structure
(struct loc (x y) #:transparent)

; Integer Integer -> Integer
; given a index (rank/file), calculate the location
; on a checkerboard.
(define (idx-to-location size n)
  (- (* size n) (/ size 2)))

; Number loc -> Pict
; draw a chessboard and place a star on it
(define (star-on-chessboard size loc)
  (let* ([cb (chessboard size)]
         [st (star (/ size 2) "solid" "yellow")]
         [x (idx-to-location size (loc-x loc))]
         [y (idx-to-location size (loc-y loc))])
    (place-image st x y cb)))

(provide star-on-chessboard loc)
