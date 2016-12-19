middle [] = []
middle (x:[]) = []
middle (x:xs) = tail $ init (x:xs) 

isPalindrome [] = True
isPalindrome (xs) = (head xs == last xs) && isPalindrome (middle xs)

p4 = maximum [z | x <- [100..999], y <- [100..999], let z = x * y, (isPalindrome $ show z) == True]
