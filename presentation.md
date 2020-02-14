% Elm
% Alexis Lozano
% 1 mars 2020

# Introduction

## Apéritif #1

```js
let user = {
    firstName: "Clark",
    lastName: "Kent"
}
console.log(user.sex);
```

## Apéritif #2

```js
let user = {
    firstName: "Clark",
    lastName: "Kent",
    isAnonymous: true
}
// Avec les dernières versions de JS on peut gérer ce
// problème avec des classes.
```

## Less is more (React)

* Redux
* Webpack
* Sass
* Babel
* ...

![](https://media.giphy.com/media/oYCvqkF8hMqs0/source.gif){ width=400px }

## Est-ce qu'on en parle ?

![](https://i.imgur.com/eO4PKSW.png){width=600px}

## Un dernier pour la route

![](https://external-preview.redd.it/TXeMetxOhQPjhp5Bva2rIPIFTmbxx2lMWmzTfjl_ka4.png?auto=webp&s=7092331fc47ff62f025373423669837881372a7c){width=600px}

![](https://media.giphy.com/media/a5viI92PAF89q/source.gif){width=250px}

## ...

![](https://static01.nyt.com/images/2016/08/05/us/05onfire1_xp/05onfire1_xp-facebookJumbo.jpg){width=800px}

# La solution ? Elm

## Wut ?

* Créé en 2012 par Evan Czaplicki
* Typage fort
* Fonctionnel

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Elm_logo.svg/1200px-Elm_logo.svg.png){ width=200px }

## Tooling

* elm repl
* elm init
* elm format
* elm install

![](https://media.giphy.com/media/10aADbYxnJlc9q/source.gif){width=400px}

## Demo REPL

## Elm Architecture

![](https://res.cloudinary.com/practicaldev/image/fetch/s--oT29AJmn--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/pfdd18lau3fmjhv63bou.png){width=600px}

## Hello World

![](https://media.giphy.com/media/Cmr1OMJ2FN0B2/source.gif){width=400px}

# Comment gérer le style ?

## Importer des fichiers CSS

Voilà.

![](https://media.giphy.com/media/1Z02vuppxP1Pa/source.gif){width=400px}

## Utiliser les attributs

```elm
view model =
  div
    [ style "background-color" "red"
    , style "padding" "10px"
    ]
    [ text model
    ]
```

## elm-css

```elm
view model =
  div
    [ background-color (rgb 255 0 0)
    , padding (px 10)
    ]
    [ text model
    ]
```

## elm-ui

```elm
view model =
  div
    [ Background.color (rgb255 255 0 0)
    , padding 10
    , centerXY
    , inFront (text "I'm in front")
    ]
    [ text model
    ]
```

## Composants pré fabriqués

* Material
* Bootstrap
* Bulma
* ...

![](https://media.giphy.com/media/26gs9kSN6d5PxSsQU/source.gif){width=200px}

# Intéropérabilité JS

## Flags

```js
var app = Elm.Main.init({
  node: document.getElementById('elm'),
  flags: Date.now()
});
```

```elm
init : Int -> ( Model, Cmd Msg )
init currentTime =
  ...
```

## Ports

```elm
port toJs : String -> Cmd msg

port toElm : (String -> msg) -> Sub msg

subscriptions model =
    toElm ReceiveFromJs

update msg model =
    case msg of
        SendToJs str ->
            ( model, toJs str )

        ReceiveFromJs str ->
            ( { model | message = str }, Cmd.none )
```

```js
app.ports.toJs.subscribe(function (str) {
    app.ports.toElm.send("JS value");
});
```

## Web components

C'est plus compliqué :)

![](https://media.giphy.com/media/l0JMrPWRQkTeg3jjO/source.gif){width=600px}

# Live coding 

## Aller plus loin

* Guide officiel [https://guide.elm-lang.org](https://guide.elm-lang.org)
* Tester facilement [https://elm-lang.org/try](https://elm-lang.org/try)

![](https://media.giphy.com/media/6Z3D5t31ZdoNW/source.gif){width=400px}

# Merci à tous

## Des questions ?

![](https://media.giphy.com/media/12e5dX36aMp2Ba/giphy.gif){width=600px}