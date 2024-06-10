import 'package:answer_now_app/importer.dart';

class ErrorListenerWidget extends ConsumerWidget {
  const ErrorListenerWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(errorMessageProvider);
    final navigatorKey = ref.read(globalKeyProvider);

    if (message != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: navigatorKey.currentState?.context ?? context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            return SingleChildScrollView(
              child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: _buildDialogContent(dialogContext, ref, message),
              ),
            );
          },
        );
      });
    }

    return child;
  }

  Widget _buildDialogContent(
      BuildContext context, WidgetRef ref, String message) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 24),
              const SizedBox(
                width: 8,
              ),
              Text(
                'エラーが発生しました',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            message,
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 24.h),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: Text('OK', style: TextStyle(fontSize: 16.sp)),
              onPressed: () {
                if (ref.read(_expiredAuthentication.notifier).state) {
                  ref.read(errorMessageProvider.notifier).state = null;
                  ref.read(_expiredAuthentication.notifier).state = false;
                  // SignInRoute().go(context);
                } else {
                  ref.read(errorMessageProvider.notifier).state = null;
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

final errorMessageProvider = StateProvider<String?>((ref) => null);
final _expiredAuthentication = StateProvider<bool>((ref) => false);
final errorMessageHandle = Provider((ref) => (
      String? message,
      BuildContext? context,
    ) {
      if (context != null && message == DEFAULT_ERROR) {
        message = "エラーが発生しました。もう一度お試しください。";
      } else if (context != null && message == EXPIRED_AUTHENTICATION) {
        message = "セッションが切れました。再度ログインしてください。";
        ref.read(_expiredAuthentication.notifier).state = true;
      }
      ref.read(errorMessageProvider.notifier).state = message;
    });

// ignore: constant_identifier_names
const DEFAULT_ERROR = 'defaulrError';
// ignore: constant_identifier_names
const EXPIRED_AUTHENTICATION = 'expiredAuthentication';
