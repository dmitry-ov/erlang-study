-module(tut11).
-export([month_length/2]).

month_length(Year, Month) ->
    %% Все годы, делящиеся на 400 - високосные
    %% Годы, делящиеся на 100 – не високосные(кроме тех, что делятся на 400)
    %% Годы, делящиеся на 4 не високосные(кроме тех, что делятся на 100)
    Leap = if
        trunc(Year / 400) * 400 == Year ->
            leap;
        trunc(Year / 100) * 100 == Year ->
            not_leap;
        trunc(Year / 4) * 4 == Year ->
            leap;
        true ->
            not_leap
    end,  
    case Month of
        sep -> 30;
        apr -> 30;
        jun -> 30;
        nov -> 30;
        feb when Leap == leap -> 29;
        feb -> 28;
        jan -> 31;
        mar -> 31;
        may -> 31;
        jul -> 31;
        aug -> 31;
        oct -> 31;
        dec -> 31
    end.