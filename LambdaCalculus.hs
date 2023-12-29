-- LambdaCalculus.hs
module LambdaCalculus where

-- Define your data types for LExpr here
data LExpr = Var Int | App LExpr LExpr | Let Bind LExpr LExpr | Pair LExpr LExpr | Fst LExpr | Snd LExpr | Abs Bind LExpr
data Bind = V Int | Discard

-- Other functions you have defined for this module

getBinder :: Bind -> Int
getBinder Discard = -1  -- Use a special value for discard
getBinder (V n) = n

-- Your existing code for the 'freeVars' function goes here
freeVars :: LExpr -> [Int]
freeVars (Var n) = [n]
freeVars (App e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Let bind e1 e2) = freeVars e1 ++ filter (/= getBinder bind) (freeVars e2)
freeVars (Pair e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Fst e) = freeVars e
freeVars (Snd e) = freeVars e
freeVars (Abs bind e) = filter (/= getBinder bind) (freeVars e)
