%%%--------------------------------------------------------------------- 
%%% Description module db (ex3_4)
%%%--------------------------------------------------------------------- 
%%% Database handling using lists
%%%
%%% API
%%%
%%% db:new()
%%% db:destroy(Db)
%%% db.write(Key, Elem, Db)
%%% db.delete(Key, Db)
%%% db.read(Key, Db)
%%% db.match(Elem, Db)
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% 
%%% 
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
read(_Key, []) -> {error, not_found};
read(Key, [Db_h | Db_t]) ->
  case matchesKey(Key, Db_h) of
    {ok, Tuple_elem} -> {ok, Tuple_elem};
    {error, _Err_desc} -> read(Key, Db_t)
  end.

%%----------------------------------------------------------------------
%% Internal function matchesKey
%% Example: 
%% matchesKey(hello, {hello, world}) returns {ok, world}
%% matchesKey(hello, {hey, world}) returns {error, not_found}
%%----------------------------------------------------------------------
matchesKey(_Q_key, {_Tuple_key, Tuple_elem}) when _Q_key == _Tuple_key ->
  {ok, Tuple_elem};
matchesKey(_Q_key, {_Tuple_key, _Tuple_elem}) ->
  {error, not_found}.


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