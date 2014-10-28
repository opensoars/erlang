-module(bool).
-export([b_not/1, b_and/2, b_or/2, b_nand/2]).

% Simple boolean expression matching
% not, and, or, nand

b_not(true) ->
  false;
b_not(false) ->
  true.

b_and(true, true) ->
  true;
b_and(_NotTrueParam1, _NotTrueParam2) ->
  false.

b_or(_Param1, true) ->
  true;
b_or(true, _Param2) ->
  true;
b_or(_NotTrueParam1, _NotTrueParam2) ->
  false.

b_nand(false, false) ->
  true;
b_nand(_NotFalseParam1, _NotFalseParam2) ->
  false.