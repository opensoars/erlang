-module(recursion).
-export([bump/1, len/1, average/1, sum/1, even/1, member/2]).

% Adds 1 to every element in the list
% Returns the new list
bump([]) -> [];
bump([H | T]) -> [H + 1 | bump(T)].


% Returns the average of integer elements in a list
average([]) -> 0;
average(List) -> sum(List) / len(List).

% Returns value of adding every integer element in a list
sum([]) -> 0;
sum([H | T]) -> H + sum(T).

% Returns the length of a list
len([]) -> 0;
len([_H | T]) -> 1 + len(T).


% Returns a list with just even numbers
even([]) -> [];
even([H | T]) when H rem 2 == 0 -> [H | even(T)];
even([_ | T]) -> even(T).


% Return true if element (param1) is found in the list (param2)
% else we return false
member(_, []) -> false;
