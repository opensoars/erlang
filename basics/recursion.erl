-module(recursion).
-export([bump/1, len/1, average/1, sum/1, even/1, member/2]).

% Adds 1 to every element in the list
% Returns the new list
bump([]) -> [];
bump([Head | Tail]) -> [Head + 1 | bump(Tail)].


% Returns the average of integer elements in a list
average([]) -> 0;
average(List) -> sum(List) / len(List).

% Returns value of adding every integer element in a list
sum([]) -> 0;
sum([Head | Tail]) -> Head + sum(Tail).

% Returns the length of a list
len([]) -> 0;
len([_Head | Tail]) -> 1 + len(Tail).


% Returns a list with only even numbers
even([]) -> [];
even([Head | Tail]) when Head rem 2 == 0 -> [Head | even(Tail)];
even([_ | Tail]) -> even(Tail).


% Return true if element (param1) is found in the list (param2)
% else we return false
member(_, []) -> false;
