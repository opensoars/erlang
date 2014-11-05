%%%--------------------------------------------------------------------- 
%%% Description module echo
%%%--------------------------------------------------------------------- 
%%% A simple echo server demonstration
%%%
%%% Message protocol: {msg, Term}
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% start()
%%%   Starts the echo server
%%% print(Term)
%%%   Prints the Term from the echo server io:format call
%%% stop()
%%%   Stops the echo server
%%% loop()
%%%   Our recursive server loop function
%%%---------------------------------------------------------------------
-module(echo).
-export([start/0, print/1, stop/0, loop/0]).

%%----------------------------------------------------------------------
%% API function start
%% Starts up the echo_server and logs about registering it
%%----------------------------------------------------------------------
start() ->
  Server_name = echo_server,
  register(Server_name, spawn(echo, loop, [])),
  io:format("Registered `~w`~n", [Server_name]),
  ok.


%%----------------------------------------------------------------------
%% API function print
%% Sends a message to to our echo server using the message protocol
%%----------------------------------------------------------------------
print(Term) ->
  echo_server ! {self(), {msg, Term}},
  ok.


%%----------------------------------------------------------------------
%% API function stop
%% Sends a stop message to the echo_server
%%----------------------------------------------------------------------
stop() ->
  echo_server ! stop,
  ok.


%%----------------------------------------------------------------------
%% API function loop
%% Takes messages that are sent using the print/1 function that follow
%% our message prototcol described in the head comment, and prints it
%% out along with the corresponding pid.
%% When a message doesn't follow the message protocol, we log the pid
%% belonging to the sender along with the data we received
%%----------------------------------------------------------------------
loop() ->
  receive
    {From, {msg, Msg}} ->
      io:format("From: ~w  We got Msg: ~w~n", [From, Msg]),
      loop(),
      ok;

    {From, Received} ->
      io:format("Got undefined message from: ~w~n", [From]),
      io:format("Here is what we received: ~w~n", [Received]),
      loop(),
      ok;

    stop ->
      true
  end.