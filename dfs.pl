% Facts

connected(p,q).
connected(p,r).
connected(q,s).
connected(q,t).
connected(r,u).
connected(r,v).
connected(s,w).
connected(t,w).
connected(u,x).
connected(v,x).
connected(w,z).
connected(x,z).

% Depth First Search

dfs(Start, Goal, Path) :-
    search(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

search(Goal, Goal, Path, Path).

search(Node, Goal, Visited, Path) :-
    connected(Node, Next),
    \+ member(Next, Visited),
    search(Next, Goal, [Next|Visited], Path).