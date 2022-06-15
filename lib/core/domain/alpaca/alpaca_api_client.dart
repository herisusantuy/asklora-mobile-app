import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'alpaca_api_client.g.dart';

@RestApi()
abstract class AlpacaApiClient {
  factory AlpacaApiClient(Dio dio, {String baseUrl}) = _AlpacaApiClient;
}
