import 'package:cerina/features/auth/data/auth_service.dart';
import 'package:flutter/material.dart';
import 'data/api_service.dart';
import 'data/chat_view_model.dart';
import 'widgets/chat_input_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  late final ChatViewModel _chatViewModel;

  @override
  void initState() {
    super.initState();
    final authService = AuthService();
    final apiService = ApiService(authService);
    _chatViewModel = ChatViewModel(apiService);
    _chatViewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final pinkHeight = screenSize.height * 0.12;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        centerTitle: true,
        title: const Text(
          "Cerina AI",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: pinkHeight,
                color: Colors.pink[400],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: screenSize.width * 0.05,
                      backgroundColor: Colors.white,
                      child: Text(
                        "C",
                        style: TextStyle(
                          color: Colors.pink[400],
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    const Text(
                      "Cerince",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.005),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                  child: const Text(
                    "Tanyakan apa saja mengenai menstruasi dan cervix. Cerince siap membantu!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: pinkHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.all(screenSize.width * 0.04),
                child: Column(
                  children: [
                    Expanded(
                      child: ChatMessageList(
                        messages: _chatViewModel.chatMessages,
                        isLoading: _chatViewModel.isLoading,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    ChatInput(
                      controller: _controller,
                      onSend: _handleSendMessage,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSendMessage() async {
    final userMessage = _controller.text;
    if (userMessage.isEmpty) return;

    _controller.clear();
    await _chatViewModel.sendMessage(userMessage);
  }
}

class ChatMessageList extends StatelessWidget {
  final List<Map<String, String>> messages;
  final bool isLoading;

  const ChatMessageList({
    super.key,
    required this.messages,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          messages.length + (isLoading ? 1 : 0), // Add extra item for loading
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SizedBox.shrink(); // Skip initial system message
        }
        if (isLoading && index == messages.length) {
          return const LoadingBubble(); // Show loading bubble
        }
        final message = messages[index];
        return ChatMessageBubble(message: message);
      },
    );
  }
}

class ChatMessageBubble extends StatelessWidget {
  final Map<String, String> message;

  const ChatMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isSystem = message["role"] == 'system';

    return Align(
      alignment: isSystem ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSystem
              ? const Color.fromRGBO(235, 236, 239, 1)
              : const Color.fromRGBO(253, 231, 241, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message["content"] ?? '',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class LoadingBubble extends StatefulWidget {
  const LoadingBubble({super.key});

  @override
  State<LoadingBubble> createState() => _LoadingBubbleState();
}

class _LoadingBubbleState extends State<LoadingBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(235, 236, 239, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            int dots = (_controller.value * 4).floor() % 4;
            return Text(
              "Thinking${"." * (dots + 1)}",
              style: const TextStyle(color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}