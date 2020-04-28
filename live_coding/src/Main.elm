-- UI to https://randomuser.me/api/


module Main exposing (..)

import Browser
import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Html exposing (Html)
import Http
import User exposing (User)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    { counter : Int
    , user : Maybe User
    }


type Msg
    = Increment
    | Decrement
    | Reset
    | LoadUser
    | UserLoaded (Result Http.Error (List User))


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model 0 Nothing, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | counter = model.counter + 1 }, Cmd.none )

        Decrement ->
            ( { model | counter = model.counter - 1 }, Cmd.none )

        Reset ->
            ( { model | counter = 0 }, Cmd.none )

        LoadUser ->
            ( model, User.load UserLoaded )

        UserLoaded (Ok userList) ->
            ( { model | user = List.head userList }, Cmd.none )

        UserLoaded (Err e) ->
            ( { model | user = Nothing }, Cmd.none )


view : Model -> Html Msg
view model =
    Element.layout
        [ Background.color backgroundColor
        ]
    <|
        Element.column
            [ Element.centerX
            , Element.centerY
            , Element.spacing 10
            ]
            [ case model.user of
                Just user ->
                    User.view user

                Nothing ->
                    Element.text "No User for now"
            , refreshButton "Refresh user"
            , Element.row
                [ Element.spacing 10
                ]
                [ button (Just Decrement) "-" whiteColor
                , button (Just Reset) (String.fromInt model.counter) <| centerColor model.counter
                , button (Just Increment) "+" whiteColor
                ]
            ]


refreshButton : String -> Element Msg
refreshButton text =
    Input.button
        [ Border.width 1
        , Border.rounded 4
        , Background.color whiteColor
        , Element.padding 10
        ]
        { onPress = Just LoadUser
        , label = Element.text text
        }


centerColor : Int -> Element.Color
centerColor counter =
    if counter >= 5 then
        Element.rgb255 0 255 0

    else
        whiteColor


button : Maybe Msg -> String -> Element.Color -> Element Msg
button maybeMsg text color =
    Input.button
        [ Border.width 1
        , Border.rounded 4
        , Element.width (Element.px 50)
        , Element.height (Element.px 50)
        , Background.color color
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
    Element.rgb255 250 250 200


greyColor : Int -> Element.Color
greyColor i =
    Element.rgb255 i i i


whiteColor : Element.Color
whiteColor =
    greyColor 255
