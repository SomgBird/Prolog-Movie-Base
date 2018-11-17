:- consult('movies.pl').

print :- forall(movie(M), (write(M), nl)).

same_genre(F1, F2) :- genre(F1, A), genre(F2, B), A == B.
same_director(F1, F2) :- film_director(F1, A), film_director(F2, B), A == B.
same_star(F1, F2) :- star(F1, A), star(F2, B), A == B.

similar_movies(F1, F2) :- same_genre(F1, F2), same_director(F1, F2).