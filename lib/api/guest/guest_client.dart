// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'guest_client.g.dart';

@RestApi()
abstract class GuestClient {
  factory GuestClient(Dio dio, {String? baseUrl}) = _GuestClient;

  /// チャットフレーム取得.
  ///
  /// チャットフレーム取得.
  @GET('/frame-chat/{uuid}')
  Future<String> getFrameChat({
    @Path('uuid') required String uuid,
  });
}
