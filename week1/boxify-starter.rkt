;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boxify-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; boxify-starter.rkt

;PROBLEM:
;
;Use the How to Design Functions (HtDF) recipe to design a function that consumes an image, 
;and appears to put a box around it. Note that you can do this by creating an "outline" 
;rectangle that is bigger than the image, and then using overlay to put it on top of the image. 
;For example:
;
;(boxify (ellipse 60 30 "solid" "red")) should produce
;(overlay (rectangle 62 32 "outline" "black")
;                       (ellipse 60 30 "solid" "red"))
;
;Remember, when we say DESIGN, we mean follow the recipe.
;
;Leave behind commented out versions of the stub and template.

;; Image -> Image
;; take in an image and return that image with a rectangle around it
(check-expect (boxify (ellipse 60 30 "solid" "red"))
              (overlay (rectangle 62 32 "outline" "black")
                       (ellipse 60 30 "solid" "red")))
(check-expect (boxify (circle 15 "solid" "red")) 
              (overlay (rectangle 32 32 "outline" "black")
                       (circle 15 "solid" "red")))
(check-expect (boxify (star 40 "solid" "gray")) 
              (overlay (rectangle 67 64 "outline" "black")
                       (star 40 "solid" "gray")))

;(define (boxify img) img) ; stub
;(define (boxify img) ;template
;  (... img))

(define (boxify img)
  (overlay (rectangle (+ 2 (image-width img))
                      (+ 2 (image-height img))
                      "outline" "black") img))
