;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDWQuiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;PROBLEM:
;
;Design a World Program with Compound Data. You can be as creative as you like, but keep it simple.
;Above all, follow the recipes! You must also stay within the scope of the first part of the course.
;Do not use language features we have not seen in the videos. 
;
;If you need inspiration, you can choose to create a program that allows you to click on a spot on
;the screen to create a flower, which then grows over time. If you click again the first flower is
;replaced by a new one at the new position.
;
;You should do all your design work in DrRacket. Following the step-by-step recipe in DrRacket will
;help you be sure that you have a quality solution.

;; Constants:
(define WIDTH 400)
(define HEIGHT 200)
(define MTS (empty-scene WIDTH HEIGHT))

(define RADIUS 5)
(define FLOWER (circle RADIUS "solid" "pink"))

;; Data:
(define-struct flower(x y radius growth))
;; Flower is (make-flower Natural[0, WIDTH], Natural[0, HEIGHT], Natural[0, 15], Natural)
;; interp. (make-flower x y radius growth)
;; is a flower with x,y coodinate, a radius of radius and a velocity of growth

(define Flower1 (make-flower 10 50 3 3))
(define Flower2 (make-flower 0 30 5 4))

#;
(define (fn-for-flower flower)
  (... (flower-x flower)        ; Natural[0, WIDTH]
       (flower-y flower)        ; Natural[0, HEIGHT]
       (flower-radius flower)   ; Natural[0, 15]
       (flower-growth flower))) ; Integer

;; Template rules used:
;; - Compound: 4 fields

;; Functions:

;; Flower -> Flower
;; start with (main (make-flower 20 30 5 3))
(define (main flower)
  (big-bang flower
            (on-tick grow-flower)      ; Flower -> Flower
            (to-draw render-flower)    ; Flower -> Image
            (on-mouse  handle-mouse)))  ; Flower Integer Integer MouseEvent -> Flower


;; Flower -> Flower
;; Increases the radius of the flower by growth
(check-expect (grow-flower (make-flower 20 30 5 3)) (make-flower 20 30 8 3))
(check-expect (grow-flower (make-flower 20 30 10 5)) (make-flower 20 30 15 5))

;; (define (grow-flower flower) flower) ; stub

; <use template from flower>

(define (grow-flower flower)
  (make-flower (flower-x flower) (flower-y flower)
               (+ (flower-radius flower) (flower-growth flower))
               (flower-growth flower)))

;; Flower -> Image
;; render flower image to appropriate coordinates on screen
(check-expect (render-flower (make-flower 40 30 5 3))  (place-image (circle 5 "solid" "pink") 40 30 MTS))
(check-expect (render-flower (make-flower 9 50 3 8))   (place-image (circle 3 "solid" "pink") 9 50 MTS))
(check-expect (render-flower (make-flower 20 30 13 3)) (place-image (circle 13 "solid" "pink") 20 30 MTS))

;; (define (render-flower flower) (circle (flower-radius flower) "solid" "pink")) ; stub

; <use template from flower>

(define (render-flower flower) (place-image
                                 (circle (flower-radius flower) "solid" "pink")
                                 (flower-x flower) (flower-y flower) MTS))


;; Flower MouseEvent -> Flower
;; grow a new flower in the location clicked
(check-expect (handle-mouse (make-flower 40 30 5 3) 80 20 "button-down") (make-flower 80 20 5 3))
(check-expect (handle-mouse (make-flower 40 30 5 3) 80 30 "button-up") (make-flower 40 30 5 3))

;; (define (handle-mouse flower x y mouse-event) flower) ; stub

#;
(define (handle-mouse flower x y mouse-event) ; template
  (cond [(mouse=? mouse-event "button-down") (... flower x y)]
        [else
         (... flower x y)]))

(define (handle-mouse flower x y mouse-event)
  (cond [(mouse=? mouse-event "button-down") (make-flower x y (flower-radius flower) (flower-growth flower))]
        [else flower]))

