;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname quizone) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;PROBLEM:
;
;Design a function that consumes two images and produces true
;if the first is larger than the second.
;
;Complete your design using DrRacket. When you are done,
;you must submit something in this box in order to unlock the assessment rubric,
;but when you are doing your assessment, grade your submission in DrRacket where
;indentation and formatting will be preserved.
;
;Be sure to watch the evaluation video before completing your assessment.

;; Image Image -> Boolean
;; take in two images and return true if the first image is larger than the second image
(check-expect (check-imageone-larger-imagetwo
                                             (rectangle 20 30 "outline" "black")
                                             (rectangle 2 30 "outline" "black")) true)
(check-expect (check-imageone-larger-imagetwo
                                             (rectangle 20 30 "outline" "black")
                                             (rectangle 20 30 "outline" "black")) false)
(check-expect (check-imageone-larger-imagetwo
                                             (rectangle 15 5 "outline" "black")
                                             (rectangle 20 30 "outline" "black")) false)

;(define (check-imageone-larger-imagetwo imgone imgtwo) false) ; stub

;(define (check-imageone-larger-imagetwo imgone imgtwo) ; template
;  (...imgone imgtwo))

(define (check-imageone-larger-imagetwo imgone imgtwo)
  (> (* (image-width imgone) (image-height imgone)) (* (image-width imgtwo) (image-height imgtwo))))