% Simple demonstration of pattern matching,
%
% when we call `area:shape({square, 5}).`
% It will match the first function clause, so the matching body
% will be executed.
%
% When we do not find a match in the clauses, we assign variable `Other`
% the value of the paramater, and return an error tuple, which has as it's
% element 1: error atom, describing what we give back
% element 2: description atom, giving a description of why we got an error back


-module(area).
-export([shape/1]).


% shape: calculates area of shapes

shape({square, Side}) ->
  Side * Side;

shape({circle, Radius}) ->
  math:pi() * Radius * Radius;

shape({triangle, A, B, C}) ->
  S = (A + B + C)/2,
  math:sqrt(S*(S-A)*(S-B)*(S-C));

shape(_Other) ->
  {error, invalid_object}.