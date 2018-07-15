;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname compound-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; compound-starter.rkt


;PROBLEM:
;
;Design a data definition to represent hockey players, including both 
;their first and last names.


(define-struct player (firstname lastname))
;; Player is (make-player String String)
;; interp. (make-player firstname lastname) is a hockey player with
;;         firstname is the first name
;;         lastname is the last name
(define Player1 (make-player "Bobby" "Orr"))
(define Player2 (make-player "Wayne" "Gretzky"))

(define (fn-for-player p)
  (... (player-firstname p)    ; String
       (player-lastname p)))   ; String

;; Template rules used:
;; - Compound: 2 fields