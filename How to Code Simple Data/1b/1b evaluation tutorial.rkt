;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1b evaluation tutorial|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; Design a function that consumes two images and produces true if the first is larger than the second

;; image -> boolean
; produce true if the first img is larger than the scond img

(check-expect (larger-img? (square 10 "solid" "red") (square 20 "solid" "red")) false)
(check-expect (larger-img? (circle 20.7 "solid" "blue") (square 40 "solid" "yellow")) true)
(check-expect (larger-img? (ellipse 60 30 "outline" "yellow")(square 10 "outline" "black")) true)
(check-expect (larger-img? (circle 10 "outline" "red")(circle 5 "solid" "blue")) true)

(define (larger-img? img1 img2)
  (if (and (> (image-width img1) (image-width img2))
       (> (image-height img1) (image-height img2))) true false))