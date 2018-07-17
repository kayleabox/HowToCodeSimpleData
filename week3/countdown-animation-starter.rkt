;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown-animation-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; countdown-animation starter.rkt


;PROBLEM:
;
;Design an animation of a simple countdown. 
;
;Your program should display a simple countdown, that starts at ten, and
;decreases by one each clock tick until it reaches zero, and stays there.
;
;To make your countdown progress at a reasonable speed, you can use the 
;rate option to on-tick. If you say, for example, 
;(on-tick advance-countdown 1) then big-bang will wait 1 second between 
;calls to advance-countdown.
;
;Remember to follow the HtDW recipe! Be sure to do a proper domain 
;analysis before starting to work on the code file.
;
;Once you are finished the simple version of the program, you can improve
;it by reseting the countdown to ten when you press the spacebar.


;; =================
;; Constants:

(define WIDTH  300)
(define HEIGHT 200)
(define CTR-X (/ WIDTH  2))
(define CTR-Y (/ HEIGHT 2))
(define MTS (empty-scene WIDTH HEIGHT))


;; =================
;; Data definitions:

;; Countdown is Integer[0, 10]
;; interp. number between 1 and 10 indicating how many sec are
;; left in the countdown
(define Countdown1 10) ; start
(define Countdown2  5) ; middle
(define Countdown3  0) ; end

#;
(define (fn-for-countdown countdown)
  (... countdown))

;; Template rules used:
;;  - atomic non-distinct: Integer[0, 10]


;; =================
;; Functions:

;; Countdown -> Countdown
;; start the world with (main 10)
;;
(define (main countdown)
  (big-bang countdown                             ; Countdown
            (on-tick    decrease-countdown 1)     ; Countdown -> Countdown
            (to-draw    render-countdown)         ; Countdown -> Image
            (on-key     handle-reset-countdown))) ; Countdown KeyEvent -> Countdown

;; Countdown -> Countdown
;; decrease the countdown by 1
(check-expect (decrease-countdown 10) 9)
(check-expect (decrease-countdown  5) 4)
(check-expect (decrease-countdown  0) 0)

;; (define (decrease-countdown countdown) 10) ; stub

; <use template from countdown>

(define (decrease-countdown countdown)
  (cond [(= countdown 0) 0]
        [else (- countdown 1)]))

;; Countdown -> Image
;; render the new value of the countdown on the screen
(check-expect (render-countdown 10)
              (place-image (text (number->string 10) 24 "black") CTR-X CTR-Y MTS))
(check-expect (render-countdown  5)
              (place-image (text (number->string 5) 24 "black") CTR-X CTR-Y MTS))

;; (define (render-countdown countdown) MTS) ; stub

; <use template from countdown>

(define (render-countdown countdown)
  (place-image (text (number->string countdown) 24 "black") CTR-X CTR-Y MTS))

;; Countdown KeyEvent -> Countdown
;; reset the countdown to 10 if the spacebar is pressed
(check-expect (handle-reset-countdown  5 " ")  10)
(check-expect (handle-reset-countdown 10 "d")  10)
(check-expect (handle-reset-countdown  0 " ")  10)
(check-expect (handle-reset-countdown  0 "d")   0)

;; (define (handle-reset-countdown countdown key-event) 0) ;stub

#;
(define (handle-reset-countdown countdown key-event) ; template
  (cond [(key=? key-event " ") (... countdown)]
        [else (... countdown)]))

(define (handle-reset-countdown countdown key-event)
  (cond [(key=? key-event " ") 10]
        [else countdown]))


