% c(tail_recursion).
% tail_recursion:

%
% Tail recursion
%

-module(tail_recursion).
-export([sum/2, bump/2]).


% sum, using an accumulating parameter (Sum)
sum([], Sum) -> Sum;
sum([H | T], Sum) -> sum(T, H + Sum).


% bump, using an accumulating parameter (List)
bump([], List) -> List;
bump([H | T], List) -> bump(T, [H + 1 | Acc]).