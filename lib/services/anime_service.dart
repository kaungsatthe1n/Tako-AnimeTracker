import 'package:chopper/chopper.dart';
import 'package:tako/models/anime_model.dart';
import 'package:tako/services/json_to_type_converter.dart';
import 'package:tako/services/model_converter.dart';

part 'anime_service.chopper.dart';

@ChopperApi(baseUrl: 'https://api.jikan.moe/v3')
abstract class AnimeService extends ChopperService {
  @Get(path: 'search/anime?')
  Future<Response<APIAnimeQueryResult>> queryAnime(
    @Query('q') String query,
  );
  @Get(path: 'top/anime/{page}/airing')
  Future<Response<APISeasonResult>> getCurrentSeasonList(@Path('page') int id);

  @Get(path: 'top/anime/{page}/upcoming')
  Future<Response<APISeasonResult>> getUpComingList(@Path('page') int id);

  @Get(path: 'anime/{id}/characters_staff')
  Future<Response<APICharactersResult>> getCharacterList(@Path('id') int id);

  @Get(path: 'anime/{id}')
  Future<Response<Anime>> getAnimeById(@Path('id') int id);

  @Get(path: 'anime/{id}/videos')
  Future<Response<APIVideoResult>> getPromoVideo(@Path('id') int id);

  @Get(path: 'search/anime?q=&page={page}&genre={genre}&order_by=start_date')
  Future<Response<APIAnimeQueryResult>> getAnimeListByGenres(
    @Path('page') int index,
    @Path('genre') List<int> genres,
    // @Part('order_by') String orderBy,
    // @Part('sort') String sort,
  );

  static AnimeService create() {
    final client = ChopperClient(
      interceptors: [HttpLoggingInterceptor()],
      converter: JsonToTypeConverter({
        APISeasonResult: (jsonData) => APISeasonResult.fromJson(jsonData),
        APIAnimeQueryResult: (jsonData) => APIAnimeQueryResult.fromJson(jsonData),
        APICharactersResult: (jsonData) =>
            APICharactersResult.fromJson(jsonData),
        Anime: (jsonData) => Anime.fromJson(jsonData),
        APIVideoResult: (jsonData) => APIVideoResult.fromJson(jsonData),
      }),
      errorConverter: const JsonConverter(),
      services: [
        _$AnimeService(),
      ],
    );
    return _$AnimeService(client);
  }
}
