module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import MyStyle as MS
import Task



-- model


type alias Model =
    { value : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { value = "hello" }
    , Cmd.none
    )



-- update


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- view


when flag attr =
    if flag then
        [ attr ]

    else
        []


view : Model -> Html Msg
view model =
    MS.column
        [ MS.class "main", style "height" "100vh" ]
        [ div [ MS.class "nav" ]
            [ div [ MS.class "container" ]
                [ span [ MS.class "nav_brand" ] [ text "Portfolio" ]
                , span [ MS.class "nav_items" ]
                    [ a ([ MS.class "nav_item" ] ++ (linkAttr <| "https://qiita.com/GoldentTuft")) [ text "Qiita" ]
                    , a ([ MS.class "nav_item" ] ++ (linkAttr <| gitHubUrl)) [ text "GitHub" ]
                    ]
                ]
            ]
        , MS.column [ MS.class "content", style "flex-grow" "1" ]
            [ MS.column [ MS.class "container", style "flex-grow" "1" ]
                [ linCal, typingClub, stimer, draggableList, cMen, tsScript, layoutStudy1, layoutStudy2, railsBbsStudy, rvs ]
            , footer
            ]
        ]


gitHubUrl =
    "https://github.com/GoldentTuft"


hostUrl =
    "https://pokosuko.work"


appName =
    "/pf-748"


imageAsset =
    hostUrl ++ appName ++ "/img/"


pubAsset =
    hostUrl ++ appName ++ "/pub/"


linkAttr : String -> List (Attribute Msg)
linkAttr url =
    [ href url
    , rel "noopener"
    , target "_blank"
    , MS.ml MS.g08
    ]


explanation : List (Attribute Msg) -> List (Html Msg) -> Html Msg
explanation attrs children =
    div ([ MS.mt MS.g08 ] ++ attrs) children


