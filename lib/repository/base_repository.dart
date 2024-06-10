import 'package:answer_now_app/importer.dart';

class BaseRepository {
  BaseRepository();
  final RunApi runApi = RunApi();
  final ref = ProviderContainer();

  RestClient getClient([String? token]) {
    return RestClient(
      Dio(
        getBaseOptions(token),
      ),
      baseUrl: const String.fromEnvironment('api_url'),
    );
  }

  BaseOptions getBaseOptions(String? token) {
    if (token != null) {
      return BaseOptions(
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
    }

    return BaseOptions();
  }
}
