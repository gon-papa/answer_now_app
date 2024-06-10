// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/auth_response.dart';
import '../models/body_sign_in.dart';
import '../models/json_response.dart';
import '../models/sign_up_request.dart';
import '../models/token_response.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  /// サインアップ.
  ///
  /// サインアップ.
  @POST('/sign-up')
  Future<AuthResponse> signUp({
    @Body() required SignUpRequest body,
  });

  /// サインイン.
  ///
  /// サインイン.
  @FormUrlEncoded()
  @POST('/sign-in')
  Future<TokenResponse> signIn({
    @Body() required BodySignIn body,
  });

  /// トークンリフレッシュ.
  ///
  /// トークンリフレッシュ.
  @POST('/refresh-token')
  Future<TokenResponse> refreshToken({
    @Body() required TokenResponse body,
  });

  /// サインアウト.
  ///
  /// サインアウト.
  @POST('/sign-out')
  Future<JsonResponse> signOut();
}
