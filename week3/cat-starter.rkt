;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cat-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; cat-starter.rkt

;PROBLEM:
;
;Use the How to Design Worlds recipe to design an interactive
;program in which a cat starts at the left edge of the display 
;and then walks across the screen to the right. When the cat
;reaches the right edge it should just keep going right off 
;the screen.
;
;Once your design is complete revise it to add a new feature,
;which is that pressing the space key should cause the cat to
;go back to the left edge of the screen. When you do this, go
;all the way back to your domain analysis and incorporate the
;new feature.
;
;To help you get started, here is a picture of a cat, which we
;have taken from the 2nd edition of the How to Design Programs 
;book on which this course is based.

;; Program that moves cat across the screen

;; =================
;; Constants:

(define WIDTH 200)
(define HEIGHT 200)
(define CAT-IMG (text "cat" 24 "black"))
(define CTR-Y (/ HEIGHT 2))
(define MTS (empty-scene WIDTH HEIGHT))
(define SPEED-OF-CAT 1)
  
;; =================
;; Data definitions:

;; Cat is a Number
;; interp. x coordinate of the Cat on the screen
(define Cat1 1)
(define Cat2 50)

#;
(define (fn-for-cat cat)
  (... cat))


;; =================
;; Functions:

;; Cat -> Cat
;; start the world with (main 0)
;; 
(define (main cat)
  (big-bang cat                     ; Cat
            (on-tick   advance-cat) ; Cat -> Cat
            (to-draw   render)      ; Cat -> Image
            (on-key    handle-reset-cat)))   ; Cat KeyEvent -> Cat
;; Cat -> Cat
;; move the cat to the next position
(check-expect (advance-cat 0) 1)
(check-expect (advance-cat 50) 51)

;; (define (advance-cat cat) 0) ; stub

; <use template from Cat>

(define (advance-cat cat)
  (+ cat SPEED-OF-CAT))

;; Cat -> Image
;; render the cat image at the indicated x-coordinate of the screen 
(check-expect (render 4) (place-image CAT-IMG 4 CTR-Y MTS))
(check-expect (render 6) (place-image CAT-IMG 6 CTR-Y MTS))

;; (define (render cat) MTS) ; stub

; <use template from Cat>

(define (render cat)
  (place-image CAT-IMG cat CTR-Y MTS))

;; Cat KeyEvent -> Cat
;; reset cat to left side of screen
(check-expect (handle-reset-cat 50 " ") 0)
(check-expect (handle-reset-cat 10 "a") 10)
(check-expect (handle-reset-cat  0 " ") 0)
(check-expect (handle-reset-cat  0 "g") 0)

;(define (handle-reset-cat cat key-event) 0) ; stub

#;
(define (handle-reset-cat cat key-event) ; template
  (cond [(key=? key-event " ") (... cat)]
        [else (... cat)]))

(define (handle-reset-cat cat key-event)
  (cond [(key=? key-event " ") 0]
        [else cat]))