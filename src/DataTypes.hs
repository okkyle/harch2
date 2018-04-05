module DataTypes where

import Graphics.Gloss
import Control.Lens

data Entity = Player
    {graphicalComponents::Picture
    ,position::(Float, Float)
    ,velocity::(Float, Float)
    ,acceleration::(Float, Float)
    }

newtype GameState = Game
      {players::[Entity]
      }
