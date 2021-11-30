// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AnimeService extends AnimeService {
  _$AnimeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AnimeService;

  @override
  Future<Response<APIAnimeQueryResult>> queryAnime(String query) {
    final $url = 'https://api.jikan.moe/v3/search/anime?';
    final $params = <String, dynamic>{'q': query};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<APIAnimeQueryResult, APIAnimeQueryResult>($request);
  }

  @override
  Future<Response<APISeasonResult>> getCurrentSeasonList(int id) {
    final $url = 'https://api.jikan.moe/v3/top/anime/${id}/airing';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<APISeasonResult, APISeasonResult>($request);
  }

  @override
  Future<Response<APISeasonResult>> getUpComingList(int id) {
    final $url = 'https://api.jikan.moe/v3/top/anime/${id}/upcoming';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<APISeasonResult, APISeasonResult>($request);
  }

  @override
  Future<Response<APICharactersResult>> getCharacterList(int id) {
    final $url = 'https://api.jikan.moe/v3/anime/${id}/characters_staff';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<APICharactersResult, APICharactersResult>($request);
  }

  @override
  Future<Response<Anime>> getAnimeById(int id) {
    final $url = 'https://api.jikan.moe/v3/anime/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Anime, Anime>($request);
  }

  @override
  Future<Response<APIVideoResult>> getPromoVideo(int id) {
    final $url = 'https://api.jikan.moe/v3/anime/${id}/videos';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<APIVideoResult, APIVideoResult>($request);
  }

  @override
  Future<Response<APIAnimeQueryResult>> getAnimeListByGenres(
      int index, List<int> genres) {
    final $url =
        'https://api.jikan.moe/v3/search/anime?q=&page=${index}&genre=${genres}&order_by=start_date';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<APIAnimeQueryResult, APIAnimeQueryResult>($request);
  }
}
