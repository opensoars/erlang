%%%--------------------------------------------------------------------- 
%%% Description module 
%%%--------------------------------------------------------------------- 
%%% 
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% start(MessageCount, ProcessCount, Message)
%%%   returns a new foobar object
%%%---------------------------------------------------------------------

-module(ring).
-export([start/3, process/0]).


start(Mc, Pc, Message) ->
  Pid = spawn(ring, process, []).


process() -> 
  receive

  end.

