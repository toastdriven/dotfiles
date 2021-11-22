import os

import sublime
import sublime_plugin


class BlackCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        if self.view.file_name().endswith(".py"):
            file_path = self.view.file_name()
            folder_name, file_name = os.path.split(file_path)
            self.view.window().run_command(
                "exec",
                {
                    "cmd": ["/Users/daniel/.pyenv/shims/black", file_path],
                    "working_dir": folder_name,
                },
            )
            sublime.status_message("black " + file_name)

    def is_enabled(self):
        return self.view.file_name().endswith(".py")
