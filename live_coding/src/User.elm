module User exposing (Gender(..), User, load, view)

import Element exposing (Element)
import Element.Font as Font
import Http
import Json.Decode as Decode exposing (Decoder, field, list, string)
import Json.Decode.Pipeline exposing (required)


type alias User =
    { firstName : String
    , lastName : String
    , gender : Gender
    }


type Gender
    = Woman
    | Man
    | Other


view : User -> Element msg
view user =
    Element.el
        [ Font.color <|
            case user.gender of
                Woman ->
                    Element.rgb255 10 45 200

                Man ->
                    Element.rgb255 200 10 40

                Other ->
                    Element.rgb255 10 200 40
        ]
    <|
        Element.text <|
            user.firstName
                ++ " "
                ++ user.lastName


load :
    (Result Http.Error (List User) -> msg)
    -> Cmd msg
load msg =
    Http.get
        { url = "https://randomuser.me/api/"
        , expect = Http.expectJson msg userDecoder
        }


userDecoder : Decoder (List User)
userDecoder =
    field "results" <|
        list
            (Decode.succeed User
                |> required "name" (nameDecoder "first")
                |> required "name" (nameDecoder "last")
                |> required "gender" genderDecoder
            )


nameDecoder : String -> Decoder String
nameDecoder key =
    field key string


genderDecoder : Decoder Gender
genderDecoder =
    string
        |> Decode.andThen
            (\gender ->
                Decode.succeed <|
                    case gender of
                        "male" ->
                            Man

                        "female" ->
                            Woman

                        _ ->
                            Other
            )
