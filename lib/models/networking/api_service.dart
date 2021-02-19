import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static const BASE_URL = "http://newsapi.org/v2/";
  // API_KEYは下記のような記述を行う。
  // static final API_KEY = DotEnv.env["NEWS_API_KEY"];

  static create() {
    final client = ChopperClient(
      baseUrl: BASE_URL,
      services: [
        _$ApiService()
      ],
      converter: JsonConverter(),
      errorConverter: JsonConverter(),
    );
    return client.getService<ApiService>();
  }

  @Get(path: "/top-headlines")
  Future<Response> getHeadLines(
      {@Query("country") String country = "jp",
      @Query("pageSize") int pageSize = 10,
      @Query("apiKey") String apiKey});

  @Get(path: "/top-headlines")
  Future<Response> getKeywordNews(
      {@Query("country") String country = "jp",
      @Query("pageSize") int pageSize = 30,
      @Query("q") String keyword,
      @Query("apiKey") String apiKey});

  @Get(path: "/top-headlines")
  Future<Response> getCategoryNews(
      {@Query("country") String country = "jp",
      @Query("pageSize") int pageSize = 30,
      @Query("category") String category,
      @Query("apiKey") String apiKey});
}
