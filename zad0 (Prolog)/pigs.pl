theme(fauna).
theme(flora).
theme(sport).
theme(kosmos).

% основная часть кода
solve(Animals) :-
    Animals = [_, _, _, _], % Неизвестные символы
    member([wolf, fauna], Animals), % Условие задачи: волк коллекционирует фауну.
    member([nif, TemaNif], Animals), theme(TemaNif), TemaNif \= fauna,
    member([naf, TemaNaf], Animals), theme(TemaNaf), TemaNaf \= fauna,
    member([nuf, TemaNuf], Animals), theme(TemaNuf), TemaNuf \= fauna,
    sleva_ot([wolf, fauna], [naf, TemaNaf], Animals), % Условие задачи: волк слева от нафа
    sprava_ot([nif, TemaNif], [_, kosmos], Animals),  % Условие задачи: ниф справа от собирателя космоса
    naprotiv([nuf, TemaNuf], [naf, TemaNaf], Animals), % Условие задачи: нуф напротив нафа
    TemaNuf \= sport, % Условие задачи: нуф не любит спорт
    all_different([fauna, TemaNif, TemaNaf, TemaNuf]).

% Проверка на позицию в пространстве
sleva_ot(Odin, Vtoroi, [Odin, Vtoroi | _]).
sleva_ot(Odin, Vtoroi, [_ | Ostatok_spiska]) :- sleva_ot(Odin, Vtoroi, Ostatok_spiska).

sprava_ot(Odin, Vtoroi, [Vtoroi, Odin | _]).
sprava_ot(Odin, Vtoroi, [_ | Ostatok_spiska]) :- sprava_ot(Odin, Vtoroi, Ostatok_spiska).

naprotiv(Odin, Vtoroi, [Odin, _, Vtoroi, _]).
naprotiv(Odin, Vtoroi, [_, Odin, _, Vtoroi]).

% Проверка на уникальность
all_different([]).
all_different([Start|End]) :- not(member(Start, End)), all_different(End).
