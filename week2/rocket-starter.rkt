;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rocket-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; rocket-starter.rkt

;; =================
;; Data definitions:

;
;PROBLEM A:
;
;You are designing a program to track a rocket's journey as it descends 
;100 kilometers to Earth. You are only interested in the descent from 
;100 kilometers to touchdown. Once the rocket has landed it is done.
;
;Design a data definition to represent the rocket's remaining descent. 
;Call it RocketDescent.

;; RocketDescent is one of:
;;  - false
;;  - Natural[1, 100]
;;  - "landed"
;; interp.
;;    false            means descent has not yet started
;;    Natural[1, 100]  means descent has kilometers left to landing
;;    "landed"         means descent is over
(define descent1 false)       ;not running
(define descent2 100)         ;just started running
(define descent3  1)           ;almost over
(define descent4 "landed")     ;landed
#;
(define (fn-for-rocket-descent descent)
  (cond [(false? descent) (...)]
        [(and (number? descent) (<= 1 descent) (<= descent 100)) (... descent)]
        [else (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: false
;;  - atomic non-distinct: Natural[1, 100]
;;  - atomic distinct: "landed"

;; =================
;; Functions:


;PROBLEM B:
;
;Design a function that will output the rocket's remaining descent distance 
;in a short string that can be broadcast on Twitter. 
;When the descent is over, the message should be "The rocket has landed!".
;Call your function rocket-descent-to-msg.

;; RocketDecent -> String
;; takes in a RocketDescent and returns a string with the remaining time
;; or "The rocket has landed!" if it has landed
(check-expect (rocket-descent-to-msg false) (number->string 0))
(check-expect (rocket-descent-to-msg 5) (number->string 5))
(check-expect (rocket-descent-to-msg "landed") "The rocket has landed!")

;; (define (rocket-descent-to-msg descent) (number->string 0)) ;stub

;<use template from RocketDescent>

(define (rocket-descent-to-msg descent)
  (cond [(false? descent)
         (number->string 0)]
        [(and (number? descent) (<= 1 descent) (<= descent 100))
         (number->string descent)]
        [else
         "The rocket has landed!"]))