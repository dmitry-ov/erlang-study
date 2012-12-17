-module(tut16).
-export([start/0, ping/1, pong/0]).

ping(0) ->
    pong ! finished, 
    io:format("Пинг завершил работу~n", []);

ping(N) ->
    pong ! {ping, self()}, 
    receive
        pong ->
            io:format("Пинг получил понг~n", [])
    end, 
    ping(N - 1).

pong() ->
    receive
        finished ->
            io:format("Понг завершил работу~n", []);
        {ping, Ping_PID} ->
            io:format("Понг получил пинг~n", []), 
            Ping_PID ! pong, 
            pong()
    end.

start() ->
    register(pong, spawn(tut16, pong, [])), 
    spawn(tut16, ping, [3]).