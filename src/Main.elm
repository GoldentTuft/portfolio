module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import MyStyle as MS



-- model


type alias Model =
    { selector : SkillSelector
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { selector = AllSkill }
    , Cmd.none
    )


type Lang
    = CSharp
    | Elm
    | Golang
    | Clang
    | JavaScript
    | Rails
    | Kotlin


type SkillSelector
    = AllSkill
    | OnlyOne Lang


type alias Product =
    { skills : List Lang
    , view : Html Msg
    }



-- update


type Msg
    = NoOp
    | Select SkillSelector


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Select sel ->
            ( { model | selector = sel }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- view


langToText : Lang -> String
langToText lang =
    case lang of
        Elm ->
            "Elm"

        CSharp ->
            "C#"

        Golang ->
            "Go"

        Clang ->
            "C"

        JavaScript ->
            "JavaScript"

        Rails ->
            "Rails"

        Kotlin ->
            "Kotlin"


skillButton : SkillSelector -> Lang -> Html Msg
skillButton sel lang =
    let
        active =
            "pure-button pure-button-active"

        nonActive =
            "pure-button"

        mixedClass =
            case sel of
                AllSkill ->
                    active

                OnlyOne selLang ->
                    if lang == selLang then
                        active

                    else
                        nonActive
    in
    button
        [ class mixedClass
        , onClick (Select (OnlyOne lang))
        ]
        [ text ("|> " ++ langToText lang) ]


skillButtons : SkillSelector -> Html Msg
skillButtons sel =
    MS.row [ MS.class "container", style "justify-content" "space-between" ]
        [ button
            [ class "pure-button"
            , onClick (Select AllSkill)
            ]
            [ text "|> All" ]
        , skillButton sel Elm
        , skillButton sel CSharp
        , skillButton sel Golang
        , skillButton sel Clang
        , skillButton sel JavaScript
        , skillButton sel Rails
        , skillButton sel Kotlin
        ]


view : Model -> Html Msg
view model =
    MS.column
        [ MS.class "main", style "height" "100vh" ]
        [ div [ MS.class "nav" ]
            [ div [ MS.class "container" ]
                [ span [ MS.class "nav_brand" ] [ text "Portfolio" ]
                , span [ MS.class "nav_items" ]
                    [ a (MS.class "nav_item" :: (linkAttr <| "https://qiita.com/GoldentTuft")) [ text "Qiita" ]
                    , a (MS.class "nav_item" :: (linkAttr <| gitHubUrl)) [ text "GitHub" ]
                    ]
                ]
            ]
        , MS.column [ MS.class "content", style "flex-grow" "1" ]
            [ skillButtons model.selector
            , productsView model.selector
            , footer
            ]
        ]


gitHubUrl : String
gitHubUrl =
    "https://github.com/GoldentTuft"


hostUrl : String
hostUrl =
    "https://pokosuko.work"


appName : String
appName =
    "/pf-748"


imageAsset : String
imageAsset =
    hostUrl ++ appName ++ "/img/"


pubAsset : String
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
    div (MS.mt MS.g08 :: attrs) children


productsView : SkillSelector -> Html Msg
productsView sel =
    let
        products =
            [ linCal
            , typingClub
            , stimer
            , draggableList
            , railsBbs
            , monitorEco
            , cMen
            , tsScript
            , layoutStudy1
            , layoutStudy2
            , rvs
            ]

        filter : Product -> Bool
        filter p =
            case sel of
                AllSkill ->
                    True

                OnlyOne lang ->
                    List.member lang p.skills
    in
    MS.column [ MS.class "container", style "flex-grow" "1" ]
        (products
            |> List.filter filter
            |> List.map .view
        )


linCal : Product
linCal =
    { skills = [ CSharp ]
    , view =
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
    }


typingClub : Product
typingClub =
    { skills = [ Elm ]
    , view =
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
                [ a (linkAttr <| hostUrl ++ "/typing1/#typeShortWord") [ text "site" ]
                , a (linkAttr <| hostUrl ++ "/typing1/") [ text "site" ]
                , a (linkAttr (gitHubUrl ++ "/TypingClub")) [ text "GitHub" ]
                ]
            ]
    }


stimer : Product
stimer =
    { skills = [ Elm ]
    , view =
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
    }


draggableList : Product
draggableList =
    { skills = [ Elm ]
    , view =
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
    }


cMen : Product
cMen =
    { skills = [ Kotlin ]
    , view =
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
    }


layoutStudy1 : Product
layoutStudy1 =
    { skills = [ Elm ]
    , view =
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
    }


layoutStudy2 : Product
layoutStudy2 =
    { skills = [ Elm ]
    , view =
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
    }


railsBbs : Product
railsBbs =
    { skills = [ Rails ]
    , view =
        MS.column []
            [ h2 [] [ text "Rails Bbs" ]

            -- , img [ MS.class "img100", src <| imageAsset ++ "layout-study2.png" ] []
            , explanation []
                [ p [] [ text "Railsで作成した掲示板です。" ]
                , p [] [ text "ログインユーザーであればスレッドのフォロー機能、スレッドの作成が行えます。" ]
                , p [] [ text "匿名ユーザーであっても書き込みと削除ができます。" ]
                , p [] [ text "補足: Herokuの無料プランを使用しているので、30分アクセスがないとスリープ状態になり、起動するのに時間がかかります。" ]
                ]
            , MS.row [ style "align-self" "flex-end" ]
                [ a (linkAttr "https://gentle-plains-53830.herokuapp.com/about") [ text "site" ]
                , a (linkAttr (gitHubUrl ++ "/bbs_study")) [ text "GitHub" ]
                ]
            ]
    }


rvs : Product
rvs =
    { skills = [ Clang ]
    , view =
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
    }


tsScript : Product
tsScript =
    { skills = [ JavaScript ]
    , view =
        MS.column []
            [ h2 [] [ text "Tampermonkey Script" ]
            , explanation []
                [ p [] [ text "JavaScriptでブラウザを拡張するものです。" ]
                ]
            , MS.row [ style "align-self" "flex-end" ]
                [ a (linkAttr "https://greasyfork.org/ja/users/170321-meguru") [ text "site" ]
                ]
            ]
    }


monitorEco : Product
monitorEco =
    { skills = [ Golang ]
    , view =
        MS.column []
            [ h2 [] [ text "monitor-eco" ]

            -- , img [ MS.class "img100", src <| imageAsset ++ "layout-study2.png" ] []
            , explanation []
                [ p [] [ text "起動すると5秒後にモニターを消灯します。" ]
                , p [] [ text "モニターを付けるには、マウスなどを動かします。" ]
                , p [] [ text "起動している間、1分ごとにモニターを消灯します。" ]
                , p [] [ text "起動している間、起動時間を計測しています。" ]
                , p [] [ text "アプリと消灯ループを終了させるには、そのまま閉じます。" ]
                , p [] [ text "Go言語で作成しました。" ]
                ]
            , MS.row [ style "align-self" "flex-end" ]
                [ a (linkAttr <| hostUrl ++ "/monitor-eco/monitor-eco.zip") [ text "download" ]
                , a (linkAttr (gitHubUrl ++ "/monitor-eco")) [ text "GitHub" ]
                ]
            ]
    }


footer : Html Msg
footer =
    MS.row [ style "justify-content" "center", MS.class "footer" ] [ text "© 2020 tuft" ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
