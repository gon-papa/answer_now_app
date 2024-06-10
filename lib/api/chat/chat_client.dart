// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/chat_index_response.dart';
import '../models/chat_show_response.dart';

part 'chat_client.g.dart';

@RestApi()
abstract class ChatClient {
  factory ChatClient(Dio dio, {String? baseUrl}) = _ChatClient;

  /// チャット一覧取得.
  ///
  /// チャット一覧を取得します。.
  @GET('/chat/index')
  Future<ChatIndexResponse> getChats({
    @Query('limit') int limit = 20,
    @Query('cursor') int? cursor,
    @Query('keyword') String? keyword,
  });

  /// チャット詳細取得.
  ///
  /// チャット詳細を取得します。.
  @GET('/chat/show/{uuid}')
  Future<ChatShowResponse> getChatDetail({
    @Path('uuid') required String uuid,
    @Query('limit') int limit = 20,
    @Query('cursor') int? cursor,
  });
}
