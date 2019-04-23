module Blog exposing (..)

import Graphql.Document as Document
import Graphql.Operation exposing (RootQuery)
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, with)
import Graphql.Http
import IaosPosts.Object.Document exposing (..)
import IaosPosts.Object
import IaosPosts.Query as Query
import IaosPosts.Scalar exposing (..)
import RemoteData exposing (RemoteData)

--query {
--    documents {
--        title
--        slug
--        category
--        body
--    }
--}
type alias Response =
    Document

query : SelectionSet Response RootQuery
query =
    Query.documents identity
        (SelectionSet.succeed Document
            |> with Document.title
            |> with Document.slug
            |> with Document.category
            |> with Document.body)

type alias Document =
    {
        title: String
      , slug: String
      , category: String
      , body: String
    }

documentSelection : SelectionSet Document IaosPosts.Object.Document
documentSelection =
    SelectionSet.map4 Document
        Document.title
        Document.slug
        Document.category
        Document.body

makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphql.Http.queryRequest "https://elm-graphql.herokuapp.com"
        |> Graphql.Http.send (RemoteData.fromResult >> GotResponse)

type Msg
    = GotResponse Model


type alias Model =
    RemoteData (Graphql.Http.Error Response) Response


type alias Flags =
    ()


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( RemoteData.Loading, makeRequest )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse response ->
            ( response, Cmd.none )


--main : Helpers.Main.Program Flags Model Msg
--main =
--    Helpers.Main.document
--        { init = init
--        , update = update
--        , queryString = Document.serializeQuery query
--        }
