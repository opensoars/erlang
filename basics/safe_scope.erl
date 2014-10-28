-module(safe_scope).
-export([safe/1]).

% This will compile since we assign variable Y in both cases
% So it's nothing more than a case determined assignment

safe(X) ->
  case X of
    one -> Y = 12;
    _   -> Y = 15
  end,
  Y.