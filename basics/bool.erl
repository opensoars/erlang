-module(bool).
-export([b_not/1, b_and/2, b_or/2, b_nand/2]).

b_not(true) ->
  false;
b_not(false) ->
  true.

b_and(true, true) ->
  true;
b_and(_NotTrueValue1, _NotTrueValue2) ->
  false.

b_or(_Value1, true) ->
  true;
b_or(true, _Value2) ->
  true;
b_or(_NotTrueValue1, _NotTrueValue2) ->
  false.

b_nand(false, false) ->
  true;
b_nand(_NotFalseValue1, _NotFalseValue2) ->
  false.