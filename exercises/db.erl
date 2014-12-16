%%%--------------------------------------------------------------------- 
%%% Description module ex3_7 (db)
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
