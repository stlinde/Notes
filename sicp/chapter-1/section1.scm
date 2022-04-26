; Section 1 - The Elements of Programming

; Procedure for squaring
(define (square x)
 (* x x))

; Procedure for sum of squares
(define (sum-of-squares x y)
  (+ (square x) (square y)))

; Procedure for computing absolute value of number
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) x)
        ((< x 0) (- x))))

; Exercise 1.2
; (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

; Exercise 1.3
(define (sum-squares-two-largest x y z)
  (cond ((and (< x y) (< x z)) (sum-of-squares y z))
        ((< y z) (sum-of-squares x y))
        (else (sum-of-squares x z))))
        

; Newton's method for finding square roots
; How to run the itereation until you are satisfied with the answer.
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

; How to improve the guess at each iteration.
(define (improve guess x)
  (average guess (/ x guess)))

; Helper function defining how to compute the average of two numbers.
(define (average x y)
  (/ (+ x y) 2))

; Conditional function checking whether we are satisfied with our guess.
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

; Collecting all of the above into a function that computes the square root.
(define (sqrt x)
  (sqrt-iter 1.0 x))

; Exercise 1.8
(define (cube-iter guess x)
  (if (good-enough-cube? guess x)
    guess
    (cube-iter (improve-cube guess x))))

(define (improve-cube guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube x)
  (* x x x))

(define (good-enough-cube? guess x)
  (< (abs (- (cube guess) x)) 0.0001))

(define (cube-root x)
  (cube-iter (1.0 x)))

(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))

(factorial 5)
