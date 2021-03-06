-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module IaosPosts.ScalarCodecs exposing (Date, Json, codecs)

import IaosPosts.Scalar exposing (defaultCodecs)
import Json.Decode as Decode exposing (Decoder)


type alias Date =
    IaosPosts.Scalar.Date


type alias Json =
    IaosPosts.Scalar.Json


codecs : IaosPosts.Scalar.Codecs Date Json
codecs =
    IaosPosts.Scalar.defineCodecs
        { codecDate = defaultCodecs.codecDate
        , codecJson = defaultCodecs.codecJson
        }
