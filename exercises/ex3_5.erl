%%%--------------------------------------------------------------------- 
%%% Description module ex3_5
%%%--------------------------------------------------------------------- 
%%% Manipulates lists
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% filter(O, N)
%%%   Returns a new list with the first N elements of O
%%% reverse(L)
%%%   Returns L reversed
%%% concatenate(Lists)
%%%   
%%% flatten
%%%   
%%%---------------------------------------------------------------------
-module(ex3_5).
-export([filter/2, reverse/1, concatenate/1]).

%%----------------------------------------------------------------------
%% API function filter/2,
%% calls filter_acc(O, WantLen, CurLen, N).
%%
%% > filter([1,2,3,4,5], 3).
%% [1,2,3]
%%----------------------------------------------------------------------
filter(O, N) -> filter_acc(O, N, 0, []).

filter_acc(_O, WantLen, CurLen, N) when WantLen == CurLen ->
  reverse(N);
filter_acc([H | T], WantLen, CurLen, N) ->
  filter_acc(T, WantLen, CurLen + 1, [H | N]).


%%----------------------------------------------------------------------
%% API function reverse/1,
%% calls reverse_acc(L, N).
%%
%% > reverse([3,2,1]).
%% [1,2,3]
%%----------------------------------------------------------------------
reverse(L) -> reverse_acc(L, []).

reverse_acc([], N) -> N;
reverse_acc([H | T], N) -> reverse_acc(T, [H | N]).



%%----------------------------------------------------------------------
%% API function concatenate/1,
%% calls concatenate_acc()       !!!
%%----------------------------------------------------------------------
concatenate() ->

%%----------------------------------------------------------------------
%% API function flatten
%% calls flatten_acc()       !!!
%%----------------------------------------------------------------------
flatten() ->