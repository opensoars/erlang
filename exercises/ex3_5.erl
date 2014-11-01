%%%--------------------------------------------------------------------- 
%%% Description module ex3_5
%%%--------------------------------------------------------------------- 
%%% Manipulates lists
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% filter(O, N)
%%%   Returns a new list with the first N elements of O.
%%% reverse(L)
%%%   Returns L reversed.
%%% concatenate(Lists)
%%%   When given a list of lists, it returns all elements in the lists
%%%   in one list.
%%% flatten
%%%   When given a list of lists with nested lists in it, it will take
%%%   out all elements in the nested lists and put it in a normal list.
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
%% calls concatenate_acc()
%%
%% > concatenate([[1, 2], [3], [4, 5, six]]).
%% [1,2,3,4,5,six]
%%----------------------------------------------------------------------
concatenate([]) -> [];
concatenate(L) -> concatenate_acc(L, []).


concatenate_acc([], Result) -> Result;
concatenate_acc([L_H | L_T], Result) ->


%%----------------------------------------------------------------------
%% API function flatten
%% calls flatten_acc()
%%
%% > flatten([[1,[2,[3],[]]], [[[4]]], [5,6]]).
%% [1,2,3,4,5,6]
%%----------------------------------------------------------------------
flatten([]) -> [];
flatten(L) -> flatten_acc(L, []).

flatten_acc([], Result) -> Result;
flatten_acc(L, Result) ->