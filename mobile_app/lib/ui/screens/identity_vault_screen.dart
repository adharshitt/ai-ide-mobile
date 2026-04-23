import 'package:flutter/material.dart';

class IdentityVaultScreen extends StatelessWidget {
  const IdentityVaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F), // Deep premium black
      appBar: AppBar(
        title: const Text('Identity Vault', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage your Gemini sessions. Each identity can be assigned to different agents.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _IdentityCard(
                    email: 'barbie@example.com',
                    alias: 'Personal Root',
                    isActive: true,
                  ),
                  _IdentityCard(
                    email: 'work@company.com',
                    alias: 'Corporate Backend',
                    isActive: false,
                  ),
                ],
              ),
            ),
            _AddIdentityButton(),
          ],
        ),
      ),
    );
  }
}

class _IdentityCard extends StatelessWidget {
  final String email;
  final String alias;
  final bool isActive;

  const _IdentityCard({
    required this.email,
    required this.alias,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: isActive ? Border.all(color: Colors.blueAccent, width: 1.5) : null,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text(email[0].toUpperCase()),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(alias, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(email, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const Spacer(),
          if (isActive) const Icon(Icons.check_circle, color: Colors.blueAccent),
        ],
      ),
    );
  }
}

class _AddIdentityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Open In-App WebView for Google Login
      },
      icon: const Icon(Icons.add),
      label: const Text('Add Google Identity'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
