:- consult('movies.pl').

print :- forall(movie(M), (write(M), nl)).