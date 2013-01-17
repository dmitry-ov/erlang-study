-module(tut1).
-export([start/1, fac/1, mult/2]).


mult(X, Y) ->
  X * Y.




fac(0) ->
  io:format("~p~n", ["-"]),
  httpc:request(get, {"http://192.168.89.143:3000", []}, [], []);

fac(N) ->
  % io:format("~p~n", ["+"]),
  httpc:request(get, {"http://192.168.89.143:3000", []}, [], []),
  fac(N - 1).

start(Times) ->
  spawn(tut1, fac, [Times]),
  spawn(tut1, fac, [Times]),
  spawn(tut1, fac, [Times]).