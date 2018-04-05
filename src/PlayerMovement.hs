module PlayerMovement where

import Control.Lens

import Constants
import DataTypes

updatePosition :: GameState -> Int -> (Float, Float) -> GameState
updatePosition game playerIndex position' = game'
    where game' = Game{
      players =
        (element playerIndex .~ Player
            {graphicalComponents = graphicalComponents (players game !! playerIndex)
            ,position = position'
            ,velocity = velocity (players game !! playerIndex)
            ,acceleration = acceleration (players game !! playerIndex)
            })
(players game)}

updateVelocity :: GameState -> Int -> (Float, Float) -> GameState
updateVelocity game playerIndex velocity' = game'
    where game' = Game{
      players =
        (element playerIndex .~ Player
            {graphicalComponents = graphicalComponents (players game !! playerIndex)
            ,position = position (players game !! playerIndex)
            ,velocity = velocity'
            ,acceleration = acceleration (players game !! playerIndex)
            })
(players game)}

updateAcceleration :: GameState -> Int -> (Float, Float) -> GameState
updateAcceleration game playerIndex acceleration' = game'
    where game' = Game{
      players =
        (element playerIndex .~ Player
            {graphicalComponents = graphicalComponents (players game !! playerIndex)
            ,position = position (players game !! playerIndex)
            ,velocity = velocity (players game !! playerIndex)
            ,acceleration = acceleration'
            })
(players game)}
