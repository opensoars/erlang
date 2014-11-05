%%%--------------------------------------------------------------------- 
%%% Description module frequency
%%%--------------------------------------------------------------------- 
%%% Frequency allocating and deallocating example using 6 hardcoded
%%% frequencies. This could be seen as a real phone call handling
%%% mechanism.
%%%
%%%--------------------------------------------------------------------- 
%%% Exports
%%%--------------------------------------------------------------------- 
%%% start()
%%%   Starts our server so we are ready for allocations
%%% allocate()
%%%   Allocates an acual Frequency and removes the allocated
%%%   frequency from the free frequencies list
%%% deallocate(Frequency_to_deallocate)
%%%   Deallocates Frequency_to_deallocate and puts it back in the
%%%   free frequencies list
%%% stop()
%%%   Stops our server
%%%---------------------------------------------------------------------