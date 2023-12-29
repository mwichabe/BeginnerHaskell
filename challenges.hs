-- Challenges.hs

module Challenges where

import Data.List (nub)

-- Part I: Circuit Puzzles

data Edge = North | East | South | West deriving (Eq, Ord, Show, Read)
data Tile = Source [Edge] | Sink [Edge] | Wire [Edge] deriving (Eq, Show, Read)
type Puzzle = [[Tile]]
data Rotation = R0 | R90 | R180 | R270 deriving (Eq, Show, Read)

-- Challenge 1: Completedness of circuits
isPuzzleComplete :: Puzzle -> Bool
isPuzzleComplete puzzle = all (all isTileComplete) puzzle

isTileComplete :: Tile -> Bool
isTileComplete (Source edges) = length edges == 1
isTileComplete (Sink edges) = length edges == 1
isTileComplete (Wire edges) = length edges >= 2

-- Challenge 2: Solve a Circuit Puzzle
solveCircuit :: Puzzle -> Maybe [[Rotation]]
solveCircuit puzzle = undefined  -- Your implementation here

-- Part II: Parsing and Printing

data LExpr = Var Int | App LExpr LExpr | Let Bind LExpr LExpr | Pair LExpr LExpr | Fst LExpr | Snd LExpr | Abs Bind LExpr
  deriving (Eq, Show, Read)
data Bind = Discard | V Int deriving (Eq, Show, Read)

-- Challenge 3: Pretty Printing a Let_x Expression
prettifyLetX :: LExpr -> String
prettifyLetX (Var x) = "x" ++ show x
prettifyLetX (App e1 e2) = "(" ++ prettifyLetX e1 ++ " " ++ prettifyLetX e2 ++ ")"
prettifyLetX (Let bind e1 e2) = "let " ++ prettifyBind bind ++ " = " ++ prettifyLetX e1 ++ " in " ++ prettifyLetX e2
prettifyLetX (Pair e1 e2) = "(" ++ prettifyLetX e1 ++ ", " ++ prettifyLetX e2 ++ ")"
prettifyLetX (Fst e) = "fst " ++ prettifyLetX e
prettifyLetX (Snd e) = "snd " ++ prettifyLetX e
prettifyLetX (Abs bind e) = "\\" ++ prettifyBind bind ++ " -> " ++ prettifyLetX e

prettifyBind :: Bind -> String
prettifyBind Discard = "_"
prettifyBind (V x) = "x" ++ show x


-- Challenge 4: Parsing Let_x Expressions
parseLetX :: String -> Maybe LExpr
parseLetX input = undefined  -- Your implementation here

-- Part III: Encoding Let_x in Lambda Calculus

data LamExpr = LamVar Int | LamApp LamExpr LamExpr | LamAbs Int LamExpr
  deriving (Eq, Show, Read)

-- Challenge 5: Converting Arithmetic Expressions to Lambda Calculus
letEnc :: LExpr -> LamExpr
letEnc lexpr = undefined  -- Your implementation here

-- Challenge 6: Counting and Comparing Let_x Reductions
compareRedn :: LExpr -> Int -> (Int, Int, Int, Int)
compareRedn lexpr limit = undefined  -- Your implementation here
