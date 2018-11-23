:- consult('movies.pl').

% Print all movies in knowlagebase
print_all_movies :- forall(movie(M), (write(M), nl)).

% Find movies with same genre
same_genre(Movie1, Movie2) :- genre(Movie1, A), genre(Movie2, B), A = B, Movie1 \= Movie2.
% Find movies with same director
same_director(Movie1, Movie2) :- film_director(Movie1, A), film_director(Movie2, B), A = B,  Movie1 \= Movie2.
% Find movies with same star
same_star(Movie1, Movie2) :- star(Movie1, A), star(Movie2, B), A = B,  Movie1 \= Movie2.

% Find similar movies
similar_movies(Movie1, Movie2) :- same_genre(Movie1, Movie2), same_director(Movie1, Movie2).
similar_movies(Movie1, Movie2) :- same_genre(Movie1, Movie2), same_star(Movie1, Movie2).
similar_movies(Movie1, Movie2) :- same_star(Movie1, Movie2), same_director(Movie1, Movie2).

% Advise some movies to watch
advise_movie(MovieIWatched):- findall(M, similar_movies(MovieIWatched, M), Result),
	sort(Result, MovieList), 
	forall(member(Movie, MovieList), (write(Movie), nl)).
	