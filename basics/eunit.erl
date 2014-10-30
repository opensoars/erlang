%
% Tail recursion optimization
% Showing how to use eunit tests
% To run the tests: average:test().
%

-module(tail_opt).
-export([average/1]).
-include_lib("eunit/include/eunit.hrl").


% Returns the average value of a list, by calling the accumulator function
% that takes as parameters: List, Sum, Length
average([]) -> 0;
average(List) -> average_acc(List, 0, 0).

average_acc([], Sum, Length) ->
  Sum / Length;
average_acc([H | T], Sum, Length) ->
  average_acc(T, Sum + H, Length + 1).

% Exported test function
average_test() -> 2.0 = average([1,2,3]).