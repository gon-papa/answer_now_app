import 'package:answer_now_app/importer.dart';

typedef OnError = Function(
  Exception exception,
  String message,
);

class RunApi {
  final Logger logger = Logger();
  final ref = ProviderContainer();

  // 全てのAPIリクエストを実行する際に共通で行う処理をまとめた関数
  Future<Result<T>> run<T>({
    required Future<T> Function() onSuccess,
    OnError? onError,
    StateController<bool>? isInProgressController,
  }) async {
    try {
      _updateLoadingState(isInProgressController, true);
      final response = await onSuccess();
      return Result(data: response);
    } catch (error) {
      return _handleError(error, onSuccess, onError);
    } finally {
      _updateLoadingState(isInProgressController, false);
    }
  }

  // ローディング状態を更新する
  void _updateLoadingState(StateController<bool>? controller, bool isLoading) {
    if (controller?.mounted == true) {
      controller?.state = isLoading;
    }
  }

  Future<Result<T>> _handleError<T>(
    dynamic error,
    Future<T> Function() onSuccess,
    OnError? onError,
  ) async {
    logger.e(error);

    if (error is DioException) {
      if (error.response?.statusCode == 401) {
        final success = await _attemptTokenRefresh();
        if (success) {
          return await run(onSuccess: onSuccess, onError: onError);
        } else {
          throw ApiException(EXPIRED_AUTHENTICATION);
        }
      } else if (error.response?.data['detail'] != null) {
        String errors = '';
        for (var detail in error.response?.data['detail']) {
          errors += '${detail['msg']}\n';
        }
        throw ApiException(errors);
      }
    }
    onError?.call(error, DEFAULT_ERROR);
    throw ApiException(DEFAULT_ERROR);
  }

  Future<bool> _attemptTokenRefresh() async {
    //   try {
    //     final authRepository = ref.read(authRepositoryProvider);
    //     final refreshToken =
    //         await ref.read(secure_token_provider).getRefreshToken();
    //     if (refreshToken == null) throw ApiException(EXPIRED_AUTHENTICATION);

    //     final response =
    //         await authRepository.refreshToken(refreshToken: refreshToken);

    //     final resToken = response.data?.data?.user?.token;
    //     final resRefreshToken = response.data?.data?.user?.refreshToken;

    //     if (response.isSuccess && resToken != null && resRefreshToken != null) {
    //       await ref
    //           .read(secure_token_provider)
    //           .saveToken(resToken.anyOf.values[0].toString());
    //       await ref.read(secure_token_provider).saveRefreshToken(resRefreshToken);
    //       return true;
    //     }
    //   } catch (e) {
    //     logger.e('Token refresh failed: $e');
    //     return false;
    //   }

    return false;
  }
}

class Result<T> {
  final T? data;
  final String? error;

  Result({this.data, this.error});

  bool get isSuccess => data != null;
  bool get isError => error != null;
}

final runApiProvider = Provider<RunApi>((ref) {
  return RunApi();
});
