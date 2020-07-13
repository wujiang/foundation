#lang racket

(require racket/format 2htdp/image 2htdp/universe)
(require "3-star-piece-on-board.rkt")

(define square-size 100)
(struct board-state (star-loc piece piece-loc score))

; Integer Integer -> Integer
; given a location, caluculate the index (rank/file)
; it lands on a checkerboard
(define (coordinate-to-idx size x)
  (+ 1 (quotient x size)))

(define allowed-pieces (list "white-rook"
                             "white-pawn"
                             ; "white-bishop"
                             "white-knight"
                             "white-queen"))
(define (pick-a-piece)
  (list-ref allowed-pieces (random (length allowed-pieces))))

; loc -> Pict
; the procedure for animate
(define (create-chessboard s)
  (let ([score-img (text (~a "score: " (board-state-score s)) 40 "black")]
        [score-loc-x (* 4 square-size)]
        [score-loc-y (- (* square-size 8) 40)]
        [board-img (star-on-chessboard square-size (board-state-star-loc s))])
    (place-image score-img score-loc-x score-loc-y
                 (piece-on-chessboard board-img square-size
                                      (board-state-piece s)
                                      (board-state-piece-loc s)))))


; loc Number Number MouseEvent -> loc
; mouse event handler
(define (move-star-to s x y e)
  (let* ([star-loc (board-state-star-loc s)]
        [piece-loc-x (coordinate-to-idx square-size x)]
        [piece-loc-y (coordinate-to-idx square-size y)]
        [piece-loc (loc piece-loc-x piece-loc-y)]
        [captured (equal? star-loc piece-loc)]
        [new-score (if captured 1 0)]
        [star-new-loc (if captured
                          (loc (+ 1 (random 8)) (+ 1 (random 8)))
                          star-loc)]
        [new-piece (if captured (pick-a-piece) (board-state-piece s))])
    (cond [(mouse=? e "button-down")
           (board-state star-new-loc
                        new-piece
                        piece-loc
                        (+ (board-state-score s) new-score))]
          [else s])
    ))

; a world
(big-bang (board-state (loc 1 1) "white-rook" (loc 2 2) 0)
          (to-draw create-chessboard)
          (on-mouse move-star-to))
