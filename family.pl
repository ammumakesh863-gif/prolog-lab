male(tom).
male(bob).
male(pat).
male(jim).

female(pam).
female(ann).
female(liz).

parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).

father(X,Y) :-
    male(X),
    parent(X,Y).

mother(X,Y) :-
    female(X),
    parent(X,Y).

grandparent(X,Y) :-
    parent(X,Z),
    parent(Z,Y).
