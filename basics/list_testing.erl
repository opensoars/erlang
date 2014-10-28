-module(list_testing).
-export([listlen/1, listlen_case/1]).

% Returns the length of a list thats given as an argument.

% When we pass in an empty list, simply return 0
%
% When we pass in a list containing atleast one element
% It will be split into head and tail.
% The return value gets incremented by 1.
% We then recusively call listlen again with the tail of the list (remainder).
% So the function gets called and again and the return value gets increased
% by 1 again
listlen([]) -> 0;
listlen([_|Xs]) -> 1 + listlen(Xs).


% Doing the same as in the above function but now we use a case expression
% to keep everything in one function
listlen_case(Y) ->
  case Y of
    [] -> 0;
    [_|Xs] -> 1 + listlen_case(Xs)
  end.