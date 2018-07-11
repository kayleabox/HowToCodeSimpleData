;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname letter-grade-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;PROBLEM:
;
;As part of designing a system to keep track of student grades, you
;are asked to design a data definition to represent the letter grade 
;in a course, which is one of A, B or C.

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