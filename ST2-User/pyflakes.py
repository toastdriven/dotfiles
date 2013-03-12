import os
import sublime, sublime_plugin

class PyflakesCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        if self.view.file_name().endswith('.py'):
            file_path = self.view.file_name()
            folder_name, file_name = os.path.split(file_path)
            self.view.window().run_command('exec', {'cmd': ['/usr/local/share/python/pyflakes', file_path], 'working_dir': folder_name})
            sublime.status_message("pyflakes " + file_name)

    def is_enabled(self):
        return self.view.file_name().endswith('.py')
