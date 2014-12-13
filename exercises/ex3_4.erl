%%%--------------------------------------------------------------------- 
%%% Description module db (ex3_4)
%%%--------------------------------------------------------------------- 
%%% Database handling using lists
%%%
%%% API
%%%
%%% db:new()
%%% db:destroy(Db)
%%% db.write(Key, Element, Db)
%%% db.delete(Key, Db)
%%% db.read(Key, Db)
%%% db.match(Element, Db)
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% 
%%% 
%%%---------------------------------------------------------------------
-module(ex3_4).
-export([new/0, destroy/1, write/3, delete/2, read/2, match/2]).


%%----------------------------------------------------------------------
%% API function new
%% Returns an empty list which serves as a new database
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
%% Adds key value tuples to specified database list
%%----------------------------------------------------------------------
write(Key, Element, Db) ->
  [].


%%----------------------------------------------------------------------
%% API function delete
%% Deletes a key value tuple from specified database list by searching
%% for a tuple that matches the the specified key
%%----------------------------------------------------------------------
delete(Key, Db) ->
  [].

%%----------------------------------------------------------------------
%% API function read
%% Returns a value from a key value tuple in specified database list
%% by searching for keys
%%----------------------------------------------------------------------
read(Key, Db) ->
  [].


%%----------------------------------------------------------------------
%% API function match
%% Returns a key from a key value tuple in specified database list
%% by searching for values
%%----------------------------------------------------------------------
match(Element, Db) ->
  [].
