%
% Learning about runtime errors
%

-module(errs).
-export([factorial/1, test1/1, test/2]).

factorial(N) when N > 0 ->
  N * factorial(N - 1);
factorial(0) -> 1.