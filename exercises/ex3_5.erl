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
%%% concatenate(Lists)
%%%   When given a list of lists, it returns all elements in the lists
%%%   in one list.
%%% flatten(List)
%%%   When given a list of lists with nested lists in it, it will take
%%%   out all elements in the nested lists and put it in a normal list.
%%%---------------------------------------------------------------------
-module(ex3_5).
-export([filter/2, concatenate/1, flatten/1]).

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
%% API function concatenate/1,
%% calls concatenate_acc()
%%
%% > concatenate([[1, 2], [3], [4, 5, six]]).
%% [1,2,3,4,5,six]
%%----------------------------------------------------------------------
concatenate([]) -> [];
concatenate(L) -> concatenate_acc(L, []).

concatenate_acc([], N) -> reverse(N);
concatenate_acc([List_head | List_tail], N) ->
  concatenate_acc(List_tail, addElems(List_head, N)).


%%----------------------------------------------------------------------
%% Private function addElems/2,
%% adds elements of list To_add to list N.
%%
%% > addElems([2,3], [1]).
%% [1,2,3]
%%----------------------------------------------------------------------
addElems([], N) -> N;
addElems([To_add_head | To_add_tail], N) ->
  addElems(To_add_tail, [To_add_head | N]).
  

%%----------------------------------------------------------------------
%% API function flatten
%%
%% > flatten([[1,[2,[3],[]]], [[[4]]], [5,6]]).
%% [1,2,3,4,5,6]
%%----------------------------------------------------------------------
flatten(X) -> reverse(flatten(X, [])).

flatten([], Res) -> Res;
flatten([H|T], Res) when is_list(H) -> flatten(T, flatten(H, Res));
flatten([H|T], Res) -> flatten(T, [H | Res]).


%%----------------------------------------------------------------------
%% Private function reverse/1,
%% reverses list L
%% calls reverse_acc(L, N).
%%
%% > reverse([3,2,1]).
%% [1,2,3]
%%----------------------------------------------------------------------
reverse(L) -> reverse_acc(L, []).

reverse_acc([], N) -> N;
reverse_acc([H | T], N) -> reverse_acc(T, [H | N]).