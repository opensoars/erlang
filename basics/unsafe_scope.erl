-module(unsafe_scope).
-export([unsafe/1]).

% This won't compile since we use the variable Y outside of its scope!

unsafe(X) ->
  case X of
    one -> Y = true;
    _   -> Z = two
  end,
  Y.