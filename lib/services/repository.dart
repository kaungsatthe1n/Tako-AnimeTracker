import 'package:chopper/chopper.dart';
import 'package:tako/models/anime_model.dart';

abstract class Repository {
  Future<Response<APIAnimeQueryResult>> queryAnime(String query);
  Future<Response<APISeasonResult>> getCurrentSeasonList(int id);
  Future<Response<APISeasonResult>> getUpComingList(int id);
  Future<Response<APICharactersResult>> getCharacterList(int id);
  Future<Response<Anime>> getAnimeById(int id);
  Future<Response<APIVideoResult>> getPromoVideo(int id);
  Future<Response<APIAnimeQueryResult>> getAnimeListByGenres(
      int index, List<int> genres);
}
