---
name: cr-python
description: Performs a code review against staged Python code.
allowed-tools: bash git
---

# Setup

Run `git diff --cached` to view the staged changes. Provide a code review on the Python code.

# Review Checklist

* [ ] Check for bugs and/or logic errors
* [ ] Identify gaps in testing
* [ ] Check for missing/weak error handling
* [ ] Identify potential security issues
