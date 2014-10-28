-module(safe_scope).
-export([safe/1, preferred/1]).

% This will compile since we assign variable Y in both cases
% So it's nothing more than a case determined assignment

safe(X) ->
  case X of
    one -> Y = 12;
    _   -> Y = 15
  end,
  X+Y.

% This shows clearly that we assign Y a value according to a case result
% So it's the preferred way.
preferred(X) ->
  Y = case X of
      one -> 12;
      _   -> 15
      end,
  X+Y.
