module Main(main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

import World
import Constants
import DataTypes

window :: Display
window = InWindow "hArcanists Alpha" (width, height) (offset, offset)

background :: Color
background = light $ light $ light blue

handleKeys :: Event -> GameState -> GameState
handleKeys event game = movePlayer event game 0

main :: IO ()
main = play window background fps initialState render handleKeys update
