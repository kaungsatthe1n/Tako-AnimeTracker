// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIAnimeResult _$APIAnimeResultFromJson(Map<String, dynamic> json) =>
    APIAnimeResult(
      results: (json['results'] as List<dynamic>)
          .map((e) => APIAnime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APIAnimeResultToJson(APIAnimeResult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

APIAnime _$APIAnimeFromJson(Map<String, dynamic> json) => APIAnime(
      id: json['mal_id'] as int,
      url: json['url'] as String,
      airing: json['airing'] as bool,
      endDate: json['end_date'] as String,
      episodes: json['episodes'] as int,
      imageUrl: json['image_url'] as String,
      members: json['members'] as int,
      rated: json['rated'] as String,
      score: (json['score'] as num).toDouble(),
      startDate: json['start_date'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$APIAnimeToJson(APIAnime instance) => <String, dynamic>{
      'mal_id': instance.id,
      'url': instance.url,
      'image_url': instance.imageUrl,
      'title': instance.title,
      'airing': instance.airing,
      'type': instance.type,
      'episodes': instance.episodes,
      'score': instance.score,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'members': instance.members,
      'rated': instance.rated,
    };

APISeasonResult _$APISeasonResultFromJson(Map<String, dynamic> json) =>
    APISeasonResult(
      top: (json['top'] as List<dynamic>)
          .map((e) => APISeasonAnime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APISeasonResultToJson(APISeasonResult instance) =>
    <String, dynamic>{
      'top': instance.top,
    };

APISeasonAnime _$APISeasonAnimeFromJson(Map<String, dynamic> json) =>
    APISeasonAnime(
      id: json['mal_id'] as int,
      endDate: json['end_date'] as String,
      episodes: json['episodes'] as int,
      imageUrl: json['image_url'] as String,
      score: (json['score'] as num).toDouble(),
      startDate: json['start_date'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      rank: json['rank'] as int,
    );

Map<String, dynamic> _$APISeasonAnimeToJson(APISeasonAnime instance) =>
    <String, dynamic>{
      'mal_id': instance.id,
      'rank': instance.rank,
      'title': instance.title,
      'url': instance.url,
      'image_url': instance.imageUrl,
      'episodes': instance.episodes,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'score': instance.score,
    };

APICharactersResult _$APICharactersResultFromJson(Map<String, dynamic> json) =>
    APICharactersResult(
      characters: (json['characters'] as List<dynamic>)
          .map((e) => APICharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APICharactersResultToJson(
        APICharactersResult instance) =>
    <String, dynamic>{
      'characters': instance.characters,
    };

APICharacter _$APICharacterFromJson(Map<String, dynamic> json) => APICharacter(
      name: json['name'] as String,
      role: json['role'] as String,
      url: json['url'] as String,
      imageUrl: json['image_url'] as String,
      id: json['mal_id'] as int,
      voiceActors: (json['voice_actors'] as List<dynamic>)
          .map((e) => VoiceActor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APICharacterToJson(APICharacter instance) =>
    <String, dynamic>{
      'mal_id': instance.id,
      'url': instance.url,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'role': instance.role,
      'voice_actors': instance.voiceActors,
    };

VoiceActor _$VoiceActorFromJson(Map<String, dynamic> json) => VoiceActor(
      id: json['mal_id'] as int,
      imageUrl: json['image_url'] as String,
      url: json['url'] as String,
      language: json['language'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$VoiceActorToJson(VoiceActor instance) =>
    <String, dynamic>{
      'mal_id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'image_url': instance.imageUrl,
      'language': instance.language,
    };

Anime _$AnimeFromJson(Map<String, dynamic> json) => Anime(
      episodes: json['episodes'] as int,
      id: json['mal_id'] as int,
      imageUrl: json['image_url'] as String,
      rank: json['rank'] as int,
      score: (json['score'] as num).toDouble(),
      title: json['title'] as String,
      url: json['url'] as String,
      duration: json['duration'] as String,
      endingThemes: (json['ending_themes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      openingThemes: (json['opening_themes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      premiered: json['premiered'] as String,
      popularity: json['popularity'] as int,
      producers: (json['producers'] as List<dynamic>)
          .map((e) => Producer.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: json['rating'] as String,
      status: json['status'] as String,
      studios: (json['studios'] as List<dynamic>)
          .map((e) => Studio.fromJson(e as Map<String, dynamic>))
          .toList(),
      synopsis: json['synopsis'] as String,
      titleJp: json['title_japanese'] as String,
      trailerUrl: json['trailer_url'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'mal_id': instance.id,
      'url': instance.url,
      'image_url': instance.imageUrl,
      'trailer_url': instance.trailerUrl,
      'title': instance.title,
      'title_japanese': instance.titleJp,
      'type': instance.type,
      'episodes': instance.episodes,
      'premiered': instance.premiered,
      'status': instance.status,
      'duration': instance.duration,
      'rating': instance.rating,
      'score': instance.score,
      'rank': instance.rank,
      'popularity': instance.popularity,
      'synopsis': instance.synopsis,
      'producers': instance.producers,
      'studios': instance.studios,
      'genres': instance.genres,
      'opening_themes': instance.openingThemes,
      'ending_themes': instance.endingThemes,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: json['mal_id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'mal_id': instance.id,
      'name': instance.name,
    };

Studio _$StudioFromJson(Map<String, dynamic> json) => Studio(
      name: json['name'] as String,
      id: json['mal_id'] as int,
    );

Map<String, dynamic> _$StudioToJson(Studio instance) => <String, dynamic>{
      'mal_id': instance.id,
      'name': instance.name,
    };

Producer _$ProducerFromJson(Map<String, dynamic> json) => Producer(
      id: json['mal_id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProducerToJson(Producer instance) => <String, dynamic>{
      'mal_id': instance.id,
      'name': instance.name,
    };

APIVideoResult _$APIVideoResultFromJson(Map<String, dynamic> json) =>
    APIVideoResult(
      promo: (json['promo'] as List<dynamic>)
          .map((e) => Promo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APIVideoResultToJson(APIVideoResult instance) =>
    <String, dynamic>{
      'promo': instance.promo,
    };

Promo _$PromoFromJson(Map<String, dynamic> json) => Promo(
      imageUrl: json['image_url'] as String,
      title: json['title'] as String,
      videoUrl: json['video_url'] as String,
    );

Map<String, dynamic> _$PromoToJson(Promo instance) => <String, dynamic>{
      'title': instance.title,
      'image_url': instance.imageUrl,
      'video_url': instance.videoUrl,
    };
