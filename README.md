# Mobile AI IDE (Local Approach)

This repository contains the architecture and initial implementation for a "Cursor-like" experience on Android.

## Project Structure
- `cf_orchestrator/`: Cloudflare Worker that acts as the brain and security layer.
- `mobile_app/`: Android-specific implementation (Kotlin/Java logic) for the local execution sandbox.
- `docs/`: Architectural blueprints and deep-dives.

## How the Local Sandbox Works
The app executes commands directly on the Android device using `Runtime.getRuntime().exec()`. It uses the app's internal storage as the workspace, ensuring total isolation and security.

## Integrating Cloudflare & MongoDB
1.  **Orchestrator:** The Worker at `cf_orchestrator/` intercepts Gemini API calls.
2.  **State Management:** MongoDB Atlas stores your identities, allowing you to log in once and have your "Agents" recognize you across sessions.

## Multi-Agent Interaction
Agents communicate via a "Blackboard" hosted on the Cloudflare/MongoDB layer. This allows a **Backend Agent** and a **Security Agent** to collaborate on the same codebase in real-time.

## Setup
1.  **Cloudflare:** Deploy the worker using `wrangler deploy`.
2.  **MongoDB:** Set up a free Atlas cluster and add the connection string to `wrangler.jsonc`.
3.  **Android:** Build the `mobile_app` using Android Studio or Gradle.
