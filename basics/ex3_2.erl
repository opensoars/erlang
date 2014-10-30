-module(ex3_2).
-export([reverse_create/1]).

%%----------------------------------------------------------------------
%% Creates a list from 1 to N given as param
%% ex3_2:create(3). => [1,2,3]
%%----------------------------------------------------------------------




%%----------------------------------------------------------------------
%% Creates a list from N given as param to 1
%% ex3_2:reverse_create(3). => [3,2,1]
%%----------------------------------------------------------------------
reverse_create(N) -> reverse_create_acc(1, N, []).

reverse_create_acc(Index, End, List) when Index =< End ->
  reverse_create_acc(Index + 1, End, [Index | List]);
reverse_create_acc(_Index, _End, List) ->
  List.
