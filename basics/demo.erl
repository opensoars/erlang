-module(demo).
-export([double/1]).

% Doubles Value
% Calls times to actualy do the doubling

double(Value) ->
  times(Value, 2).

times(X, Y) ->
  X * Y.