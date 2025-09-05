# Determines if you're currently in a work (sub)directory.
#
# Compares the current path against the `$WORK_PATH` environment variable!
#
# Returns `0` if you **ARE** within a work directory.
# Returns `1` if you are **NOT** within a work directory.

function is_work_path
  argparse h/help v/verbose -- $argv
  or return

  if set -ql _flag_help
    echo "is_work_path [-h|--help] [-v|--verbose]"
    return -1
  end

  if test "$WORK_PATH" = ""
    if set -ql _flag_verbose
      echo "No WORK_PATH environment variable set."
    end

    return 1
  end

  set --local current_path $(pwd)
  set --local work_path "$WORK_PATH"
  set --local real_current_path $(path resolve $current_path)
  set --local real_work_path $(path resolve $work_path)
  set --local paths_match $(string match --entire -- "$real_work_path" "$real_current_path")
  # echo "pm: '$paths_match'"

  if test -n "$paths_match"
    if set -ql _flag_verbose
      echo "You're in a work (sub)directory!"
    end

    return 0
  end

  if set -ql _flag_verbose
    echo "You're elsewhere, in parts unknown!"
  end

  return 1
end
