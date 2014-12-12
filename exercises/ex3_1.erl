%%%--------------------------------------------------------------------- 
%%% Description module ex3_1
%%%--------------------------------------------------------------------- 
%%% Sums integers from given parameters
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% sum1(Boundary)
%%%   Sums integers from 1 to Boundary.
%%% sum2(Start, Boundary)
%%%   Sums integers from Start to Boundary.
%%%--------------------------------------------------------------------- 
-module(ex3_1).
-export([sum1/1, sum2/2]).


%%----------------------------------------------------------------------
%% API function sum1/1,
%% calls sum1_acc(I, Boundary, Sum).
%%
%% > sum1(3).
%% 6
%%----------------------------------------------------------------------
sum1(Boundary) -> sum1_acc(1, Boundary, 0).

sum1_acc(I, Boundary, Sum) when I =< Boundary ->
  sum1_acc(I + 1, Boundary, Sum + I); 
sum1_acc(_I, _Boundary, Sum) -> Sum.


%%----------------------------------------------------------------------
%% API function sum2/2,
%% calls sum2_acc(Start, Boundary, Sum).
%% It will throw when we the I > Boundary
%%
%% > sum(1, 3).
%% 6
%%----------------------------------------------------------------------
sum2(Start, Boundary) when Start > Boundary ->
  throw({ error, {"Start > Boundary", Start, Boundary} });
sum2(Start, Boundary) -> sum2_acc(Start, Boundary, 0).

sum2_acc(I, Boundary, Sum) when I =< Boundary ->
  sum2_acc(I + 1, Boundary, Sum + I);
sum2_acc(_I, _Boundary, Sum) -> Sum.

