class Movie:
    title = ""
    film_directors = []
    genres = []
    stars = []
    _SEPS = [',', ', ', ' ,', ' , ']

    def __init__(self):
        """
        Create movie object
        """
        while True:
            # Read movie title
            title = input("Input movie title: ")

            if title == "":
                print("Movie title must be non empty!")
                continue

            # Read movie directors
            dirs = input("Input movie directors divided by ',': ")
            dir_list = Movie.__split_list(dirs, self._SEPS)

            if not dir_list:
                print("Directors list must be non empty!")
                continue

            for d in dir_list:
                if d == "":
                    print("Movie genre must be non empty!")
                    continue

            # Read movie genres
            genres = input("Input movie genres divided by ',': ")
            genres_list = Movie.__split_list(genres, self._SEPS)

            if not genres_list:
                print("Genres list must be non empty!")
                continue

            for g in genres_list:
                if g == "":
                    print("Movie genre must be non empty!")
                    continue

            # Read movie stars
            stars = input("Input movie stars divided by ',': ")
            stars_list = Movie.__split_list(stars, self._SEPS)

            if not stars_list:
                print("Genres list must be non empty!")
                continue

            for s in stars_list:
                if s == "":
                    print("Movie star must be non empty!")
                    continue

            # if OK save movie info
            self.title = title
            self.film_directors = dir_list
            self.genres = genres_list
            self.stars = stars_list

            break

    @staticmethod
    def __split_list (txt, seps):
        """
        Divide string txt by separators seps
        :param txt: string for divide
        :param seps: separators
        :return: list of divided string parts
        """
        default_sep = seps[0]

        for sep in seps[1:]:
            txt = txt.replace(sep, default_sep)

        return [i.strip() for i in txt.split(default_sep)]


class MovieKnowledgeBase:
    _movies = []

    def __init__(self, base = None):
        """
        Create movie knowledge base
        :param base: old base file name
        """
        if base is None:
            return


        #todo read old base

    def __del__(self):
        # todo
        return

    def __write_base (self):
        """
        Create prolog file with facts about movies.
        """
        base_file = open('movies.pl', 'a')

        for m in self._movies:
            # Save movie title
            base_file.write("% " + m.title + " %\n")
            base_file.write(":- assert(movie('" + m.title + "')).\n")
            base_file.write("\n")

            # Save movie genres
            base_file.write("% Genres\n")
            for g in m.genres:
                base_file.write(":- assert(genre('" + m.title + "', '" + g + "')).\n")
            base_file.write("\n")

            # Save directors
            base_file.write("% Film directors\n")
            for d in m.film_directors:
                base_file.write(":- assert(film_director('" + m.title + "', '" + d + "')).\n")
            base_file.write("\n")

            # Save stars
            base_file.write("% Stars\n")
            for s in m.stars:
                base_file.write(":- assert(star('" + m.title + "', '" + s + "')).\n")
            base_file.write("\n\n")

        base_file.close()


    def base_session (self):
        while True:
            answer = input("Add new film (a) or close (c)? ")

            if answer == "a":
                m = Movie()
                self.add_movie(m)
            elif answer == "c":
                break

        self.__write_base()


    def __read_base (self, base):
        # todo
        return


    def del_movie (self, movie_name):
        # todo
        return

    def add_movie (self, movie):
        if type(movie) is not Movie:
            print("Add_movie error!")
            return

        self._movies.append(movie)



mkb = MovieKnowledgeBase()
mkb.base_session()