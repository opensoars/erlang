-module(echo).
-export([go/0, loop/0]).

go() ->
  Pid = spawn(echo, loop, []),
  Pid ! {self(), hello1},
  receive
    {Pid, Msg} ->
    io:format("~w~n",[Msg])
  end,
  Pid ! stop.


loop() ->
  receive
    {From, Msg} ->
      io:format("Msg:~w From:~w~n", [Msg, From]),
      From ! {self(), Msg},
      loop();
    stop ->
      true
  end.
