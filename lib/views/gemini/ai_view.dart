import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class AiView extends StatefulWidget {
  const AiView({super.key});

  @override
  State<AiView> createState() => _AiViewState();
}

class _AiViewState extends State<AiView> {
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://static.vecteezy.com/system/resources/thumbnails/046/861/646/small_2x/gemini-icon-on-a-transparent-background-free-png.png",
  );

  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Gemini AI")), body: _buildUI());
  }

  Widget _buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    try {
      String question = chatMessage.text;
      StringBuffer responseBuffer = StringBuffer();

      // Keep track of the Gemini message index for this user message
      int? geminiMsgIndex;

      gemini.promptStream(parts: [Part.text(question)]).listen((event) {
        String responsePart =
            event?.content?.parts?.fold(
              "",
              (previous, current) =>
                  "$previous${(current is TextPart) ? current.text : current.toString()}",
            ) ??
            '';

        responseBuffer.write(responsePart);

        setState(() {
          if (geminiMsgIndex == null) {
            // Add Gemini message for the first time
            final geminiMsg = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: responseBuffer.toString().trim(),
            );
            messages = [geminiMsg, ...messages];
            geminiMsgIndex = 0;
          } else {
            // Update the Gemini message at the stored index
            final updatedMsg = ChatMessage(
              user: geminiUser,
              createdAt: messages[geminiMsgIndex!].createdAt,
              text: responseBuffer.toString().trim(),
            );
            messages[geminiMsgIndex!] = updatedMsg;
            messages = List.from(messages);
          }
        });
      });
    } catch (e) {
      debugPrint("Gemini Exception: $e");
    }
  }
}
