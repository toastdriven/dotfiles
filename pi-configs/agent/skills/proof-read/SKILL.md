---
name: proof-read
description: Performs an English-based proof-reading of some prose.
allowed-tools: bash read write edit
---

## Requirements

* The file or pasted block of prose to be proofed. If not provided, prompt the user for the file to be read.
* How corrections should be provided. Prompt the user with the following options:
    * In a copy (default): Make a copy of the file alongside the original, then make edits **only** within the **copy**
    * In-place: Make the edits directly within the provided file
    * In-memory / transient: Make **no** change to the filesystem, & simply provide a table of the changes as output within this session

## Task

* Proof-read the document (assuming English prose).
* **ONLY** proof-read.
* Do **NOT** check for accuracy, or citations.
* Do **NOT** suggest major edits/reworks/reorganizations.

## "In-Memory" / "Transient" Output

If the user chooses the "in-memory" output option when prompted, you should share the recommended changes in a Markdown table. Use the following as a template:

```markdown
| Line Number | Original | Revised | Rationale |
| :---------: | -------- | ------- | --------- |
| <original-line-number> | <original-snippet> | <revised-snippet> | <why-make-the-change> |
```
