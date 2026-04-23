import 'package:flutter/material.dart';

class AgentChatScreen extends StatelessWidget {
  const AgentChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        title: const _AgentSelector(),
        backgroundColor: const Color(0xFF141414),
        actions: [
          IconButton(icon: const Icon(Icons.code), onPressed: () {}),
          IconButton(icon: const Icon(Icons.terminal), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          const Expanded(child: _ChatMessageList()),
          _ChatInputArea(),
        ],
      ),
    );
  }
}

class _AgentSelector extends StatelessWidget {
  const _AgentSelector();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 10, backgroundColor: Colors.greenAccent),
          SizedBox(width: 8),
          Text('Architect Agent', style: TextStyle(fontSize: 14)),
          Icon(Icons.arrow_drop_down, size: 18),
        ],
      ),
    );
  }
}

class _ChatMessageList extends StatelessWidget {
  const _ChatMessageList();
  @override
  Widget build(BuildContext context) {
    // Mocking messages from multiple agents
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _MessageBubble(
          sender: 'Architect',
          message: 'I have analyzed the project structure. We should start by fixing the LocalSandbox implementation.',
          isAgent: true,
        ),
        _MessageBubble(
          sender: 'Security',
          message: 'Agreed. I am checking the command execution paths for potential injection vulnerabilities.',
          isAgent: true,
          color: Colors.redAccent,
        ),
        _MessageBubble(
          sender: 'User',
          message: 'Go ahead and fix it.',
          isAgent: false,
        ),
      ],
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String sender;
  final String message;
  final bool isAgent;
  final Color color;

  const _MessageBubble({
    required this.sender,
    required this.message,
    required this.isAgent,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isAgent ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isAgent ? const Color(0xFF1E1E1E) : color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: isAgent ? Border.all(color: color.withOpacity(0.5)) : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sender, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10)),
            const SizedBox(height: 4),
            Text(message, style: const TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class _ChatInputArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFF141414),
        border: Border(top: BorderSide(color: Color(0xFF252525))),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ask your agents...',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF252525),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.send, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
