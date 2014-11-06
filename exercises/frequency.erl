%%%--------------------------------------------------------------------- 
%%% Description module frequency
%%%--------------------------------------------------------------------- 
%%% Frequency allocating and deallocating example using 6 hardcoded
%%% frequencies. This could be seen as a real phone call handling
%%% mechanism.
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% start()
%%%   Starts our server so we are ready for allocations
%%% allocate()
%%%   Allocates an acual Frequency and removes the allocated
%%%   frequency from the free frequencies list
%%% deallocate(Frequency_to_deallocate)
%%%   Deallocates Frequency_to_deallocate and puts it back in the
%%%   free frequencies list
%%% stop()
%%%   Stops our server
%%% init()
%%%   Initializes a frequency process
%%%---------------------------------------------------------------------
-module(frequency).
-export([start/0, allocate/0, deallocate/1, stop/0]).
-export([init/0]).

%%----------------------------------------------------------------------
%% API function start
%% Spawns a child process and registers it as frequency
%%----------------------------------------------------------------------
start() ->
  register(frequency, spawn(frequency, init, [])).

%%----------------------------------------------------------------------
%% Spawn function init
%% Initializes our listen loop
%%----------------------------------------------------------------------
init() ->
  Frequencies = {get_frequencies(), []},
  loop(Frequencies).

%%----------------------------------------------------------------------
%% Private function get_frequencies
%% Returns a list with hardcoded frequencies
%%----------------------------------------------------------------------
get_frequencies() -> [10, 11, 12, 13, 14, 15].





