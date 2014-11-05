-module(spawn_bench).
-export([start/1, start_proc/2]).

start(Num) ->
  start_proc(Num, self()).

start_proc(o, Pid) ->
  Pid ! ok;

start_proc(Num, Pid) ->
  NPid = spawn(?MODULE, start_proc, [Num-1, Pid]),
  NPid ! ok,
  receive ok -> ok end.