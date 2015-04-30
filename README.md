# hubot-ubereats

A hubot script lists today's meals at Ubereats.es

See [`src/ubereats.coffee`](src/ubereats.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-ubereats --save-dev`

Then add **hubot-ubereats** to your `external-scripts.json`:

```json
["hubot-ubereats"]
```

## Sample Interaction

```
user1>> hubot ubereats lunch
hubot>> lunch
        Fideos Vermicelli con Ternera
        Fideos Vermicelli con ternera acompañados de brotes de soja, lechuga, zanahoria, pepino, cebolla frita, menta, cilantro y anacardo picado con salsa vietnamita. (Plato servido a temperatura ambiente).
        http://static1.squarespace.com/static/54dbb453e4b007a652a2ec1f/54dbd451e4b06d19b07eafaf/551e696be4b0a24bf6bf4b7f/1429962128678/
```
