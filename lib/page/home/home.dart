import 'dart:convert';

import 'package:answer_now_app/importer.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  late final WebSocketChannel ws;
  final String? errorMessage = null;

  @override
  void initState() {
    super.initState();
    _listen();
  }

  Future<void> _listen() async {
    final token = await ref.read(secure_token_provider).getToken();
    const url = '${const String.fromEnvironment('ws_url')}/chat';
    final notifier = ref.read(chatsProvider.notifier);
    ws = WebSocketChannel.connect(Uri.parse(url));
    // 最初にトークンを送る
    ws.sink.add(json.encode({
      'type': 'auth',
      'token': token,
    }));

    ws.stream.listen(
      (message) {
        if (kDebugMode) {
          print('message: $message');
        }
        final parsedJson = json.decode(message);
        final chatIndexResponseItem =
            ChatIndexResponseItem.fromJson(parsedJson);
        notifier.update([chatIndexResponseItem]);
      },
      onDone: () {
        if (kDebugMode) {
          ref.read(errorMessageHandle).call('リアルタイム接続が切れました', context);
          print('done');
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    ws.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Colors.white,
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: _SearchArea(),
        ),
        Expanded(
          child: _ChatArea(),
        ),
      ],
    );
  }
}

class _SearchArea extends ConsumerWidget {
  const _SearchArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debounce = ref.read(debounceProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          debounce.run(() {
            ref.read(keywordProvider.notifier).update(value);
            ref.invalidate(chatsProvider);
            ref.read(chatsProvider.notifier).getChats();
          }, 500);
        },
        decoration: InputDecoration(
          hintText: '企業名',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

class _ChatArea extends HookConsumerWidget {
  const _ChatArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatNotifier = ref.read(chatsProvider.notifier);
    final asyncValue = useFuture(
      useMemoized(() => chatNotifier.getChats()),
    );

    final controller = ref.watch(homeScrollProvider);
    useEffect(() {
      controller.addListener(() async {
        if (controller.position.pixels >=
            controller.position.maxScrollExtent * 0.95) {
          if (!chatNotifier.loading) {
            await chatNotifier.addGetChats();
          }
        }
      });
      return null;
    }, [controller]);

    if (asyncValue.connectionState == ConnectionState.waiting) {
      return const _NowLoading();
    } else if (asyncValue.hasError) {
      debugPrint(asyncValue.error.toString());
      ref.read(errorMessageHandle).call(asyncValue.error.toString(), context);
      return const SizedBox();
    } else if (asyncValue.hasData && asyncValue.data!.data!.data!.isNotEmpty) {
      final chats = ref.watch(chatsProvider);

      return ListView.builder(
        controller: controller,
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListChat(
            title: chats[index]!.corporationName,
            message: chats[index]!.latestMessage,
            date: dataTimeFormatJp(chats[index]!.latestSendAt),
            corporationUuid: chats[index]!.corporationUuid,
            chatUuid: chats[index]!.uuid,
            isRead: chats[index]!.isRead ?? true,
          );
        },
      );
    } else {
      return const _NonDeta();
    }
  }
}

class ListChat extends StatelessWidget {
  const ListChat({
    super.key,
    required this.title,
    required this.message,
    required this.date,
    required this.corporationUuid,
    required this.chatUuid,
    required this.isRead,
  });

  final String title;
  final String message;
  final String date;
  final String corporationUuid;
  final String chatUuid;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(title),
          HorizontalMargin(width: 3.0.w),
          if (!isRead)
            const Icon(
              Icons.circle,
              color: Colors.green,
              size: 10.0,
            ),
        ],
      ),
      subtitle: Text(
        message,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: Text(date),
      onTap: () {
        ChatDetail(
          corporationUuid,
          chatUuid,
        ).go(context);
      },
    );
  }
}

class _NonDeta extends StatelessWidget {
  const _NonDeta();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('データがありません'),
    );
  }
}

class _NowLoading extends StatelessWidget {
  const _NowLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
