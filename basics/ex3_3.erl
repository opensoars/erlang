%%%--------------------------------------------------------------------- 
%%% Description module ex3_3
%%%--------------------------------------------------------------------- 
%%% Prints integers
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% printInts(N)
%%%   Prints integers from 1 to N
%%% printEvenInts(N)
%%%   Prints even integers from 1 to N
%%%--------------------------------------------------------------------- 

-module(ex3_3).
-export([printInts/1, printEvenInts/1]).

%%----------------------------------------------------------------------
%% Prints integers from 1 to N
%% ex3_3:printInts(3).
%% Number:1
%% Number:2
%% Number:3
%% ok
%%----------------------------------------------------------------------
printInts(N) -> printInts_acc(1, N).

printInts_acc(I, Final) when I =< Final ->
  io:format("Number:~p\n", [I]),
  printInts_acc(I + 1, Final);
printInts_acc(_Iterator, _Final) ->
  ok.


%%----------------------------------------------------------------------
%% Prints even integers from 1 to N
%% ex3_3:printEvenInts(5).
%% Number:2
%% Number:4
%%----------------------------------------------------------------------
printEvenInts(N) -> printEvenInts_acc(1, N).


printEvenInts_acc(I, Final) when I =< Final, I rem 2 /= 0 ->
  printEvenInts_acc(I + 1, Final);
printEvenInts_acc(I, Final) when I =< Final, I rem 2 == 0 ->
  io:format("Number:~p\n", [I]),
  printEvenInts_acc(I + 1, Final);
printEvenInts_acc(_I, _Final) ->
  ok.