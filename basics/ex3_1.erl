-module(ex3_1).
-export([sum1/1, sum2/2]).


%%----------------------------------------------------------------------
%% Will sum integers from 1 to Boundary
%% sum1(3) == 6
%%----------------------------------------------------------------------
sum1(Boundary) -> sum1_acc(1, Boundary, 0).

sum1_acc(Index, Boundary, Sum) when Index =< Boundary ->
  sum1_acc(Index + 1, Boundary, Sum + Index); 
sum1_acc(_Index, _Boundary, Sum) -> Sum.


%%----------------------------------------------------------------------
%% Will sum integers from Index to Boundary
%% It will throw when we the Index > Boundary: ex3_2:sum(3,1).
%% sum(1,3) == 6
%%----------------------------------------------------------------------
sum2(Index, Boundary) when Index > Boundary ->
  throw({ error, {"Index > Boundary", Index, Boundary} });
sum2(Index, Boundary) ->
  sum2_acc(Index, Boundary, 0).

sum2_acc(Index, Boundary, Sum) when Index =< Boundary ->
  sum2_acc(Index + 1, Boundary, Sum + Index);
sum2_acc(_Index, _Boundary, Sum) ->
  Sum.

