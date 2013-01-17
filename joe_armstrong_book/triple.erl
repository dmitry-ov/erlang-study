
application:start(inets).
application:start(crypto). 
application:start(public_key). 
application:start(ssl).

httpc:request(get, {"https://kolomna.ascon.ru/bugs/", []}, [], []).


httpc:request(get, {"http://192.168.89.142:3000", []}, [], []).



httpc:set_options([{proxy, {{"fw1", 8080},["localhost"]}}]).
httpc:request(get, {"http://ya.ru", []}, [{proxy_auth, {"ovcharenko", "g3TPdp"}}], []).
httpc:request(get, {"http://kolomna.ascon.ru/bugs/", []}, [{proxy_auth, {"ovcharenko", "g3TPdp"}}], []).

A = httpc:request(get, {"http://kolomna.ascon.ru/bugs/", []}, [], []).


F = fun() -> 
httpc:request(get, {"http://192.168.89.143:3000", []}, [], [])
end.

spawn(F).

httpc:request(get, {"http://192.168.89.143:3000", []}, [], []).









getrespond(Times) ->
  getrespond(0);

getrespond(Url, Times) ->
    % io:format("~p~n", [Url]), 
    httpc:request(get, {Url, []}, [], []),
    getrespond(Url, Times - 1).


start() ->
   spawn(tut14, get_respond, ["http://192.168.89.143:3000", 3]).




fac(N) when N == 0 -> ;
fac(N) when N > 0  -> N*fac(N-1).













