%%%--------------------------------------------------------------------- 
%%% Description module mutex
%%%--------------------------------------------------------------------- 
%%% A mutex semaphore that can be used to guaranty mutual exclusion.
%%% It's another example of a FSM.
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% start()
%%%   Starts the mutex
%%% stop()
%%%   Stops the mutex
%%%---------------------------------------------------------------------

-module(mutex).
-export([start/0, stop/0]).
-export([wait/0, signal/0]).
-export([init/0]).

start() ->
  register(mutex, spawn(?MODULE, init, [])).