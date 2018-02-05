module App exposing (main)

import Html exposing (..)
import Markdown
import Material
import Material.Color as Color
import Material.Scheme as Scheme
import Material.Card as Card
import Material.Options as Options exposing (css)
import Material.Elevation as Elevation
import Material.Grid exposing (grid, cell, size, Device(..))

main : Program Never Model Msg
main =
  program
    { init = (model, Cmd.none)
    , update = update
    , view = view
    , subscriptions = always Sub.none }

type alias Model = { mdl : Material.Model }

model : Model
model = { mdl = Material.model }

type Msg = Mdl (Material.Msg Msg)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Mdl msg_ -> Material.update Mdl msg_ model

view : Model -> Html Msg
view model =
  div []
    [ Scheme.topWithScheme Color.Teal Color.Red grids
    ]

grids =
  grid []
    [ cell [ size All 6 ] [ card ]
    , cell [ size All 6 ] [ card ]
    , cell [ size All 4 ] [ card ]
    , cell [ size All 4 ] [ card ]
    , cell [ size All 4 ] [ card ]
    , cell [ size All 3 ] [ card ]
    , cell [ size All 3 ] [ card ]
    , cell [ size All 3 ] [ card ]
    , cell [ size All 3 ] [ card ]
    ]

card = Card.view
  [ Elevation.e2
  , css "width" "100%" ]
  [ Card.text [] [ Markdown.toHtml [] markdown ]
  ]

markdown = """
# This is Title
## This is Header
### This is SubHeader

test strings

 * test
 * test
 * test
"""