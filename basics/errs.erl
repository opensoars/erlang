%
% Learning about runtime errors
%

-module(errs).
-export([factorial/1, test1/1, test2/1]).

% function_clause
%
% errs:factorial(-1).
% ** exception error: no function clause matching test:factorial(-1)
factorial(N) when N > 0 ->
  N * factorial(N - 1);
factorial(0) -> 1.


% case_clause
% errs:test1(0).
% ** exception error: no case clause matching 0
%      in function test:test1/1
test1(N) ->
  case N of
    -1 -> false;
    1  -> true
  end.


% if_clause
%
% errs:test2(0).
% ** exception error: no true branch found when evaluating an if expression
%    in function foo:test2/1
test2(N) ->
  if
    N < 0 -> false;
    N > 0 -> true
  end.


% badmatch
%
% 1> N=45.
% 45
% 2> {N,M}={23,45}.
% ** exception error: no match of right hand side value {23,45}
%
% 1> Tuple = {1, two, 3}.
% {1,two,3}
% 2> {1, two, 3, Four} = Tuple.
% ** exception error: no match of right hand side value {1,two,3}


% badarg
%
% 1> length(helloWorld).
% ** exception error: bad argument
%      in function length/1
%         called as length(helloWorld)


% undef
%
% 1> test:hello().
% ** exception error: undefined function test:hello/0


% badarith
%
% 1> 1+a.
% ** exception error: bad argument in an arithmetic expression
%      in operator +/2
%         called as 1 + a
