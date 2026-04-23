import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'ui/screens/agent_chat_screen.dart';
import 'ui/screens/identity_vault_screen.dart';

void main() {
  runApp(const AiIdeApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AgentChatScreen(),
    ),
    GoRoute(
      path: '/vault',
      builder: (context, state) => const IdentityVaultScreen(),
    ),
  ],
);

class AiIdeApp extends StatelessWidget {
  const AiIdeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Barbie AI IDE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
