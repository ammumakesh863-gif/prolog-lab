in_room(monkey).
in_room(chair).
in_room(bananas).

at(monkey,corner).
at(chair,window).
at(bananas,center).

can_push(monkey,chair).
can_climb(monkey,chair).
can_grasp(monkey,bananas).

can_reach(monkey,bananas) :-
    in_room(monkey),
    in_room(chair),
    in_room(bananas),
    can_push(monkey,chair),
    can_climb(monkey,chair),
    can_grasp(monkey,bananas).