% Medical Diagnosis Expert System

disease(influenza, [fever, cough, sore_throat, headache]).
disease(common_cold, [sneezing, nasal_congestion, sore_throat, cough]).
disease(migraine, [headache, photophobia, nausea, vomiting]).
disease(gastroenteritis, [nausea, vomiting, abdominal_pain, diarrhea]).

symptoms([
    fever, cough, sore_throat, nasal_congestion,
    sneezing, headache, photophobia, nausea,
    vomiting, abdominal_pain, diarrhea, dyspnea
]).

ask([], []).
ask([S|T], Selected) :-
    write('Do you have '), write(S),
    write('? (yes/no): '),
    read(A),
    ask(T, R),
    (A == yes -> Selected = [S|R] ; Selected = R).

matches([], _, 0).
matches([H|T], Symptoms, N) :-
    member(H, Symptoms),
    matches(T, Symptoms, N1),
    N is N1 + 1.
matches([H|T], Symptoms, N) :-
    \+ member(H, Symptoms),
    matches(T, Symptoms, N).

diagnose(Symptoms, Disease, Score) :-
    disease(Disease, Required),
    matches(Required, Symptoms, Score),
    Score >= 2.

show_results(Symptoms) :-
    nl,
    write('===== DIAGNOSIS RESULT ====='), nl,
    write('Symptoms: '), write(Symptoms), nl,
    write('Possible Conditions:'), nl,
    diagnose(Symptoms, Disease, Score),
    write(Disease),
    write(' - Matching Symptoms: '),
    write(Score), nl,
    fail.

show_results(_) :-
    nl,
    write('Please consult a healthcare professional.'), nl.

start :-
    nl,
    write('=============================='), nl,
    write(' MEDICAL DIAGNOSIS SYSTEM'), nl,
    write('=============================='), nl,
    write('Answer yes or no.'), nl,
    symptoms(All),
    ask(All, Selected),
    show_results(Selected).