class Genre {
  String name;
  int id;
  bool selected = false;

  Genre({
    required this.name,
    required this.id,
  });
}

List<Genre> genreList = [
  Genre(id: 1, name: 'Action'),
  Genre(id: 2, name: 'Adventure'),
  Genre(id: 3, name: 'Cars'),
  Genre(id: 4, name: 'Comedy'),
  Genre(id: 5, name: 'Avante Garte'),
  Genre(id: 6, name: 'Demons'),
  Genre(id: 7, name: 'Mystery'),
  Genre(id: 8, name: 'Drama'),
  Genre(id: 9, name: 'Ecchi'),
  Genre(id: 10, name: 'Fantasy'),
  Genre(id: 11, name: 'Game'),
  Genre(id: 12, name: 'Hentai'),
  Genre(id: 13, name: 'Historical'),
  Genre(id: 14, name: 'Horror'),
  Genre(id: 15, name: 'Kids'),
  Genre(id: 17, name: 'Material Arts'),
  Genre(id: 18, name: 'Mecha'),
  Genre(id: 19, name: 'Music'),
  Genre(id: 20, name: 'Parody'),
  Genre(id: 21, name: 'Samurai'),
  Genre(id: 22, name: 'Romance'),
  Genre(id: 23, name: 'School'),
  Genre(id: 24, name: 'Sci Fi'),
  Genre(id: 25, name: 'Shoujo'),
  Genre(id: 26, name: 'Girls Love'),
  Genre(id: 27, name: 'Shounen'),
  Genre(id: 28, name: 'Boys Love'),
  Genre(id: 29, name: 'Space'),
  Genre(id: 30, name: 'Sports'),
  Genre(id: 31, name: 'Super Power'),
  Genre(id: 32, name: 'Vampire'),
  Genre(id: 35, name: 'Harem'),
  Genre(id: 36, name: 'Slice Of Life'),
  Genre(id: 37, name: 'Supernatural'),
  Genre(id: 38, name: 'Military'),
  Genre(id: 39, name: 'Police'),
  Genre(id: 40, name: 'Psychological'),
  Genre(id: 41, name: 'Suspense'),
  Genre(id: 42, name: 'Seinen'),
  Genre(id: 43, name: 'Josei'),
  Genre(id: 46, name: 'Award Winning'),
  Genre(id: 47, name: 'Gourmet'),
  Genre(id: 48, name: 'Work Life'),
  Genre(id: 49, name: 'Erotica'),
];
