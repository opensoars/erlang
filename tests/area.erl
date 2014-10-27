-module(area).
-export([calc/1]).

% calc: calculates area of shapes

calc({square, Side}) ->
  Side * Side;

calc({circle, Radius}) ->
  math:pi() * Radius * Radius;

calc({triangle, A, B, C}) ->
  S = (A + B + C)/2,
  math:sqrt(S*(S-A)*(S-B)*(S-C));

calc(Other) ->
  {error, invalid_object}.