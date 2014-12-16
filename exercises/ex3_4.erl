%%%--------------------------------------------------------------------- 
%%% Description module ex3_4 (db)
%%%--------------------------------------------------------------------- 
%%% Database handling using lists
%%%
%%% API
%%%
%%% new()
%%% destroy(Db)
%%% write(Key, Elem, Db)
%%% delete(Key, Db)
%%% read(Key, Db)
%%% match(Elem, Db)
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% new()
%%%   Returns an empty list which can serve as a database
%%% destroy(Db_to_destroy)
%%%   Returs atom 'ok', implemented for consistency
%%% write(Key_to_write, Element_to_write, Db_to_write_to)
%%%   Writes key element pair as a tuple in specified database
%%% delete(Key_to_search, Db_to_delete_from)
%%%   Deletes a key element tuple from specified database
%%% read(Key, Db)
%%%   Reads an element from key element tuple from specified database
%%% match(Element_to_match, Db)
%%%   Returns keys that match key element tuples from specified database
%%%---------------------------------------------------------------------
-module(db).
-export([new/0, destroy/1, write/3, delete/2, read/2, match/2]).


%%----------------------------------------------------------------------
%% API function new
%% Returns an empty list which serves as a new db
%%----------------------------------------------------------------------
new() ->
  [].


%%----------------------------------------------------------------------
%% API function destroy
%% Returns the atom ok, implemented for consistency
%%----------------------------------------------------------------------
destroy(_Db) ->
  ok.


%%----------------------------------------------------------------------
%% API function write
%% Appends key value tuple to specified db list
%%----------------------------------------------------------------------
write(Key, Elem, Db) ->
  [{Key, Elem} | Db].


%%----------------------------------------------------------------------
%% API function delete
%% Deletes a key value tuple from specified db list by searching
%% for a tuple that matches the the specified key
%%----------------------------------------------------------------------
delete(Key, Db) ->
  delete_acc(Key, Db, []).

delete_acc(_Key, [], New) -> New;
delete_acc(Key, [Db_h | Db_t], New) ->
  case Db_h of
    {Key, _} -> delete_acc(Key, Db_t, New);
    {_, _} -> delete_acc(Key, Db_t, [Db_h | New])
  end.


%%----------------------------------------------------------------------
%% API function read
%% Returns a value from a key value tuple in specified db list
%% by searching for keys
%%----------------------------------------------------------------------
read(Value) -> Value.

read(Key, []) -> {error, not_found};
read(Key, [Db_h | Db_t]) ->
  case Db_h of
    {Key, Value} -> read(Value);
    {_Key, _Value} -> read(Key, Db_t)
  end.


%%----------------------------------------------------------------------
%% API function match
%% Returns key(s) from a key/element tuple in specified db list
%% by searching for values
%%----------------------------------------------------------------------
match(Search, Db) ->
  match_acc(Search, Db, []).

match_acc(_Search, [], Matches) -> Matches;
match_acc(Search, [Db_h | Db_t], Matches) ->
  case Db_h of
    {Key, Search} -> match_acc(Search, Db_t, [Key | Matches]);
    {_, _} -> match_acc(Search, Db_t, Matches)
  end.