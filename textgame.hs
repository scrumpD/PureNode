-- textgame.hs
-- text-adventure game
module Main where

import System.Environment   
import Data.List 
import qualified Data.Map.Strict as Map 

data Model = Model {
    reply :: Int 

}

m = Map.fromList [(1, node1), (2, node2), (3, node3), (4, node4), (5, node5), (6, node6), (7, node7), (8, node8), (9, node9)]

data Node = Node {
    prompt :: String, 

    option1 :: String, 
    goto1 :: Int, 
    option2 :: String,
    goto2 :: Int,
    option3 :: String,
    goto3 :: Int  
} deriving (Show)

node1 = Node {
    prompt = "Hey there. Say something. (Respond with Integer)",

    option1 = "",
    goto1 = 2, 
    option2 = "",
    goto2 = 2, 
    option3 = "",
    goto3 = 2 
}

node2 = Node {
    prompt = "We're going on a quest. Prove your worth.",

    option1 = "(Say nothing)",
    goto1 = 3, 
    option2 = "(Do a lousy backflip)",
    goto2 = 4, 
    option3 = "(Cry)",
    goto3 = 5 
}

node3 = Node {
    prompt = "Well, you're the quiet type. Where's your equipment?",

    option1 = "(Right here)",
    goto1 = 6, 
    option2 = "(I don't have any)",
    goto2 = 7, 
    option3 = "",
    goto3 = 3 
}

node4 = Node {
    prompt = "Why did you do that? Where's your equipment?",

    option1 = "(Right here)",
    goto1 = 6, 
    option2 = "(I don't have any)",
    goto2 = 7, 
    option3 = "",
    goto3 = 4 
}

node5 = Node {
    prompt = "I'd prefer you not weep. Where's your equipment?",

    option1 = "(Right here)",
    goto1 = 6, 
    option2 = "(I don't have any)",
    goto2 = 7, 
    option3 = "",
    goto3 = 5
}

node6 = Node {
    prompt = "Cool. I say we get going with our quest.",

    option1 = "(For sure)",
    goto1 = 8, 
    option2 = "(No, I'm scared)",
    goto2 = 9, 
    option3 = "(Whatever you say.)",
    goto3 =  10

}

node7 = Node {
    prompt = "Here take this weapon. (Taser added)",

    option1 = "(For sure)",
    goto1 = 8, 
    option2 = "(No, I'm scared)",
    goto2 = 9, 
    option3 = "(Whatever you say.)",
    goto3 = 10

}

node8 = Node {
    prompt = "Great. Now let's do that epic thing I promised!",

    option1 = "(What thing?)",
    goto1 = 1, 
    option2 = "(Absolutely!)",
    goto2 = 2, 
    option3 = "(Uh, yeah. Fine.)",
    goto3 = 3 

}

node9 = Node {
    prompt = "You don't have a choice. If you're scared, so be it. Now let's do that thing I promised.",

    option1 = "(What thing?)",
    goto1 = 1, 
    option2 = "(Absolutely!)",
    goto2 = 2, 
    option3 = "(Uh, yeah. Fine.)",
    goto3 = 3 

}

node10 = Node {
    prompt = "I recommend you cut the attitude. Now let's do that thing.",

    option1 = "(What thing?)",
    goto1 = 1, 
    option2 = "(Absolutely!)",
    goto2 = 2, 
    option3 = "(Uh, yeah. Fine.)",
    goto3 = 3 

}

main :: IO ()
main = do

    putStrLn "INSTRUCTIONS: #'s (1-3) correspond to in-text."

    core1 1
 
    putStrLn (show(node1))

    putStrLn "Thanks for playing."

core1 :: Int -> IO Int 
core1 i = do 
 
    let 
        n = m Map.! i 

    putStrLn (prompt n)
    putStrLn ((option1 n) ++ "     " ++ (option2 n) ++  "     " ++ (option3 n))

    putStrLn (show i)

    ln <- getLine 
    let
        input = (read ln :: Int)

        x | input == 1 = goto1 n
            | input == 2 = goto2 n
            | input == 3 = goto3 n
            | otherwise = 1

    core1 x 