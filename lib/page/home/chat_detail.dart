import 'dart:convert';

import 'package:answer_now_app/importer.dart';
import 'package:answer_now_app/page/home/chat_detail_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat_ui;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatDetailPage extends StatefulHookConsumerWidget {
  const ChatDetailPage({
    super.key,
    required this.corporationUuid,
    required this.chatUuid,
  });

  final String corporationUuid;
  final String chatUuid;

  @override
  ChatDetailPageState createState() => ChatDetailPageState();
}

class ChatDetailPageState extends ConsumerState<ChatDetailPage> {
  late final WebSocketChannel ws;

  @override
  void initState() {
    super.initState();
    final notifier = ref.read(ChatDetailProvider(widget.chatUuid).notifier);
    notifier.getChatDetail();
    final url =
        '${const String.fromEnvironment('ws_url')}/chat/${widget.corporationUuid}/${widget.chatUuid}';
    ws = WebSocketChannel.connect(Uri.parse(url));
    ws.stream.listen((message) {
      final parsedJson = json.decode(message);
      final chatShowResponseItem = ChatShowResponseItem.fromJson(parsedJson);

      setState(() {
        notifier.update([chatShowResponseItem]);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    ws.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(chatDetailProvider(widget.chatUuid));
    final me = ref.watch(userProvider);
    final notifier = ref.read(chatDetailProvider(widget.chatUuid).notifier);
    final meUser = types.User(
      id: me?.uuid ?? '',
      firstName: me?.accountName ?? '',
    );
    return Scaffold(
      appBar: AppBar(),
      body: chat_ui.Chat(
        user: meUser,
        showUserNames: true,
        messages: notifier.messages(meUser),
        onSendPressed: (message) {
          if (kDebugMode) {
            print(message);
          }
        },
        onAttachmentPressed: () {
          print('onAttachmentPressed');
        },
        customDateHeaderText: (date) {
          return DateFormat.yMMMMd('ja').add_Hm().format(date);
        },
      ),
    );
  }
}
