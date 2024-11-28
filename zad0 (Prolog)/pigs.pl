theme(fauna).
theme(flora).
theme(sport).
theme(kosmos).

% �������� ����� ����
solve(Animals) :-
    Animals = [_, _, _, _], % ����������� �������
    member([wolf, fauna], Animals), % ������� ������: ���� ��������������� �����.
    member([nif, TemaNif], Animals), theme(TemaNif), TemaNif \= fauna,
    member([naf, TemaNaf], Animals), theme(TemaNaf), TemaNaf \= fauna,
    member([nuf, TemaNuf], Animals), theme(TemaNuf), TemaNuf \= fauna,
    sleva_ot([wolf, fauna], [naf, TemaNaf], Animals), % ������� ������: ���� ����� �� ����
    sprava_ot([nif, TemaNif], [_, kosmos], Animals),  % ������� ������: ��� ������ �� ���������� �������
    naprotiv([nuf, TemaNuf], [naf, TemaNaf], Animals), % ������� ������: ��� �������� ����
    TemaNuf \= sport, % ������� ������: ��� �� ����� �����
    all_different([fauna, TemaNif, TemaNaf, TemaNuf]).

% �������� �� ������� � ������������
sleva_ot(Odin, Vtoroi, [Odin, Vtoroi | _]).
sleva_ot(Odin, Vtoroi, [_ | Ostatok_spiska]) :- sleva_ot(Odin, Vtoroi, Ostatok_spiska).

sprava_ot(Odin, Vtoroi, [Vtoroi, Odin | _]).
sprava_ot(Odin, Vtoroi, [_ | Ostatok_spiska]) :- sprava_ot(Odin, Vtoroi, Ostatok_spiska).

naprotiv(Odin, Vtoroi, [Odin, _, Vtoroi, _]).
naprotiv(Odin, Vtoroi, [_, Odin, _, Vtoroi]).

% �������� �� ������������
all_different([]).
all_different([Start|End]) :- not(member(Start, End)), all_different(End).
