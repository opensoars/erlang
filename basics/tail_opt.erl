%
% Tail recursion optimization
%

-module(tail_opt).
-export([]).


% Returns the average value of a list, by calling the accumulator function
% that takes as parameters: List, Sum, Length
average(List) -> average_acc(List, 0, 0).

average_acc([], Sum, Length) -> Sum / Length;
average_acc([H | T], Sum, Length) -> average_acc(T, Sum + H, Length + 1).