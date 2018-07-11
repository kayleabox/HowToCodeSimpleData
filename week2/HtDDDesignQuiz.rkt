;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDDDesignQuiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; HtDD Design Quiz

;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
  (... a))

;; Template rules used:
;; - atomic non-distinct: Natural


;Problem 1:
;
;Consider the above data definition for the age of a person.
;
;Design a function called teenager? that determines whether a person
;of a particular age is a teenager (i.e., between the ages of 13 and 19)

;; Age -> Boolean
;; This functions takes in an Age and returns true if the Age is between 13 and 19
(check-expect (teenager? 4) false)
(check-expect (teenager? 13) true)
(check-expect (teenager? 14) true)
(check-expect (teenager? 19) true)
(check-expect (teenager? 20) false)

;;(define (teenager? age) false) ;stub

;<use template from Age>

(define (teenager? age)
  (and (> age 12) (< age 20)))


;Problem 2:
;
;Design a data definition called MonthAge to represent a person's age
;in months.

;; MonthAge is Natural
;; interp. the age of a person in months
(define MonthAge0 12)
(define MonthAge1 25)

#;
(define (fn-for-monthage monthage)
  (... monthage))

;; Template rules used:
;; - atomic non-distinct: Natural



;Problem 3:
;
;Design a function called months-old that takes a person's age in years 
;and yields that person's age in months.

;; Age -> MonthAge
;; Takes in a person's age in years and returns their age in months
(check-expect (months-old 3) 36)
(check-expect (months-old 7) 84)
(check-expect (months-old 5.5) 66)

;; (define (months-old monthage) 0) ; stub

; <use template from Age>

(define (months-old age)
  (* age 12))


;Problem 4:
;
;Consider a video game where you need to represent the health of your
;character. The only thing that matters about their health is:
;
;  - if they are dead (which is shockingly poor health)
;  - if they are alive then they can have 0 or more extra lives
;
;Design a data definition called Health to represent the health of your
;character.
;
;Design a function called increase-health that allows you to increase the
;lives of a character.  The function should only increase the lives
;of the character if the character is not dead, otherwise the character
;remains dead.

;; Health is one of:
;; - "alive"
;; - "dead"
;; interp. the health of a person
;; <examples are redundant for enumerations>
#;
(define (fn-for-health health)
  (cond [(string=? health "alive") (...)]
        [(string=? health "dead") (...)]))

;; Template rules used:
;; one-of: 2 cases
;; atomic distinct: "alive"
;; atomic distinct: "dead"

;; Natural -> Natural
;; increase the lives of the character if the character is not dead
(check-expect (increase-health 3 "alive") 4)
(check-expect (increase-health 28 "alive") 29)
(check-expect (increase-health 0 "dead") 0)
#;
(define (fn-for-health health) ; stub
  (cond [(string=? health "alive") 4]
        [(string=? health "dead") 0]))

; <use template from Health>

(define (increase-health lives health)
  (cond [(string=? health "alive") (+ lives 1)]
        [else 0]))