from __future__ import print_function
import glob
import os
import subprocess
import sys
from threading import local


IGNORES = [
    "bin",
    ".git",
    ".gitignore",
    "fish-configs",
    "ghostty",
    "goose",
    "zed",
    "ST4",
    "VS-Code",
    "My Twighlight.tmTheme",
]


def shell_out(command_args, verbose=False):
    if verbose:
        print(" ".join(command_args))

    subprocess.call(command_args)


def backup_file(link_name, verbose=False):
    old_dotfiles_path = "/tmp/olddotfiles"

    if os.path.islink(link_name):
        shell_out(["rm", link_name], verbose=verbose)
    elif os.path.lexists(link_name):
        subprocess.call(["mkdir", "-p", old_dotfiles_path])
        shell_out(
            [
                "mv",
                link_name,
                os.path.join(old_dotfiles_path, os.path.basename(link_name)),
            ],
            verbose=verbose,
        )


def link_st(home_directory, verbose=False):
    filename = os.path.normpath(os.path.realpath("ST4/User"))
    link_name = os.path.join(
        home_directory,
        "Library",
        "Application Support",
        "Sublime Text",
        "Packages",
        "User",
    )
    backup_file(link_name, verbose=verbose)
    shell_out(["ln", "-s", filename, link_name], verbose=verbose)


def link_vscode(home_directory, verbose=False):
    filename = os.path.join(
        os.path.normpath(os.path.realpath("VS-Code")), "settings.json"
    )
    link_name = os.path.join(
        home_directory,
        "Library",
        "Application Support",
        "Code",
        "User",
        "settings.json",
    )
    backup_file(link_name, verbose=verbose)
    shell_out(["ln", "-s", filename, link_name], verbose=verbose)

    filename = os.path.join(
        os.path.normpath(os.path.realpath("VS-Code")), "keybindings.json"
    )
    link_name = os.path.join(
        home_directory,
        "Library",
        "Application Support",
        "Code",
        "User",
        "keybindings.json",
    )
    backup_file(link_name, verbose=verbose)
    shell_out(["ln", "-s", filename, link_name], verbose=verbose)

    filename = os.path.join(os.path.normpath(os.path.realpath("VS-Code")), "snippets")
    link_name = os.path.join(
        home_directory, "Library", "Application Support", "Code", "User", "snippets",
    )
    backup_file(link_name, verbose=verbose)
    shell_out(["ln", "-s", filename, link_name], verbose=verbose)


def link_fish(home_directory, verbose=False):
    filename = os.path.normpath(os.path.realpath("fish-configs"))
    link_name = os.path.join(home_directory, ".config", "fish")
    backup_file(link_name, verbose=verbose)

    config_name = os.path.join(home_directory, ".config")

    if not os.path.exists(config_name):
        os.makedirs(config_name)

    shell_out(["ln", "-sFf", filename, link_name], verbose=verbose)
    print("To setup fish:")
    print("    $ echo /usr/local/bin/fish | sudo tee -a /etc/shells")
    print("    $ chsh -s /usr/local/bin/fish")
    print("    $ ./.config/fish/setup_initial_env_vars.sh")


def link_kitty(home_directory, verbose=False):
    filename = os.path.normpath(os.path.realpath("kitty-configs/kitty.conf"))
    link_name = os.path.join(home_directory, ".config", "kitty", "kitty.conf")
    backup_file(link_name, verbose=verbose)

    config_name = os.path.join(home_directory, ".config", "kitty")

    if not os.path.exists(config_name):
        os.makedirs(config_name)

    shell_out(["ln", "-sFf", filename, link_name], verbose=verbose)
    print("To install kitty:")
    print("    $ curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin")


def link_starship(home_directory, verbose=False):
    filename = os.path.normpath(os.path.realpath("starship-configs/starship.toml"))
    link_name = os.path.join(home_directory, ".config", "starship.toml")
    backup_file(link_name, verbose=verbose)

    config_name = os.path.join(home_directory, ".config")

    if not os.path.exists(config_name):
      os.makedirs(config_name)

    shell_out(["ln", "-sFf", filename, link_name], verbose=verbose)


def link_dotconfig(home_directory, local_directory, verbose=False):
    filename = os.path.normpath(os.path.realpath(local_directory))
    base_name = os.path.basename(filename)
    # backup_file(link_name, verbose=verbose)

    config_path = os.path.join(home_directory, ".config")
    config_name = os.path.join(config_path, base_name)

    if not os.path.exists(config_path):
        os.makedirs(config_name)

    shell_out(["ln", "-sFf", filename, config_name], verbose=verbose)


def setup_dotfiles(home_directory, verbose=False):
    dotfile_pattern = os.path.join(".*")
    dotfile_files = glob.glob(dotfile_pattern)
    setup_symlinks(home_directory, dotfile_files, verbose=verbose)

    regular_pattern = os.path.join("*")
    regular_files = glob.glob(regular_pattern)
    setup_symlinks(home_directory, regular_files, verbose=verbose)

    create_gitingore(home_directory, verbose=verbose)
    # link_st(home_directory, verbose=verbose)
    link_vscode(home_directory, verbose=verbose)
    link_fish(home_directory, verbose=verbose)
    # link_kitty(home_directory, verbose=verbose)
    link_starship(home_directory, verbose=verbose)

    link_dotconfig(home_directory, "./ghostty", verbose=verbose)
    link_dotconfig(home_directory, "./goose", verbose=verbose)
    link_dotconfig(home_directory, "./opencode", verbose=verbose)
    link_dotconfig(home_directory, "./zed", verbose=verbose)


def setup_symlinks(home_directory, files, verbose=False):
    for filename in files:
        ignored = False

        for ignore_me in IGNORES:
            if filename == ignore_me:
                ignored = True
                break

        if ignored:
            continue

        full_path = os.path.normpath(os.path.realpath(filename))
        link_name = os.path.join(home_directory, os.path.basename(filename))

        backup_file(link_name, verbose=verbose)
        shell_out(["ln", "-s", full_path, link_name], verbose=verbose)


def create_gitingore(home_directory, verbose=False):
    gitignore_path = os.path.join(home_directory, ".gitignore")
    backup_file(gitignore_path, verbose=verbose)

    gitignore_file = open(gitignore_path, "w")
    gitignore_file.write("*.pyc\n")
    gitignore_file.write(".DS_Store\n")
    gitignore_file.close()


def usage():
    print("Usage: python bin/install.py [-v]")
    print("Please run from the top-level ``dotfiles`` directory.")
    sys.exit(1)


if __name__ == "__main__":
    verbose = False

    if len(sys.argv) > 2:
        usage()

    if not sys.argv[0].startswith("bin/"):
        usage()

    if len(sys.argv) == 2 and sys.argv[1] in ["-v", "--verbose"]:
        verbose = True

    home_directory = os.path.expanduser("~")
    setup_dotfiles(home_directory, verbose=verbose)
