% c(tail_recursion).
% tail_recursion:

%
% Tail recursion
%

-module(tail_recursion).
-export([sum/1, bump/1, reverse/1, merge/2]).

% Returns value of adding every integer element in a list
sum(List) -> sum_acc(List, 0).

% sum, using an accumulating parameter
sum_acc([], Acc) -> Acc;
sum_acc([H | T], Acc) -> sum_acc(T, H + Acc).


% Adds 1 to every element in the list
bump(List) -> bump_acc(List, []).

% bump, using an accumulating parameter
bump_acc([], Acc) -> reverse(Acc);
bump_acc([H | T], Acc) -> bump_acc(T, [H + 1 | Acc]).


% Reverses a list
reverse(List) -> reverse_acc(List, []).

% reverse, using an accumulating parameter
reverse_acc([], Acc) -> Acc;
reverse_acc([H | T], Acc) -> reverse_acc(T, [H | Acc]).


% Merges two lists of the same length
merge(Xs, Ys) ->
  lists:reverse(mergeL(Xs, Ys, [])).

mergeL([X|Xs], Ys, Zs) ->
  mergeR(Xs, Ys, [X|Zs]);
mergeL([], [], Zs) ->
  Zs.

mergeR(Xs, [Y|Ys], Zs) ->
  mergeL(Xs, Ys, [Y|Zs]);
mergeR([], [], Zs) ->
  Zs.



