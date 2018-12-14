:- consult('movies.pl').


% Find movies with same genre
same_genre(Movie1, Movie2) :- genre(Movie1, Genre1), genre(Movie2, Genre2), Genre1 = Genre2, Movie1 \= Movie2.

% Find movies with same director
same_director(Movie1, Movie2) :- film_director(Movie1, Dir1), film_director(Movie2, Dir2), Dir1 = Dir2,  Movie1 \= Movie2.

% Find movies with same star
same_star(Movie1, Movie2) :- star(Movie1, Star1), star(Movie2, Star2), Star1 = Star2,  Movie1 \= Movie2.

% Find similar movies
similar_movies(Movie1, Movie2) :- same_genre(Movie1, Movie2), same_director(Movie1, Movie2).
similar_movies(Movie1, Movie2) :- same_genre(Movie1, Movie2), same_star(Movie1, Movie2).
similar_movies(Movie1, Movie2) :- same_star(Movie1, Movie2), same_director(Movie1, Movie2).


% Print all movies in knowlagebase
print_all_movies :- forall(movie(M), (write(M), nl)).

% Print all genres
print_all_genres :- findall(Genre, genre(_, Genre), Result),
	sort(Result, GenreList), 
	forall(member(Genre, GenreList), (write(Genre), nl)).
	
% Print all directors
print_all_directors :- findall(Dir, film_director(_, Dir), Result),
	sort(Result, DirList), 
	forall(member(Dir, DirList), (write(Dir), nl)).

% Print all stars
print_all_stars :- findall(Star, star(_, Star), Result),
	sort(Result, DirList), 
	forall(member(Star, DirList), (write(Star), nl)).
	
% Print all movies with selected star
print_movies_by_star(Star) :- findall(Movie, star(Movie, Star), Result),
	sort(Result, MovieList), 
	forall(member(Movie, MovieList), (write(Movie), nl)).
	
% Print all movies with selected director
print_movies_by_director(Dir) :- findall(Movie, film_director(Movie, Dir), Result),
	sort(Result, MovieList), 
	forall(member(Movie, MovieList), (write(Movie), nl)).

% Print all movies with selected genre
print_movies_by_genre(Genre) :- findall(Movie, genre(Movie, Genre), Result),
	sort(Result, MovieList), 
	forall(member(Movie, MovieList), (write(Movie), nl)).

% Advise some movies to watch
advise_movie(MovieIWatched):- findall(M, similar_movies(MovieIWatched, M), Result),
	sort(Result, MovieList), 
	forall(member(Movie, MovieList), (write(Movie), nl)).
	
	
	