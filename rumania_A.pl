%Best first search for the map of romania

%h(city, SLdistance): h is the straight line distance
h(arad, 366).
h(bucharest,0).
h(craiova,160).
h(dobreta,242).
h(eforie,161).
h(fagaras,178).
h(giurgiu,77).
h(hirsova,151).
h(iasi,226).
h(lugoj,244).
h(mehadia,241).
h(neamt,234).
h(oradea,380).
h(pitesti,98).
h(rimnicuVilcea,193).
h(sibiu,253).
h(timisoara,329).
h(urziceni,80).
h(vaslui,199).
h(zerind,374).

%moves(city1, city1, distance)
move(arad, zerind, 75).
move(arad, sibiu, 140).
move(arad, timisoara, 118).
move(zerind, oradea, 71).
move(oradea, sibiu, 151).
move(timisoara, lugoj, 111).
move(sibiu, fagaras, 99).
move(sibiu, rimnicuVilcea, 80).
move(logoj, mehadia, 70).
move(mehadia, dobreta, 75).
move(dobreta, craiova, 120).
move(rimnicuVilcea, craiova, 146).
move(craiova, pitesti, 138).
move(rimnicuVilcea, pitesti, 97).
move(fagaras, bucharest, 211).
move(pitesti, bucharest, 101).
move(giurgiu, bucharest, 90).
move(bucharest, urziceni, 85).
move(hirsova, eforie, 86).
move(urziceni, vaslui, 142).
move(vaslui, iasi, 92).
move(iasi, neamt, 87).
move(urziceni, hirsova, 98).

state_record(State, Parent, G,H,F, [State, Parent,G,H,F]).
precedes([_,_,_,F1],[_,_,_,F2]):-
    F1 =< F2.

go(Start, Goal) :-
    empty_set(Closed),
    empty_sort_queue(Empty_open),
    h(Start, Goal, H),
    state_record(Start, nil, 0, H, H, First_record),
    insert_sort_queue(First_record, Empty_open, Open),
    path(Open, Closed, Goal).

path(Open,_,_):-
    empty_sort_queue(Open),
    write('Graph searched, not found').

path(Open, Closed, Goal) :-
    remove_sort_queue(First_record, Open, _),
    state_record(State,_,_,_,_,First_record),
    State = Goal,
    write('Solution path is:'), nl,
    printsolution(First_record, Closed).

printsolution(State_record, _):-
    state_record(State, nil, State_record),
    write(State), nl.

printsolution(State_record, Closed):-
    state_record(State, Parent, State_record),
    state_record(Parent,_,Parent_record),
    member(Parent_record, Closed),
    printsolution(Parent_record, Closed),
    write(State),nl.

insert_sort_queue(State, [],[State]).
insert_sort_queue(State, [H|T], [State, H|T]) :-
    precedes(State, H).
insert_sort_queue(State, [H|T], [H|T_new]) :-
    insert_sort_queue(State, T, T_new).

remove_sort_queue(First, [First|Rest], Rest).

empty_set([]).
empty_queue([]).
empty_sort_queue([]).











