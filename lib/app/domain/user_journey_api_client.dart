import 'package:dio/dio.dart';

import '../../../../core/domain/endpoints.dart';
import '../../core/data/remote/asklora_api_client.dart';

class UserJourneyApiClient {
  Future<Response> get() async {
    var response =
        await AskloraApiClient().get(endpoint: endpointGetUserJourney);
    return response;
  }

  Future<Response> save() async {
    var response = await AskloraApiClient()
        .post(endpoint: endpointSaveUserJourney, payload: '');
    return response;
  }
}
