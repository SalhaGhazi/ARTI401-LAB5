%------(GENDER FACT)------------
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

%--------(PARENT FACT)----------
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).


parent(homer, bart).
parent(homer, lisa).


parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).


parent(selma, ling).


%-----------RULES-------------
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).


son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).


brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \== Y.
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \== Y.


grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).


uncle(X, Y) :- parent(Z, Y), brother(X, Z).
aunt(X, Y) :- parent(Z, Y), sister(X, Z).


cousin(X, Y) :- parent(P1, X), parent(P2, Y), brother(P1, P2);
                parent(P1, X), parent(P2, Y), sister(P1, P2);
                parent(P1, X), parent(P2, Y), brother(P2, P1);
                parent(P1, X), parent(P2, Y), sister(P2, P1).


ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

