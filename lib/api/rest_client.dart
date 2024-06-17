// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';

import 'user/user_client.dart';
import 'auth/auth_client.dart';
import 'chat/chat_client.dart';
import 'guest/guest_client.dart';

/// app_name `v0.1.0`.
///
/// API for app_name.
class RestClient {
  RestClient(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  UserClient? _user;
  AuthClient? _auth;
  ChatClient? _chat;
  GuestClient? _guest;

  UserClient get user => _user ??= UserClient(_dio, baseUrl: _baseUrl);

  AuthClient get auth => _auth ??= AuthClient(_dio, baseUrl: _baseUrl);

  ChatClient get chat => _chat ??= ChatClient(_dio, baseUrl: _baseUrl);

  GuestClient get guest => _guest ??= GuestClient(_dio, baseUrl: _baseUrl);
}
