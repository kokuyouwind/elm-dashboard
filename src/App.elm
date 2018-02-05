module App exposing (main)

import Html exposing (..)
import Markdown
import Material
import Material.Color as Color
import Material.Scheme as Scheme
import Material.Card as Card
import Material.Textfield as Textfield
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

type alias Model =
  { mdl : Material.Model
  , markdown : String
  }

model : Model
model =
  { mdl = Material.model
  , markdown = ""
  }

type Msg =
    Mdl (Material.Msg Msg)
  | UpdateMd String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Mdl msg_ -> Material.update Mdl msg_ model
    UpdateMd md -> ({ model | markdown = md }, Cmd.none)

view : Model -> Html Msg
view model =
  div []
    [ Scheme.topWithScheme Color.Teal Color.Red <| grids model
    ]

grids model =
  grid []
    [ cell [ size All 6 ] [ textfieldCard model ]
    , cell [ size All 6 ] [ markdownCard model ]
    ]

textfieldCard model =
  Card.view
    [ Elevation.e2
    , css "width" "100%"
    ]
    [ Card.text [] [ textfield model ]
    ]


textfield model =
  Textfield.render Mdl [9] model.mdl
    [ Textfield.floatingLabel
    , Textfield.textarea
    , Textfield.rows <| List.length (String.lines model.markdown) + 1
    , Textfield.value model.markdown
    , Options.onInput UpdateMd
    , css "width" "100%"
    , css "resize" "none"
    ]
    []

markdownCard model =
  Card.view
    [ Elevation.e2
    , css "width" "100%" ]
    [ Card.text [] [ Markdown.toHtml [] model.markdown ]
    ]
