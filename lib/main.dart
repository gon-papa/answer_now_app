import 'package:answer_now_app/importer.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  // iOSのアニメーションをAndroidでも使えるようにする
  // ignore: unused_field
  static const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders =
      <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ScreenUtilInit(
      designSize: const Size(320, 568),
      builder: (BuildContext context, Widget? child) => MaterialApp.router(
        themeMode: ThemeMode.system, // 一旦システム設定に従う
        title: 'AnswerNow',
        locale: const Locale('ja', 'JP'),
        routerConfig: router,
        builder: (BuildContext innerContext, Widget? child) {
          return ErrorListenerWidget(child: child!);
        },
      ),
    );
  }
}
