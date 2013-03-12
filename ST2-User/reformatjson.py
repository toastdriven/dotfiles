import os
import subprocess
import tempfile
import sublime, sublime_plugin

class ReformatJsonCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        the_data = sublime.Region(0, self.view.size())
        contents = self.view.substr(the_data)

        tmp_low, tmp_name = tempfile.mkstemp()
        tmp = open(tmp_name, 'w')
        tmp.write(contents)
        tmp.close()

        proc = subprocess.Popen(['python', '-m', 'json.tool', tmp_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = proc.communicate()

        if proc.returncode != 0:
            sublime.status_message("Failed to reformat JSON.")
            panel = self.view.window().get_output_panel("json")
            self.view.window().run_command('show_panel', {'panel': 'output.json'})
            panel.set_read_only(False)
            edit = panel.begin_edit()
            panel.insert(edit, 0, stderr)
            panel.end_edit(edit)
            return

        self.view.erase(edit, the_data)
        self.view.insert(edit, 0, stdout)
        sublime.status_message("JSON reformatted.")
