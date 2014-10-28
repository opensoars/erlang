-module(bad_defense).
-export([convert/1]).

% Better not use this style
% Since we do not know for sure which type will be returned
% it can be either an integer or tuple
% So every function calling this function will have to handle
% the possible tuple return value aswell as an integer value

convert(Day) ->
  case Day of
    monday    -> 1;
    tuesday   -> 2;
    wednesday -> 3;
    thursday  -> 4;
    friday    -> 5;
    saturday  -> 6;
    sunday    -> 7;
    _Other    -> {error, unknow_day}
  end.