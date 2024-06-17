import 'package:answer_now_app/importer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
  });

  final String title;
  final String message;
  final String date;
  final String corporationUuid;
  final String chatUuid;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
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
