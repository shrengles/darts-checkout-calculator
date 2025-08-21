optRemainder :: Int -> Int
optRemainder n = [2^(x-1) | x <- [1..], 2^x - n > 0] !! 0

dart :: Int -> [String] -> [String]
dart 0 _ = ["0"]
dart 1 _ = ["BUST"]
dart x xs
    | x <= 40 && even x = show (div x 2):"D":xs
    | x <= 40 && odd x = dart (optRemainder x) (" ":show (x-optRemainder x):xs)
    | x == 50 = "BULL":xs
    | x <= 60 = dart 40 (" ":show (x-40):xs)
    | x <= 70 = dart 50 (" ":show (x-50):xs)
    -- | x <= 110 && (even x || x == 75) = dart 50 (dart (x-50) xs)++xs
    -- | x <= 110 && mod x 3 == 0 = dart 50 (show (div x 3):"T":xs)
    | x <= 120 = dart (x-60) ("20 ":"T":xs)
    | x <= 160 && odd x = dart (x-117) ("19 ":"T":"20 ":"T":xs)
    | x <= 160 && even x = dart (x-120) ("20 ":"T":"20 ":"T":xs)
    | x == 170 = dart 50 ("20 ":"T":"20 ":"T":xs)
    | otherwise = ["NO WIN"]

fDart :: Int -> String
fDart n = concat (reverse (dart n []))

listCheckout :: Int -> [String]
listCheckout n = [fDart x | x <- [1..n]]

