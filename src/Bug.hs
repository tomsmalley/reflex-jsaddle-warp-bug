{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Bug where

import Control.Monad ((<=<))
import Data.Text (Text)
import Language.Javascript.JSaddle

import Reflex
import Reflex.Dom.Core

main :: JSM ()
main = mainWidget widget

widget :: forall t m. MonadWidget t m => m ()
widget = do
  let send = never :: Event t [Text]
  ws <- webSocket "ws://localhost:8080" $ WebSocketConfig send never True
  display <=< holdDyn False $ leftmost [ True <$ _webSocket_open ws, False <$ _webSocket_close ws ]

