module World where

import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss
import Control.Lens

import Constants
import DataTypes
import PlayerMovement

initialState :: GameState
initialState = Game
  {
    players = [Player
      {graphicalComponents = color blue $ circleSolid 40
      ,position = (100, 100)
      ,velocity = (0, 0)
      ,acceleration = (0, 0)}]
  }

render :: GameState -> Picture
render game = pictures (getPicture (players game))

getPicture :: [Entity] -> [Picture]
getPicture = map (\ x -> uncurry translate (position x) (graphicalComponents x))

update :: Float -> GameState -> GameState
update seconds game = updatePhysics game seconds

movePlayer :: Event -> GameState -> Int -> GameState
movePlayer (EventKey k _ _ _) game playerIndex
  | k == Char 'r' = updatePosition game 0 (300, 300)
  | k == Char 'w' = updateVelocity game 0 (0, 100)
  | k == Char 'a' = updateVelocity game 0 (-100, 0)
  | k == Char 's' = updateVelocity game 0 (0, -100)
  | k == Char 'd' = updateVelocity game 0 (100, 0)
movePlayer _ game _ = game

updatePhysics :: GameState -> Float -> GameState
updatePhysics game seconds = Game{players = updatePhysicsEntitites (players game) seconds}

updatePhysicsEntitites :: [Entity] -> Float -> [Entity]
updatePhysicsEntitites [] _ = []
updatePhysicsEntitites (x:xs) seconds = updatePhysicsEntity x seconds : updatePhysicsEntitites xs seconds

updatePhysicsEntity :: Entity -> Float -> Entity
updatePhysicsEntity entity seconds = Player{graphicalComponents = graphicalComponents entity, position = (px', py'), velocity = (vx', vy'), acceleration = (ax', ay')}
  where
    (px, py) = position entity
    (vx, vy) = velocity entity
    (ax, ay) = acceleration entity

    px' = px + vx * seconds
    py' = py + vy * seconds

    vx' = vx + ax * seconds
    vy' = vy + ay * seconds

    ax' = ax
    ay' = ay

















--
