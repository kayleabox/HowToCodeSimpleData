;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bump-up-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; bump-up-starter.rkt

;PROBLEM:
;Using the LetterGrade data definition below design a function that
;consumes a letter grade and produces the next highest letter grade. 
;Call your function bump-up.


;; Data definitions:

;; LetterGrade is one of:
;; - "A"
;; - "B"
;; - "C"
;; interp. the letter grade in a course
;; <examples are redundant for enumerations>
#;
(define (fn-for-letter-grade lettergrade)
  (cond [(string=? lettergrade "A") (...)]
        [(string=? lettergrade "B") (...)]
        [(string=? lettergrade "C") (...)]))

;; Template rules used:
;; one-of: 3 cases
;; atomic distinct: "A"
;; atomic distinct: "B"
;; atomic distinct: "C"


;; Functions:

;; LetterGrade -> LetterGrade
;; produce next highest letter grade (no change for A)
(check-expect (bump-up "A") "A")
(check-expect (bump-up "B") "A")
(check-expect (bump-up "C") "B")

;(define (bump-up lettergrade) "A") ;stub
;<use template from LetterGrade>

(define (bump-up lettergrade)
  (cond [(string=? lettergrade "A") "A"]
        [(string=? lettergrade "B") "A"]
        [(string=? lettergrade "C") "B"]))