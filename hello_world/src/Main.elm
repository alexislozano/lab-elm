module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    Int


type Msg
    = Increment
    | Decrement
    | Reset


init : Model
init =
    0


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0


view : Model -> Html Msg
view model =
    div []
        [ myButton Decrement "-"
        , button [ onClick Reset ] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]


myButton : Msg -> String -> Html Msg
myButton msg label =
    button [ onClick msg ] [ text label ]
