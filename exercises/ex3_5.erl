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
%%% flatten(List)
%%%   When given a list of lists with nested lists in it, it will take
%%%   out all elements in the nested lists and put it in a normal list.
%%%---------------------------------------------------------------------
-module(ex3_5).
-export([filter/2, reverse/1, concatenate/1, add/2]).

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
concatenate(L) -> concatenate_acc(L, []).

% concatenate_acc([Head | Tail], [R_H | R_T]) ->

concatenate_acc([Head | Tail], Res) ->
  io:format("Res:~p~n", [Res]),
  io:format("Head:~p~n", [Head]),
  io:format("Tail:~p~n", [Tail]),
  concatenate_acc(Tail, [Head | Res]);
concatenate_acc([], Res) -> Res.


% len(L) -> len_acc(L, 0).
% 
% len_acc([], C) -> C;
% len_acc([Head | Tail], C) ->
%   len_acc(Tail, C + 1).

%From      To      
%[3, 4, 5] [1, 2], 

add(From, To) -> add_acc(From, To, []).

add_acc([], [], _Res) -> [];
add_acc(From, To, Res) ->
  add_acc(, [ | ])
  

%%----------------------------------------------------------------------
%% API function flatten
%% calls flatten_acc()
%%
%% > flatten([[1,[2,[3],[]]], [[[4]]], [5,6]]).
%% [1,2,3,4,5,6]
%%----------------------------------------------------------------------
% flatten([]) -> [];
% flatten(L) -> flatten_acc(L, []).

% flatten_acc([], Result) -> Result;
% flatten_acc(L, Result) ->