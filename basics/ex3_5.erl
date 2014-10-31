%%%--------------------------------------------------------------------- 
%%% Description module ex3_5
%%%--------------------------------------------------------------------- 
%%% Manipulating lists
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% filter(O, N)
%%%   returns a new list with the first N elements of O
%%% reverse(L)
%%%   returns L reversed
%%%---------------------------------------------------------------------

-module(ex3_5).
-export([filter/2, reverse/1]).

%%----------------------------------------------------------------------
%% API function filter, calls filter_acc(O, WantLen, CurLen(0), N)
%% ex3_5:filter([1,2,3,4,5], 3).
%% [1,2,3]
%%----------------------------------------------------------------------
filter(O, N) -> filter_acc(O, N, 0, []).

filter_acc(_O, WantLen, CurLen, N) when WantLen == CurLen ->
  reverse(N);
filter_acc([H | T], WantLen, CurLen, N) ->
  filter_acc(T, WantLen, CurLen + 1, [H | N]).


%%----------------------------------------------------------------------
%% API function reverse, calls reverse_acc(L, N)
%% ex3_5:reverse([3,2,1]).
%% [1,2,3]
%%----------------------------------------------------------------------
reverse(L) -> reverse_acc(L, []).

reverse_acc([], N) -> N;
reverse_acc([H | T], N) ->
  reverse_acc(T, [H | N]).