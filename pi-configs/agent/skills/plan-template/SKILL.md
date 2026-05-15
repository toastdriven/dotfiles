---
name: plan-template
description: Interactively generates a Markdown plan file from a template. Prompts for an output path, optional custom template, a task description, and a list of TODO tasks. Use when creating a structured plan document.
allowed-tools: bash read write edit
---

# plan-template

Generate a Markdown plan file by walking the user through a short series of prompts.

## Step 1 — Output path

Check whether an output path was supplied as an argument to this skill invocation.

- **If no output path was provided:** stop and ask the user:
  > "Where should the plan be saved? (provide a file path)"
  Wait for their answer before continuing. Do not proceed without a valid path.

## Step 2 — Template

Ask the user:
> "Would you like to use a custom template? [y/N] "

- If the user provides a negative (`n`, `N`, `no`, `No`) answer or nothing (empty input), use the bundled template at `templates/basic.md` relative to this skill's directory (`/Users/daniel/.pi/agent/skills/plan-template/templates/basic.md`).
- If the user provides a positive answer, ask the user:
> "Please provide a path to your own Markdown template: "

- If the user provides a path, read that file instead.

Read the chosen template file now.

## Step 3 — Task description

Ask the user:
> "What is the task description? (press Enter to use 'TBD')"

- If the user provides nothing, use `TBD`.
- Replace every occurrence of `{{TASK_DESCRIPTION}}` in the template with the user's answer (or `TBD`).

## Step 4 — Collect tasks (loop)

Tell the user:
> "Enter tasks one at a time to add to the TODO checklist. Type `STOP` when you are done."

Repeat the following until the user enters either an empty line or just the word `STOP`:
- Ask: `"Task (or 'STOP' to finish):"`
- If non-empty or `STOP`, append `- [ ] <task>` to an internal task list.

Once the loop ends, replace `{{TASKS}}` in the template with the collected task lines joined by newlines.
- If no tasks were entered, replace `{{TASKS}}` with `- [ ] ` (a single empty checkbox as a placeholder).

## Step 5 — Context description

Only perform this step if the template contains a `Context` section! Otherwise, skip to "Step 6".

Ask the user:
> "Should any additional context be provided? [y/N] "

- If the user provides a negative (`n`, `N`, `no`, `No`) answer or nothing (empty input), delete the `## Context` section from the template, and move on to "Step 6".
- If the user provides a positive answer, ask the user:
> "Please provide the context: "
- If the user provides a description, replace every occurrence of `{{CONTEXT_DESCRIPTION}}` in the template with the user's answer.

## Step 6 — How to run tests

Only perform this step if the template contains a `Running Tests` or `Testing` section! Otherwise, skip to "Step 7".

Ask the user:
> "Are there tests? If so, how are they run? (or `None` to skip)"

- If the user provides nothing or `None`, delete the `## Running Tests` section from the template, and move on to "Step 7".
- If the user provides an answer, replace every occurrence of `{{TESTING_DESCRIPTION}}` in the template with a Markdown code block containing the user's answer. The code block should be assumed to be `bash` commands, so apply the optional bash highlighting (e.g. "```bash"), and the answer should have '$ ' prefixed in front of it.

## Step 7 — Write the file

Write the fully-populated template to the output path provided in Step 1.

Confirm success:
> "Plan written to <output path>."
