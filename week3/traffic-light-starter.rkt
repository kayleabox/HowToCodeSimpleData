;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname traffic-light-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; traffic-light-starter.rkt


;PROBLEM:
;
;Design an animation of a traffic light. 
;
;Your program should show a traffic light that is red, then green, 
;then yellow, then red etc. For this program, your changing world 
;state data definition should be an enumeration.
;
;Here is what your program might look like if the initial world 
;state was the red traffic light
;Next green
;Next yellow
;
;Next is red, and so on.
;
;To make your lights change at a reasonable speed, you can use the 
;rate option to on-tick. If you say, for example, (on-tick next-color 1) 
;then big-bang will wait 1 second between calls to next-color.
;
;Remember to follow the HtDW recipe! Be sure to do a proper domain 
;analysis before starting to work on the code file.
;
;Note: If you want to design a slightly simpler version of the program,
;you can modify it to display a single circle that changes color, rather
;than three stacked circles. 


;; =================
;; Constants:
(define WIDTH  200)
(define HEIGHT 200)
(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))
(define MTS (empty-scene WIDTH HEIGHT))

(define RED-LIGHT-IMG
  (overlay
    (above
      (circle 15 "solid" "red")
      (circle 15 "outline" "yellow")
      (circle 15 "outline" "green"))
   (rectangle 50 120 "solid" "black")))
(define GREEN-LIGHT-IMG
  (overlay
    (above
      (circle 15 "outline" "red")
      (circle 15 "outline" "yellow")
      (circle 15 "solid" "green"))
   (rectangle 50 120 "solid" "black")))
(define YELLOW-LIGHT-IMG
  (overlay
    (above
      (circle 15 "outline" "red")
      (circle 15 "solid" "yellow")
      (circle 15 "outline" "green"))
   (rectangle 50 120 "solid" "black")))



;; =================
;; Data definitions:

;; LightState is one of:
;; "red"
;; "green"
;; "yellow"
;; interp. the color of a traffic light
;; <examples are redundant for enumerations>
 
#;
(define (fn-for-light-state lightstate)
  (cond [(string=? "red" lightstate) (...)]
        [(string=? "green" lightstate) (...)]
        [(string=? "yellow" lightstate) (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "red"
;;  - atomic distinct: "green"
;;  - atomic distinct: "yellow"


;; =================
;; Functions:

;; LightState -> LightState
;; start the world with (main "red"), (main "green") or (main "yellow")

(define (main lightstate)
  (big-bang lightstate                      ; LightState
            (on-tick   next-light 2)        ; LightState -> LightState
            (to-draw   render)              ; LightState -> Image
            (on-key    handle-reset-light))); LightState KeyEvent -> LightState


;; LightState -> LightState
;; update the state of the light to the next color
(check-expect (next-light "red") "green")
(check-expect (next-light "green") "yellow")
(check-expect (next-light "yellow") "red")

;; (define (next-light lightstate) "red") ;stub

; <use template from LightState>

(define (next-light light-state)
  (cond [(string=? "red" light-state) "green"]
        [(string=? "green" light-state) "yellow"]
        [(string=? "yellow" light-state) "red"]))

;; LightState -> Image
;; renders the appropriate image to the screen
;; "red" renders RED-LIGHT-IMG
;; "green" renders GREEN-LIGHT-IMG
;; "yellow" renders YELLOW-LIGHT-IMG
(check-expect (render "red")
              (place-image GREEN-LIGHT-IMG CTR-X CTR-Y MTS))
(check-expect (render "green")
              (place-image YELLOW-LIGHT-IMG CTR-X CTR-Y MTS))
(check-expect (render "yellow")
              (place-image RED-LIGHT-IMG CTR-X CTR-Y MTS))

;; (define (render lightstate) MTS) ; stub

;<use template from LightState>

(define (render light-state)
  (cond [(string=? "red" light-state)
         (place-image GREEN-LIGHT-IMG CTR-X CTR-Y MTS)]
        [(string=? "green" light-state)
         (place-image YELLOW-LIGHT-IMG CTR-X CTR-Y MTS)]
        [(string=? "yellow" light-state)
         (place-image RED-LIGHT-IMG CTR-X CTR-Y MTS)]))


;; LightState KeyEvent -> LightState
;; set state to "red" if r is pressed
;; "green" if g is pressed
;; "yellow" if y is pressed
(check-expect (handle-reset-light "yellow" "r") "red")
(check-expect (handle-reset-light "red" "g") "green")
(check-expect (handle-reset-light "green" "y") "yellow")
(check-expect (handle-reset-light "red" "l") "red")
(check-expect (handle-reset-light "green" "f") "green")

;(define (handle-reset-light light-state key-event) "red") ; stub

#;
(define (handle-reset-light light-state key-event) ; template
  (cond [(key=? key-event "r") (... light-state)]
        [(key=? key-event "g") (... light-state)]
        [(key=? key-event "y") (... light-state)]
        [else (... light-state)]))

(define (handle-reset-light light-state key-event)
  (cond [(key=? key-event "r") "red"]
        [(key=? key-event "g") "green"]
        [(key=? key-event "y") "yellow"]
        [else light-state]))

