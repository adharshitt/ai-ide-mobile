# Project: Mobile AI IDE (Cursor for Phone)

## Architecture Overview
A multi-agent, mobile-first IDE with a hybrid execution model.

### 1. Mobile App (Android/Flutter)
- **UI:** Editor, Terminal, Multi-Agent Chat.
- **Identity Vault:** Secure storage for multiple Google/Gemini sessions.
- **Local Sandbox:** Process execution using Android's native shell.

### 2. Cloudflare Orchestrator (Worker)
- **Role:** Middleware for Gemini API, Auth handling, and State syncing.
- **Tech:** Hono/Node.js on Cloudflare Workers.

### 3. Database (MongoDB Atlas)
- **Role:** Persistent storage for Agent Blackboards, User Personas, and Session History.

## Development Phases
- [ ] **Phase 1:** Scaffold Flutter App & Identity Models.
- [ ] **Phase 2:** Implement "Login with Google" via In-App WebView.
- [ ] **Phase 3:** Set up Cloudflare Worker Orchestrator.
- [ ] **Phase 4:** Build Local Sandbox (File/Shell tools).
- [ ] **Phase 5:** Multi-Agent Blackboard implementation (MongoDB).
