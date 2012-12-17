%-module(tut13).
%-export([convert_list_to_c/1]).

%convert_to_c({Name, {f, Temp}}) ->
%    {Name, {c, trunc((Temp - 32) * 5 / 9)}};
%convert_to_c({Name, {c, Temp}}) ->
%    {Name, {c, Temp}}.

%convert_list_to_c(List) ->
%    lists:map(fun convert_to_c/1, List).


-module(tut13).

-export([convert_list_to_c/1]).
%-export([print_how_conrert_list_to_c/1]).


convert_to_c({Name, {Value_temp, Temp}}) ->
  if 
  	Value_temp == f -> {Name, {c, trunc((Temp - 32) * 5 / 9)}};
    true -> {Name, {c, Temp}}
  end.  


convert_list_to_c(List) ->
  New_list = lists:map(fun convert_to_c/1, List), 
  lists:sort(fun({_, {_, Temp1}}, {_, {_, Temp2}}) ->
    Temp1 < Temp2 end, New_list).




