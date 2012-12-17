%% Этот модуль находится в файле tut5.erl

-module(tut5).
-export([format_temps/1]).

%% Экспортируется только эта функция 
format_temps([])->% Для пустого списка вывод не производится
  ok;
format_temps([City | Rest]) ->
  print_temp(convert_to_celsius(City)),
  format_temps(Rest).

% Конвертация не нужна
convert_to_celsius({Name, {c, Temp}}) ->
  {Name, {c, Temp}};
% Выполнить конвертацию
convert_to_celsius({Name, {f, Temp}}) ->
  {Name, {c, (Temp - 32) * 5 / 9}}.

print_temp({Name, {c, Temp}}) ->
  io:format("~-15w ~w c~n", [Name, Temp]).