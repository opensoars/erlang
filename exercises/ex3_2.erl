%%%--------------------------------------------------------------------- 
%%% Description module ex3_2
%%%--------------------------------------------------------------------- 
%%% Creates lists from passed in parameters.
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% create(N)
%%%   Returns a list filled with integers from 1 to N.
%%% reverse_create(N)
%%%   Returns a list filled with integers from N to 1.
%%%--------------------------------------------------------------------- 
-module(ex3_2).
-export([create/1, reverse_create/1]).


%%----------------------------------------------------------------------
%% Creates a list from 1 to param N,
%% calls create_acc(I, Final, List).
%%
%% > create(3).
%% [1,2,3]
%%----------------------------------------------------------------------
create(N) -> create_acc(N, 1, []).

create_acc(I, Final, List) when Final =< I ->
  create_acc(I -1, Final, [I | List]);
create_acc(_End, _Index, List) -> List.


%%----------------------------------------------------------------------
%% Creates a list from param N to 1,
%% calls reverse_create_acc(I, Final, List).
%%
%% > reverse_create(3).
%% [3,2,1]
%%----------------------------------------------------------------------
reverse_create(N) -> reverse_create_acc(1, N, []).

reverse_create_acc(I, Final, List) when I =< Final ->
  reverse_create_acc(I + 1, Final, [I | List]);
reverse_create_acc(_Index, _End, List) -> List.
