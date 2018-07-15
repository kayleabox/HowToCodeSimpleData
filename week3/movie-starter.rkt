;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname movie-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; movie-starter.rkt

;; =================
;; Data definitions:


;PROBLEM A:
;
;Design a data definition to represent a movie, including  
;title, budget, and year released.
;
;To help you to create some examples, find some interesting movie facts below: 
;"Titanic" - budget: 200000000 released: 1997
;"Avatar" - budget: 237000000 released: 2009
;"The Avengers" - budget: 220000000 released: 2012
;
;However, feel free to resarch more on your own!


(define-struct movie (title budget release-year))
;; Movie is (make-movie String Number Natural)
;; interp. a movie with
;;         title is the movie title
;;         budget is the budget for the movie
;;         release-year is the year the movie was released
(define Movie1 (make-movie "Titanic" 200000000 1997))
(define Movie2 (make-movie "Avatar" 237000000 2009))

(define (fn-for-movie m)
  (... (movie-title m)          ; String
       (movie-budget m)         ; Number
       (movie-release-year m))) ; Natural  

;; Template rules used:
;; - Compound: 3 fields

;; =================
;; Functions:


;PROBLEM B:
;
;You have a list of movies you want to watch, but you like to watch your 
;rentals in chronological order. Design a function that consumes two movies 
;and produces the title of the most recently released movie.
;
;Note that the rule for templating a function that consumes two compound data 
;parameters is for the template to include all the selectors for both 
;parameters.

;; Movie Movie -> String
;; Takes in two movies and returns and returns the title of the
;; most recently released of the two
(check-expect (get-newest-movie (make-movie "Titanic" 200000000 1997)
                                (make-movie "Avatar" 237000000 2009))
                                "Avatar")
(check-expect (get-newest-movie (make-movie "Avengers" 220000000 2012)
                                (make-movie "Avatar" 237000000 2009))
                                "Avengers")


;(define (get-newest-movie movie1 movie2) "Titanic") ; stub

#;
(define (fn-for-movie m1 m2)
  (... (movie-title m1)
       (movie-budget m1)
       (movie-year m1)
       (movie-title m2)
       (movie-budget m2)
       (movie-year m2)))

(define (get-newest-movie movie1 movie2)
  (cond [(> (movie-release-year movie1) (movie-release-year movie2)) (movie-title movie1)]
        [else (movie-title movie2)]))  
