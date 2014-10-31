%%%--------------------------------------------------------------------- 
%%% Description module ex3_3
%%%--------------------------------------------------------------------- 
%%% Prints integers using the io:format BIF
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
%% API function printInts, calls printInts_acc(I, N)
%% Prints integers from 1 to param N
%% printInts(3).
%% Number:1
%% Number:2
%% Number:3
%% ok
%%----------------------------------------------------------------------
printInts(N) -> printInts_acc(1, N).

printInts_acc(I, N) when I =< N ->
  io:format("Number:~p\n", [I]),
  printInts_acc(I + 1, N);
printInts_acc(_Iterator, _Final) -> ok.


%%----------------------------------------------------------------------
%% API function printEvenInts, calls printEvenInts_acc(I, N)
%% Prints even integers from 1 to param N
%% printEvenInts(5).
%% Number:2
%% Number:4
%% ok
%%----------------------------------------------------------------------
printEvenInts(N) -> printEvenInts_acc(1, N).

printEvenInts_acc(I, N) when I =< N, I rem 2 /= 0 ->
  printEvenInts_acc(I + 1, N);
printEvenInts_acc(I, N) when I =< N, I rem 2 == 0 ->
  io:format("Number:~p\n", [I]),
  printEvenInts_acc(I + 1, N);
printEvenInts_acc(_I, _Final) -> ok.