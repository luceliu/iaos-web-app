module Main exposing (main)

import Browser exposing (Document, UrlRequest(..))
import Css as CSS exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Styles exposing (..)
import Elements exposing (..)
import Browser.Navigation as Nav
import Url exposing (Url)
import Url.Parser as UrlParser exposing ((</>))

-- PAGES
import Pages exposing (..)

{-| A plain old record holding a couple of theme colors.
-}
theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }

mycolors : {black : Color}
mycolors =
    { black = rgb 0 0 0}


{-| Css.property lets you define custom properties, using strings as their values.
-}
legacyBorderRadius : String -> Style
legacyBorderRadius amount =
    CSS.batch
        [ CSS.property "-moz-border-radius" amount
        , CSS.property "-webkit-border-top-left-radius" amount
        , CSS.property "-webkit-border-top-right-radius" amount
        , CSS.property "-webkit-border-bottom-right-radius" amount
        , CSS.property "-webkit-border-bottom-left-radius" amount
        , CSS.property "border-radius" amount
        ]

view : Model -> Document Msg

view model =
    let
        menu =
                div [ css [ headroomUnfixedStyle ]]
                [ div [css [padding (px 20), float right ] ]
                 [a [ css [ navBarLinks ], href "/" ] [ text "Home" ]
                , a [ css [ navBarLinks ], href "/about" ] [ text "About" ]
                , a [ css [ navBarLinks ], href "/events" ] [ text "Events" ]
                , a [ css [ navBarLinks ], href "/blog" ] [ text "Blog" ]
                , a [ css [ navBarLinks ], href "/team" ] [ text "Team" ]
                , a [ css [ navBarLinks ], href "/contact" ] [ text "Contact" ]
                ]]

        pageBody =
            case model.route of
                Just route ->
                    case Tuple.first route of
                        "about" -> Pages.about
                        "events" -> Pages.events
                        "blog" -> Pages.blog
                        "team" -> Pages.team
                        "contact" -> Pages.contact
                        _ -> Pages.home

                Nothing ->
                    Pages.home

        title =
            case model.route of
                Just route ->
                    case Tuple.first route of
                        "about" -> "About"
                        "events" -> "Events"
                        "blog" -> "Blog"
                        "team" -> "Team"
                        "contact" -> "Contact"
                        _ -> "Home"

                Nothing ->
                    "Home"
    in
    { title = title
    , body = List.map toUnstyled
        [ menu
        , h2 [] [ text title ]
        , pageBody
        ]
    }

main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = ClickLink
        , onUrlChange = ChangeUrl
        }


update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
    case msg of
        ChangeUrl url ->
            ( { model | route = UrlParser.parse docsParser url }, Cmd.none )

        ClickLink urlRequest ->
            case urlRequest of
                Internal url ->
                    ( model, Nav.pushUrl model.navKey <| Url.toString url )

                External url ->
                    ( model, Nav.load url )


type Msg
    = ChangeUrl Url
    | ClickLink UrlRequest

type alias DocsRoute =
    ( String, Maybe String )

type alias Model =
    { navKey : Nav.Key
    , route : Maybe DocsRoute
    }

init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url navKey =
    ( { navKey = navKey, route = UrlParser.parse docsParser url }, Cmd.none )


docsParser : UrlParser.Parser (DocsRoute -> a) a
docsParser =
    UrlParser.map Tuple.pair (UrlParser.string </> UrlParser.fragment identity)