linCal : Html Msg
linCal =
    MS.column []
        [ h2 [] [ text "LinCal" ]
        , img [ MS.class "img100", src <| imageAsset ++ "lincal.gif" ] []
        , explanation []
            [ p [] [ text "自前で式を解釈する電卓です。" ]
            , p [] [ text "そのため日付のようなものでも計算できます。" ]
            , p [] [ text "演算子の優先順位が正しく判断されます。" ]
            , p [] [ text "2012年頃作成したものです。" ]
            , p [] [ text "C#で作成しました。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr (pubAsset ++ "LinCal.zip")) [ text "download" ]
            , a (linkAttr (gitHubUrl ++ "/LinCal")) [ text "GitHub" ]
            ]
        ]


typingClub : Html Msg
typingClub =
    MS.column []
        [ h2 [] [ text "TypingClub" ]
        , img [ MS.class "img100", src <| imageAsset ++ "TypingClub.gif" ] []
        , explanation []
            [ p [] [ text "簡単なタイピングゲームでは対応していないn,nn,xnの打ち分けが可能です。" ]
            , p [] [ text "そのアルゴリズム部分も作りました。" ]
            , p [] [ text "お題投稿機能、ランキング機能などあります。" ]
            , p [] [ text "サーバー側はphpとsqliteで作成しました。" ]
            , p [] [ text "フロント側はElmで作成しました。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr <| hostUrl ++ "/typing1/") [ text "site" ]
            , a (linkAttr (gitHubUrl ++ "/TypingClub")) [ text "GitHub" ]
            ]
        ]


stimer : Html Msg
stimer =
    MS.column []
        [ h2 [] [ text "stimer" ]
        , img [ MS.class "img100", src <| imageAsset ++ "stimer.png" ] []
        , explanation []
            [ p [] [ text "指定時刻になると開始し、指定時刻になると終了するタイマーです。" ]
            , p [] [ text "生成されるurlがそのままパラメーターになっています。" ]
            , p [] [ text "1人で使うだけでなく、そのurlを他の人と共有すれば便利かもしれません。" ]
            , p [] [ text "Elmで作成しました。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr <| hostUrl ++ "/stimer/") [ text "site" ]
            , a (linkAttr (gitHubUrl ++ "/stimer")) [ text "GitHub" ]
            ]
        ]


draggableList : Html Msg
draggableList =
    MS.column []
        [ h2 [] [ text "draggable list" ]
        , img [ MS.class "img100", src <| imageAsset ++ "draggableList.gif" ] []
        , explanation []
            [ p [] [ text "ドラッグでソートできるリストを自前で実装してみました。" ]
            , p [] [ text "Elmで作成しました。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr <| hostUrl ++ "/draggable-list/") [ text "site" ]
            , a (linkAttr (gitHubUrl ++ "/draggable-list-study")) [ text "GitHub" ]
            ]
        ]


cMen : Html Msg
cMen =
    MS.column []
        [ h2 [] [ text "cMen" ]
        , img [ MS.class "img50", src <| imageAsset ++ "cmen.png" ] []
        , explanation []
            [ p [] [ text "特定の業務で使えるかもしれないアンドロイドアプリです。" ]
            , p [] [ text "Kotlinで作成しました。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr "https://play.google.com/store/apps/details?id=jp.ni.example.cmen") [ text "site" ]
            , a (linkAttr (gitHubUrl ++ "/CMen")) [ text "GitHub" ]
            ]
        ]


layoutStudy1 : Html Msg
layoutStudy1 =
    MS.column []
        [ h2 [] [ text "layout-study1" ]
        , img [ MS.class "img100", src <| imageAsset ++ "layout-study1.png" ] []
        , explanation []
            [ p [] [ text "elm-uiというelmのライブラリを使用してみました。" ]
            , p [] [ text "勉強としてドロップダウンメニューなどを自前で実装してみました。" ]
            , p [] [ text "フォーカスを利用したドロップダウンメニューも実装しました。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr "https://qiita.com/GoldentTuft/items/8666ebfbd999045bd703") [ text "Qiita" ]
            , a (linkAttr "https://goldenttuft.github.io/layout-study1/") [ text "site" ]
            , a (linkAttr (gitHubUrl ++ "/layout-study1")) [ text "GitHub" ]
            ]
        ]


layoutStudy2 : Html Msg
layoutStudy2 =
    MS.column []
        [ h2 [] [ text "layout-study2" ]
        , img [ MS.class "img100", src <| imageAsset ++ "layout-study2.png" ] []
        , explanation []
            [ p [] [ text "elm-neat-layoutというelmのライブラリを使用してみました。" ]
            , p [] [ text "勉強として、今回はcssでドロップダウンメニューを実装しました。" ]
            , p [] [ text "レスポンシブルも前回より意識しました。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr "https://qiita.com/GoldentTuft/items/f838591bc553eb5ac13e") [ text "Qiita" ]
            , a (linkAttr "https://goldenttuft.github.io/layout-study2/") [ text "site" ]
            , a (linkAttr (gitHubUrl ++ "/layout-study2")) [ text "GitHub" ]
            ]
        ]


railsBbsStudy : Html Msg
railsBbsStudy =
    MS.column []
        [ h2 [] [ text "Rails Bbs" ]

        -- , img [ MS.class "img100", src <| imageAsset ++ "layout-study2.png" ] []
        , explanation []
            [ p [] [ text "開発途中で恥ずかしいのですが、Railsチュートリアルを終え掲示板機能をつけようとしています。" ]
            , p [] [ text "ログインユーザーであればスレッドのフォロー機能、スレッドの作成が行えます。" ]
            , p [] [ text "匿名ユーザーであっても書き込みと削除ができます。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr "https://gentle-plains-53830.herokuapp.com/about") [ text "site" ]
            , a (linkAttr (gitHubUrl ++ "/bbs_study")) [ text "GitHub" ]
            ]
        ]


rvs : Html Msg
rvs =
    MS.column []
        [ h2 [] [ text "オセロプログラム" ]
        , explanation []
            [ p [] [ text "昔すぎてあまり覚えていないのですが、終盤読みとして作ったものを、BearRevというリバーシソフトのプラグインに移行したものです。" ]
            , p [] [ text "中盤は弱いのですが、終盤はnegascoutや置換表など使いそこそこ高速だったと思います。" ]
            , p [] [ text "c言語で作成しました。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr (pubAsset ++ "Rvs.zip")) [ text "download" ]
            ]
        ]


tsScript : Html Msg
tsScript =
    MS.column []
        [ h2 [] [ text "Tampermonkey Script" ]
        , explanation []
            [ p [] [ text "JavaScriptでブラウザを拡張するものです。" ]
            ]
        , MS.row [ style "align-self" "flex-end" ]
            [ a (linkAttr "https://greasyfork.org/ja/users/170321-meguru") [ text "site" ]
            ]
        ]


footer : Html Msg
footer =
    MS.row [ style "justify-content" "center", MS.class "footer" ] [ text "© 2020 tuft" ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
