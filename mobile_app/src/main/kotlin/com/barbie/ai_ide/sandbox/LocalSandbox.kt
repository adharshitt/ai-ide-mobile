package com.barbie.ai_ide.sandbox

import java.io.File
import java.io.InputStream
import java.io.OutputStream

/**
 * LocalSandbox
 * Handles local file operations and shell command execution on Android.
 */
class LocalSandbox(val workspaceRoot: File) {

    init {
        if (!workspaceRoot.exists()) {
            workspaceRoot.mkdirs()
        }
    }

    /**
     * Executes a shell command in the workspace directory.
     */
    fun executeCommand(command: String): CommandResult {
        return try {
            val process = Runtime.getRuntime().exec(command, null, workspaceRoot)
            val output = process.inputStream.bufferedReader().readText()
            val error = process.errorStream.bufferedReader().readText()
            val exitCode = process.waitFor()
            CommandResult(exitCode, output, error)
        } catch (e: Exception) {
            CommandResult(-1, "", e.message ?: "Unknown error")
        }
    }

    /**
     * Reads a file from the workspace.
     */
    fun readFile(relativePath: String): String? {
        val file = File(workspaceRoot, relativePath)
        return if (file.exists()) file.readText() else null
    }

    /**
     * Writes a file to the workspace.
     */
    fun writeFile(relativePath: String, content: String) {
        val file = File(workspaceRoot, relativePath)
        file.parentFile?.mkdirs()
        file.writeText(content)
    }

    data class CommandResult(val exitCode: Int, val output: String, val error: String)
}
