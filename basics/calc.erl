-module(calc).
-export([add/2, substract/2, multiply/2, divide/2]).

add(X, Y) ->
  X + Y.

substract(X, Y) ->
  X - Y.

multiply(X, Y) ->
  X * Y.

divide(X, Y) ->
  X / Y.