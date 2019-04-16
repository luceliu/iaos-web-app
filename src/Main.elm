module Main exposing (..)
import Browser
import Html exposing (Html, text, div, h1, img,p,button, input)
import Html.Attributes exposing (..)
import Html.Events exposing(..)
import Http
import Json.Decode exposing (Decoder, field, string)

---- MODEL ----

-- type Status
--   = Failure
--   | Loading
--   | Success String

type alias Model =
    {
        breed : String
        , status : String
        , url : String
    }
    

init : ( Model, Cmd Msg )
init =
    ( Model "African" "" "", getDogPic "African")



---- UPDATE ----

-- https://dog.ceo/api/breed/  --- /images/random



--Get dog picture

-- fetchDog: String -> (Model, Cmd Msg)
-- fetchDog breedurl =
--     -- (Loading
--     -- , Http.get
--     --     {
--     --         url = "https://dog.ceo/api/breed/hound/images"
--     --         , expect = Http.expectJson GotImg imgDecoder
--     --     }
--     -- )
--     *()



type Msg
    = SetBreed String
    | SearchCustom
    | CustomBreed String
    | GotImg (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SearchCustom ->
            ({model | status = "Loading"}, getDogPic model.breed)
        CustomBreed value ->
            ({model | breed = value}, Cmd.none)
        SetBreed breed ->
            ({model | breed = breed, status ="Loading"}, getDogPic breed)
        GotImg result ->
            case result of
                Ok url ->
                    ({model | url = url, status = "Success"}, Cmd.none)
                
                Err _ -> 
                    ({model | status = "Failure"}, Cmd.none)
    

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

userBreed : { breed : String}
userBreed =
    { breed = "African"
    }


---- VIEW ----


view : Model -> Html Msg

view model =
    div [ ] [
        h1 [ ] [ text ("Random Dog from breeds!")]
        , viewDog model 

    ]

viewDog: Model -> Html Msg
viewDog model =
    if model.status == "Failure" then
            div []
                [ text "Can not find this breed"
                , button [ onClick (SetBreed "Shiba") ] [ text "Try Again!" ]
                ]

    else if model.status == "Loading" then
            text "Loading..."

    else
        div []
            [   div []
                [
                button [onClick (SetBreed "Shiba")] [ text "Shiba" ]
                , button [ onClick (SetBreed "Doberman") ] [ text "Doberman" ]
                , button [ onClick (SetBreed "Boxer")] [ text "Boxer" ]
                , button [ onClick (SearchCustom)] [ text "Search:" ]
                , input [ placeholder "Try a breed!", onInput CustomBreed ] [text model.breed]
                ]
                ,div []
                [
                    img [ src model.url ] []
                ]
                , div[]
                [
                    button [onClick (SearchCustom)] [ text "More like this!" ]
                ]
                
                

            ]
                

-- HTTP APi stuff


getDogPic : String -> Cmd Msg
getDogPic breed =
  Http.get
    { url = ("https://dog.ceo/api/breed/" ++ breed ++ "/images/random")
    , expect = Http.expectJson GotImg imgDecoder
    }

imgDecoder : Decoder String
imgDecoder =
  field "message" string


---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = subscriptions 
        }
