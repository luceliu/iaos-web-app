module Blog exposing (..)

import Graphql.Operation exposing (RootQuery)
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import IaosPosts.Object.Document as Document
import IaosPosts.Query as Query
import IaosPosts.Scalar exposing (..)

query : SelectionSet (Maybe Document) RootQuery
query =
    Query.document documentSelection

type alias Document =
    {
        title: String
      , slug: String
      , category: String
      , body: String
    }

documentSelection : SelectionSet Document Document
documentSelection =
    SelectionSet.map4 Document
        Document.title
        Document.slug
        Document.category
        Document.body
