module Main exposing (..)

import Browser
import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Html exposing (Html)


main =
    Browser.sandbox
        { init = 0
        , update = update
        , view = view
        }


type Msg
    = Increment
    | Decrement
    | Reset


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0


view model =
    Element.layout
        [ Background.color backgroundColor
        ]
    <|
        Element.row
            [ Element.centerX
            , Element.centerY
            , Element.spacing 10
            ]
            [ button (Just Decrement) "-"
            , button (Just Reset) (String.fromInt model)
            , button (Just Increment) "+"
            ]


button : Maybe Msg -> String -> Element Msg
button maybeMsg text =
    Input.button
        [ Border.width 1
        , Border.rounded 4
        , Element.width (Element.px 50)
        , Element.height (Element.px 50)
        , Background.color whiteColor
        ]
        { onPress = maybeMsg
        , label =
            Element.el
                [ Element.centerX
                , Element.centerY
                ]
            <|
                Element.text text
        }


backgroundColor : Element.Color
backgroundColor =
    Element.rgb255 250 250 240


greyColor : Int -> Element.Color
greyColor i =
    Element.rgb255 i i i


whiteColor : Element.Color
whiteColor =
    greyColor 255
