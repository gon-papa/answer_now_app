// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootShellRoute,
    ];

RouteBase get $rootShellRoute => ShellRouteData.$route(
      navigatorKey: RootShellRoute.$navigatorKey,
      factory: $RootShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $RootRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/sign-in',
          factory: $SignInExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/home',
          factory: $HomeExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'chat-detail/:corporationUuid/:chatUuid',
              factory: $ChatDetailExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $RootShellRouteExtension on RootShellRoute {
  static RootShellRoute _fromState(GoRouterState state) =>
      const RootShellRoute();
}

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => const RootRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SignInExtension on SignIn {
  static SignIn _fromState(GoRouterState state) => const SignIn();

  String get location => GoRouteData.$location(
        '/sign-in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeExtension on Home {
  static Home _fromState(GoRouterState state) => const Home();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChatDetailExtension on ChatDetail {
  static ChatDetail _fromState(GoRouterState state) => ChatDetail(
        state.pathParameters['corporationUuid']!,
        state.pathParameters['chatUuid']!,
      );

  String get location => GoRouteData.$location(
        '/home/chat-detail/${Uri.encodeComponent(corporationUuid)}/${Uri.encodeComponent(chatUuid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
