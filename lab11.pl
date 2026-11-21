:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

%start
start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

%menu
menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    do(Choice).

%action
do(1) :- !,
    findall(L, letter(L), Letters),
    write('Current letters: '), write(Letters), nl,
    menu.

do(2) :- !,                               % add (same as assertz)
    write('Enter the letter to add (end with a full stop): '), nl,
    read(L), assert(letter(L)),
    menu.

do(3) :- !,                               % add at the top
    write('Enter the letter to add at the top: '), nl,
    read(L), asserta(letter(L)),
    menu.

do(4) :- !,                               % add at the bottom
    write('Enter the letter to add at the bottom: '), nl,
    read(L), assertz(letter(L)),
    menu.

do(5) :- !,                               % delete one letter
    write('Enter the letter to delete: '), nl,
    read(L),
    (   retract(letter(L))
    ->  write('Letter deleted.'), nl
    ;   write('That letter is not in the set.'), nl
    ),
    menu.

do(6) :- !,                               % delete all letters
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

do(7) :- !,
    write('Goodbye!'), nl.

do(_) :-                                  % anything else
    write('Invalid choice, try again.'), nl,
    menu.