%%%--------------------------------------------------------------------- 
%%% Description module custom
%%%--------------------------------------------------------------------- 
%%% Some more exercises not from the book
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% ints_to_atoms(IntList)
%%%   turns a list of integers below 10 into a list of atoms
%%%---------------------------------------------------------------------

-module(custom).
-export([ints_to_atoms/1]).

%%----------------------------------------------------------------------
%% API function ints_to_atoms
%%----------------------------------------------------------------------

ints_to_atoms([]) -> [];
ints_to_atoms([H | T]) ->
  case H of
    0 -> [zero | ints_to_atoms(T)];
    1 -> [one | ints_to_atoms(T)];
    2 -> [two | ints_to_atoms(T)];
    3 -> [three | ints_to_atoms(T)];
    4 -> [four | ints_to_atoms(T)];
    5 -> [five | ints_to_atoms(T)];
    6 -> [six | ints_to_atoms(T)];
    7 -> [seven | ints_to_atoms(T)];
    8 -> [eight | ints_to_atoms(T)];
    9 -> [nine | ints_to_atoms(T)] 
  end.