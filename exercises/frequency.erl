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
%% Spawns a child process and registers it as frequency.
%%----------------------------------------------------------------------
start() ->
  register(frequency, spawn(frequency, init, [])).


%%----------------------------------------------------------------------
%% Spawn function init, which initializes our listen loop
%%----------------------------------------------------------------------
init() ->
  Frequencies = {get_frequencies(), []},
  loop(Frequencies).


%%----------------------------------------------------------------------
%% Internal function get_frequencies
%% Returns a list with hardcoded frequencies
%%----------------------------------------------------------------------
get_frequencies() -> [10, 11, 12, 13, 14, 15].


%%----------------------------------------------------------------------
%% Client functions
%% Used to hide our data passing protocol so it doesn't matter if our
%% client code changed, as long as we keep using the protocol.
%%----------------------------------------------------------------------
stop()           -> call(stop).
allocate()       -> call(allocate).
deallocate(Freq) -> call({deallocate, Freq}).


%%----------------------------------------------------------------------
%% Internal function call
%% Used to hide our message protocol in a functional interface.
%%----------------------------------------------------------------------
call(Message) ->
  Pid = whereis(frequency),
  if
    Pid /= undefined ->
      frequency ! {request, self(), Message},
      receive {reply, Reply} -> Reply end;
    Pid == undefined -> {error, frequency_server_not_running}
  end.


%%----------------------------------------------------------------------
%% Internal function loop which is our main receive loop
%%----------------------------------------------------------------------
loop(Frequencies) ->
  receive
    {request, Pid, allocate} ->
      {NewFrequencies, Reply} = allocate(Frequencies, Pid),
      reply(Pid, Reply),
      loop(NewFrequencies);
    {request, Pid, {deallocate, Freq}} ->
      NewFrequencies = deallocate(Frequencies, Freq),
      reply(Pid, ok),
      loop(NewFrequencies);
    {request, Pid, stop} ->
      reply(Pid, ok)
  end.


%%----------------------------------------------------------------------
%% Internal function reply
%% Helper function that sends replies to call receive.
%%----------------------------------------------------------------------
reply(Pid, Reply) ->
  Pid ! {reply, Reply}.


%%----------------------------------------------------------------------
%% Internal helper function allocate
%% Allocates a frequency. If there's one free, it will respond with it,
%% if there isn't a free frequency we return an error.
%%----------------------------------------------------------------------
allocate({[], Allocated}, _Pid) ->
  {{[], Allocated}, {error, no_frequency}};
allocate({[Freq|Free], Allocated}, Pid) ->
  {{Free, [{Freq, Pid}|Allocated]}, {ok, Freq}}.


%%----------------------------------------------------------------------
%% Internal helper function deallocate
%% Returns an used frequency to the free frequencies list
%%----------------------------------------------------------------------
deallocate({Free, Allocated}, Freq) ->
  NewAllocated=lists:keydelete(Freq, 1, Allocated),
  {[Freq|Free], NewAllocated}.