# project-euler
These are my Haskell solutions to some of the Project Euler problems. I will add more, along with some commentary, as I have time to do so. The problems can be found at https://projecteuler.net.

Problem 1:

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.

```
p1 = sum [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]
```

This problem is pretty straightforward, taking advantage of list comprehensions.
