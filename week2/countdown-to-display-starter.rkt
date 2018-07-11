;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown-to-display-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;PROBLEM:
;
;You are asked to contribute to the design for a very simple New Year's
;Eve countdown display. You already have the data definition given below. 
;You need to design a function that consumes Countdown and produces an
;image showing the current status of the countdown. 


;; Data definitions:

;; Countdown is one of:
;;  - false
;;  - Natural[1, 10]
;;  - "complete"
;; interp.
;;    false           means countdown has not yet started
;;    Natural[1, 10]  means countdown is running and how many seconds left
;;    "complete"      means countdown is over
(define CD1 false)       ;not running
(define CD2 10)          ;just started running
(define CD3  1)          ;almost over
(define CD4 "complete")

#;
(define (fn-for-countdown c)
  (cond [(false? c) (...)]
        [(and (number? c) (<= 1 c) (<= c 10)) (... c)]
        [else (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: false
;;  - atomic non-distinct: Natural[1, 10]
;;  - atomic distinct: "complete"



;; Functions:

;; Countdown -> Image
;; produce nice image of current state of countdown
(check-expect (display-countdown false) (square 0 "solid" "white"))
(check-expect (display-countdown 5) (text (number->string 5) 24 "black"))
(check-expect (display-countdown "complete") (text "Happy New Year!" 24 "black"))

;(define (display-countdown countdown) (square 0 "solid" "white")) ;stub

;<use template from Countdown>

(define (display-countdown c)
  (cond [(false? c)
         (square 0 "solid" "white")]
        [(and (number? c) (<= 1 c) (<= c 10))
         (text (number->string c) 24 "black")]
        [else
         (text "Happy New Year!" 24 "black")]))