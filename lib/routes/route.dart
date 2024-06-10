import 'package:answer_now_app/importer.dart';
import 'package:answer_now_app/page/home/home_provider.dart';

part 'route.g.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: const RootRoute().location,
      routes: [...$appRoutes],
      navigatorKey: ref.read(globalKeyProvider),
      redirect: (BuildContext context, GoRouterState state) async {
        if (state.uri.path == const RootRoute().location) {
          final isSignIn = await ref.read(secure_token_provider).getToken();
          if (isSignIn != null) {
            await ref.read(userProvider.notifier).getMe();
            await ref.read(chatsProvider.notifier).getChats();
            return const Home().location;
          }
          return const SignIn().location;
        }
        return null;
      },
    );
  },
);

final globalKeyProvider = Provider((_) => GlobalKey<NavigatorState>());

@TypedShellRoute<RootShellRoute>(
  routes: [
    TypedGoRoute<RootRoute>(path: '/'),
    TypedGoRoute<SignIn>(path: '/sign-in'),
    TypedGoRoute<Home>(
      path: '/home',
      routes: [
        // TypedGoRoute<ChatDetail>(path: '/chat-detail'),
      ],
    ),
  ],
)
class RootShellRoute extends ShellRouteData {
  const RootShellRoute();

  static final $navigatorKey = rootNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return navigator;
  }
}

// ダミーのルート
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SizedBox();
}

class SignIn extends GoRouteData {
  const SignIn();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignInPage();
}

class Home extends GoRouteData {
  const Home();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

// class ChatDetail extends GoRouteData {
//   const ChatDetail();

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const ChatDetailPage();
// }

CustomTransitionPage<void> noAnimationPage(Widget page) {
  return CustomTransitionPage<void>(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).chain(
              CurveTween(curve: Curves.easeIn),
            ),
          ),
          child: child,
        ),
      );
    },
  );
}

CustomTransitionPage<void> bottomSlideUpPageAnimation(Widget page) {
  return CustomTransitionPage<void>(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(0, 1), // 下からスライドする設定
              end: Offset.zero,
            ).chain(
              CurveTween(curve: Curves.easeInOut),
            ),
          ),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
