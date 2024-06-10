import 'package:answer_now_app/importer.dart';
import 'package:answer_now_app/repository/base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthRepository();

  Future<Result<TokenResponse?>> signIn(String email, String password) async {
    final result = runApi.run(
      onSuccess: () async {
        final api = getClient().auth;
        final response = await api.signIn(
          body: BodySignIn(
            username: email,
            password: password,
            grantType: null,
            clientId: null,
            clientSecret: null,
          ),
        );
        return response;
      },
    );

    return result;
  }

  Future<Result<UserResponse?>> getMe() async {
    final result = runApi.run(
      onSuccess: () async {
        final token = await ref.read(secure_token_provider).getToken();
        final api = getClient(token).user;
        final response = await api.getMe();

        return response;
      },
    );
    return result;
  }
}

final authRepositoryProvider = Provider.autoDispose<AuthRepository>(
  (ref) {
    return AuthRepository();
  },
);
