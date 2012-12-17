-module(tut15).

-export([start/0, ping/2, pong/0]).

ping(0, Pong_PID) ->
    Pong_PID ! finished, 
    io:format("Ping finished job~n", []);

ping(N, Pong_PID) ->
    Pong_PID ! {ping, self()}, 
    receive
        pong ->
            io:format("Ping have pong~n", [])
    end, 
    ping(N - 1, Pong_PID).

pong() ->
    receive
        finished ->
            io:format("Pong finished job~n", []);
        {ping, Ping_PID} ->
            %io:format("~w", [Ping_PID]),
            io:format("Ping have pong~n", []), 
            Ping_PID ! pong, 
            pong()
    end.

start() ->
    Pong_PID = spawn(tut15, pong, []), 
    spawn(tut15, ping, [3, Pong_PID]).
    