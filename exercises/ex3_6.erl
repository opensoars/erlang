%%%--------------------------------------------------------------------- 
%%% Description module ex3_6
%%%--------------------------------------------------------------------- 
%%% Quicksort and Merge sort algorithms
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% qsort1
%%%   quick sort algorith, sorts lists from lowest to highest
%%% merge
%%%---------------------------------------------------------------------
-module(ex3_6).
-export([qsort1/1, merge/1]).

%%----------------------------------------------------------------------
%% API function qsort1
%%
%% > qsort1([2,1,3]).
%% [1,2,3]
%%----------------------------------------------------------------------
qsort1([Pivot|Tail]) ->
    qsort1([ X || X <- Tail, X < Pivot])
    ++ [Pivot] ++
    qsort1([ X || X <- Tail, X >= Pivot]);
qsort1([]) -> [].


%%----------------------------------------------------------------------
%% API function merge
%%----------------------------------------------------------------------
merge(L) -> L.