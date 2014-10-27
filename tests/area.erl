% Simple demonstration of pattern matching,
%
% when we call `area:calc({square, 5}).`
% It will match the first function clause, so the matching body
% will be executed.
%
% When we do not find a match in the clauses, we assign variable `Other`
% the value of the paramater, and return an error tuple


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