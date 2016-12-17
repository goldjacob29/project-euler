# project-euler
These are my Haskell solutions to some of the Project Euler problems. This project is mostly for practice using github, as well as serving as a place to store my solutions. I will add more, along with some commentary, as I have time to do so. The problems can be found at https://projecteuler.net.

Problem 1:

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.

```
p1 = sum [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]
```

Problem 4:

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.

```
middle [] = []
middle (x:[]) = []
middle (x:xs) = tail $ init (x:xs) 

isPalindrome [] = True
isPalindrome (xs) = (head xs == last xs) && isPalindrome (middle xs)

p4 = maximum [z | x <- [100..999], y <- [100..999], let z = x * y, (isPalindrome $ show z) == True]
```
