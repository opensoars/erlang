-module(area).
-export([calc/1]).

calc({square, Side}) ->
  Side * Side.