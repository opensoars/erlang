% c(tail_recursion).
% tail_recursion:

-module(tail_recursion).
-export([sum/2]).


% sum, using an accumulating parameter (Sum)

sum([], Sum) -> Sum;
sum([H | T], Sum) -> sum(T, H + Sum).
