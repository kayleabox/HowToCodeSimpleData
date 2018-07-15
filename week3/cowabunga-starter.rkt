;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cowabunga-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)


;PROBLEM:
;
;As we learned in the cat world programs, cats have a mind of their own. When they 
;reach the edge they just keep walking out of the window.
;
;Cows on the other hand are docile creatures. They stay inside the fence, walking
;back and forth nicely.
;
;Design a world program with the following behaviour:
;   - A cow walks back and forth across the screen.
;   - When it gets to an edge it changes direction and goes back the other way
;   - When you start the program it should be possible to control how fast a
;     walker your cow is.
;   - Pressing space makes it change direction right away.
;   
;To help you here are two pictures of the right and left sides of a lovely cow that 
;was raised for us at Brown University.
;
;Once your program works here is something you can try for fun. If you rotate the
;images of the cow slightly, and you vary the image you use as the cow moves, you
;can make it appear as if the cow is waddling as it walks across the screen.
;
;Also, to make it look better, arrange for the cow to change direction when its
;nose hits the edge of the window, not the center of its body.


;; Constants:
(define WIDTH 400)
(define HEIGHT 200)

(define CTR-Y (/ HEIGHT 2))
(define RCOW (text "rcow" 24 "black"))
(define LCOW (text "lcow" 24 "black"))
(define MTS (empty-scene WIDTH HEIGHT))

;; Data Definitions:
(define-struct cow(x dx))
;; Cow is (make-cow Natural[0, WIDTH], Integer)
;; interp. (make-cow x dx) is a cow with x coodinate and velocity dx
;; the x is the center of the cow
;; x is in screen coordinates
;; dx is in pixels per tick

(define Cow1 (make-cow 10 3))
(define Cow2 (make-cow 0 4))
(define Cow3 (make-cow 100 -1))

#;
(define (fn-for-cow cow)
  (... (cow-x cow)    ; Natural[0, WIDTH]
       (cow-dx cow))) ; Integer

;; Template rules used:
;; - Compound: 2 fields


;; Function Definitions:

;; Cow -> Cow
;; start with (main (make-cow 0 3))
(define (main cow)
  (big-bang cow
            (on-tick next-cow)      ; Cow -> Cow
            (to-draw render-cow)    ; Cow -> Image
            (on-key  handle-key)))  ; Cow KeyEvent -> Cow

;; Cow -> Cow
;; Increases cow x by dx, bounces off edges
(check-expect (next-cow (make-cow (- WIDTH 3) 3)) (make-cow WIDTH 3))
(check-expect (next-cow (make-cow  3 -3)) (make-cow 0 -3))

(check-expect (next-cow (make-cow (- WIDTH 2) 3)) (make-cow WIDTH -3))
(check-expect (next-cow (make-cow 2 -3)) (make-cow 0 3))

(check-expect (next-cow (make-cow 50 -2)) (make-cow (+ 50 -2) -2))
(check-expect (next-cow (make-cow 50 2)) (make-cow (+ 50 2) 2))

;; (define (next-cow cow) cow) ; stub

; <use template from Cow>

(define (next-cow cow)
  (cond [(> (+ (cow-x cow) (cow-dx cow)) WIDTH) (make-cow WIDTH (- (cow-dx cow)))]
        [(< (+ (cow-x cow) (cow-dx cow)) 0) (make-cow 0 (- (cow-dx cow)))]    
        [else
         (make-cow (+ (cow-x cow) (cow-dx cow)) (cow-dx cow))]))

;; Cow -> Image
;; render cow to the appropriate place on the screen
(check-expect (render-cow (make-cow 70 3))
              (place-image RCOW 70 CTR-Y MTS))
(check-expect (render-cow (make-cow 70 -3))
              (place-image LCOW 70 CTR-Y MTS))

;; (define (render-cow cow) MTS) ; stub

; <use template from Cow>

(define (render-cow cow)
  (place-image (choose-cow cow) (cow-x cow) CTR-Y MTS))

;; Cow -> Image
;; return RCOW if cow-dx is positive and LCOW if cow-dx is negative
(check-expect (choose-cow (make-cow 10 2)) RCOW)
(check-expect (choose-cow (make-cow 10 -2)) LCOW)
(check-expect (choose-cow (make-cow 10 0)) LCOW)

;; (define (choose-cow cow) RCOW) ; stub

; <use template from cow>

(define (choose-cow cow)
  (cond [(> (cow-dx cow) 0) RCOW ]
        [else LCOW ]))

;; Cow KeyEvent -> Cow
;; reverse direction of the cow when the space bar is pressed
(check-expect (handle-key (make-cow 50 2) " ") (make-cow 50 -2))
(check-expect (handle-key (make-cow 50 -2) " ") (make-cow 50 2))
(check-expect (handle-key (make-cow 100 -2) "g") (make-cow 100 -2))

;; (define (handle-key cow key-event) cow) ; stub

; <use template from Cow>

(define (handle-key cow key-event)
  (cond [(key=? key-event " ") (make-cow (cow-x cow) (-(cow-dx cow)))]
        [else cow]))

  
