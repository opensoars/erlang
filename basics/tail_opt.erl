%
% Tail recursion optimization
% Showing how to use eunit tests
%

-module(tail_opt).
-export([average/1, sum/1]).

% Returns the average value of a list, by calling the accumulator function
% that takes as parameters: List, Sum, Length
average([]) -> 0;
average(List) -> average_acc(List, 0, 0).

average_acc([], Sum, Length) ->
  Sum / Length;
average_acc([H | T], Sum, Length) ->
  average_acc(T, Sum + H, Length + 1).


% sum(3) will result in: 1 + 2 + 3 = 6
sum(Boundary) -> sum_acc(1, Boundary, 0).

sum_acc(Index, Boundary, Sum) when Index =< Boundary ->
  sum_acc(Index + 1, Boundary, Sum + Index);
sum_acc(_I, _B, Sum) ->
  Sum.