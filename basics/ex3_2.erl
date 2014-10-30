-module(ex3_2).
-export([create/1, reverse_create/1]).

%%----------------------------------------------------------------------
%% Creates a list from 1 to param N
%% ex3_2:create(3). => [1,2,3]
%%----------------------------------------------------------------------
create(N) -> create_acc(N, 1, []).

create_acc(Index, Final, List) when Final =< Index ->
  create_acc(Index -1, Final, [Index | List]);
create_acc(_End, _Index, List) ->
  List.



%%----------------------------------------------------------------------
%% Creates a list from param N to 1
%% ex3_2:reverse_create(3). => [3,2,1]
%%----------------------------------------------------------------------
reverse_create(N) -> reverse_create_acc(1, N, []).

reverse_create_acc(Index, Final, List) when Index =< Final ->
  reverse_create_acc(Index + 1, Final, [Index | List]);
reverse_create_acc(_Index, _End, List) ->
  List.
