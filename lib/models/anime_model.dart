import 'package:chopper/chopper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable()
class APIAnimeResult {
  List<APIAnime> results;

  APIAnimeResult({required this.results});

  factory APIAnimeResult.fromJson(Map<String, dynamic> json) =>
      _$APIAnimeResultFromJson(json);
  Map<String, dynamic> toJson() => _$APIAnimeResultToJson(this);
}

@JsonSerializable()
class APIAnime {
  @JsonKey(name: 'mal_id')
  int id;
  String url;
  @JsonKey(name: 'image_url')
  String imageUrl;
  String title;
  bool airing;
  String type;
  int episodes;
  double score;
  @JsonKey(name: 'start_date')
  String startDate;
  @JsonKey(name: 'end_date')
  String endDate;
  int members;
  String rated;

  APIAnime({
    required this.id,
    required this.url,
    required this.airing,
    required this.endDate,
    required this.episodes,
    required this.imageUrl,
    required this.members,
    required this.rated,
    required this.score,
    required this.startDate,
    required this.title,
    required this.type,
  });

  factory APIAnime.fromJson(Map<String, dynamic> json) =>
      _$APIAnimeFromJson(json);
  Map<String, dynamic> toJson() => _$APIAnimeToJson(this);
}

@JsonSerializable()
class APISeasonResult {
  List<APISeasonAnime> top;

  APISeasonResult({required this.top});

  factory APISeasonResult.fromJson(Map<String, dynamic> json) =>
      _$APISeasonResultFromJson(json);
  Map<String, dynamic> toJson() => _$APISeasonResultToJson(this);
}

@JsonSerializable()
class APISeasonAnime {
  @JsonKey(name: 'mal_id')
  int id;
  int rank;
  String title;
  String url;
  @JsonKey(name: 'image_url')
  String imageUrl;
  int episodes;
  @JsonKey(name: 'start_date')
  String startDate;
  @JsonKey(name: 'end_date')
  String endDate;
  double score;

  APISeasonAnime({
    required this.id,
    required this.endDate,
    required this.episodes,
    required this.imageUrl,
    required this.score,
    required this.startDate,
    required this.title,
    required this.url,
    required this.rank,
  });

  factory APISeasonAnime.fromJson(Map<String, dynamic> json) =>
      _$APISeasonAnimeFromJson(json);
  Map<String, dynamic> toJson() => _$APISeasonAnimeToJson(this);
}

@JsonSerializable()
class APICharactersResult {
  List<APICharacter> characters;

  APICharactersResult({required this.characters});

  factory APICharactersResult.fromJson(Map<String, dynamic> json) =>
      _$APICharactersResultFromJson(json);

  Map<String, dynamic> toJson() => _$APICharactersResultToJson(this);
}

@JsonSerializable()
class APICharacter {
  @JsonKey(name: 'mal_id')
  int id;
  String url;
  @JsonKey(name: 'image_url')
  String imageUrl;
  String name;
  String role;
  @JsonKey(name: 'voice_actors')
  List<VoiceActor> voiceActors;

  APICharacter(
      {required this.name,
      required this.role,
      required this.url,
      required this.imageUrl,
      required this.id,
      required this.voiceActors});

  factory APICharacter.fromJson(Map<String, dynamic> json) =>
      _$APICharacterFromJson(json);
  Map<String, dynamic> toJson() => _$APICharacterToJson(this);
}

@JsonSerializable()
class VoiceActor {
  @JsonKey(name: 'mal_id')
  int id;
  String name;
  String url;
  @JsonKey(name: 'image_url')
  String imageUrl;
  String language;

  VoiceActor({
    required this.id,
    required this.imageUrl,
    required this.url,
    required this.language,
    required this.name,
  });

  factory VoiceActor.fromJson(Map<String, dynamic> json) =>
      _$VoiceActorFromJson(json);
  Map<String, dynamic> toJson() => _$VoiceActorToJson(this);
}

@JsonSerializable()
class Anime {
  @JsonKey(name: 'mal_id')
  int id;
  String url;
  @JsonKey(name: 'image_url')
  String imageUrl;
  @JsonKey(name: 'trailer_url')
  String trailerUrl;
  String title;
  @JsonKey(name: 'title_japanese')
  String titleJp;
  String type;
  int episodes;
  String status;
  String duration;
  String rating;
  double score;
  int rank;
  int popularity;
  String synopsis;
  List<Producer> producers;
  List<Studio> studios;
  List<Genre> genres;
  @JsonKey(name: 'opening_themes')
  List<String> openingThemes;
  @JsonKey(name: 'ending_themes')
  List<String> endingThemes;

  Anime({
    required this.episodes,
    required this.id,
    required this.imageUrl,
    required this.rank,
    required this.score,
    required this.title,
    required this.url,
    required this.duration,
    required this.endingThemes,
    required this.genres,
    required this.openingThemes,
    required this.popularity,
    required this.producers,
    required this.rating,
    required this.status,
    required this.studios,
    required this.synopsis,
    required this.titleJp,
    required this.trailerUrl,
    required this.type,
  });
  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class Genre {
  @JsonKey(name: 'mal_id')
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class Studio {
  @JsonKey(name: 'mal_id')
  int id;
  String name;

  Studio({
    required this.name,
    required this.id,
  });
  factory Studio.fromJson(Map<String, dynamic> json) => _$StudioFromJson(json);
  Map<String, dynamic> toJson() => _$StudioToJson(this);
}

@JsonSerializable()
class Producer {
  @JsonKey(name: 'mal_id')
  int id;
  String name;

  Producer({
    required this.id,
    required this.name,
  });
  factory Producer.fromJson(Map<String, dynamic> json) =>
      _$ProducerFromJson(json);
  Map<String, dynamic> toJson() => _$ProducerToJson(this);
}

@JsonSerializable()
class APIVideoResult {
  List<Promo> promo;

  APIVideoResult({required this.promo});

  factory APIVideoResult.fromJson(Map<String, dynamic> json) =>
      _$APIVideoResultFromJson(json);

  Map<String, dynamic> toJson() => _$APIVideoResultToJson(this);
}

@JsonSerializable()
class Promo {
  String title;
  @JsonKey(name: 'image_url')
  String imageUrl;
  @JsonKey(name: 'video_url')
  String videoUrl;

  Promo({
    required this.imageUrl,
    required this.title,
    required this.videoUrl,
  });
  factory Promo.fromJson(Map<String, dynamic> json) => _$PromoFromJson(json);

  Map<String, dynamic> toJson() => _$PromoToJson(this);
}
