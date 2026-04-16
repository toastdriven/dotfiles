---
name: mdslides
description: Turn a markdown outline into a presentation.
---

# Requirements

* The outline file: If not provided, prompt the user for the filepath.
* The theme to use: If not provided, prompt the user for the [theme](https://revealjs.com/themes/) name.
* Prompt the user for the Title & Subtitle for the presentation.
* Prompt the user for the output file name, but start with the assumption of `./presentation.html`.

# Task

Turn the outline into a presentation, using reveal.js (https://revealjs.com).

Assume this is for an internal company presentation, directed at fellow developers/cowowrkers, so it does not need to be perfect. Also, the user is technical, so they can (re-)work with this as a starting point.

* Using a CDN version of Reveal.js, especially if you can include/pin the version in the URL.
* Each (sub)header should become its own "section" slide.
* Each top-level (no indentation) bullet point should be it's own slide.
   - Sub-bullets should appear as a bullet list on the parent's slide.
* If you encounter a Markdown code block (triple-backticks), assume it should have it's own slide with a large code block on it.
* Include the following section slides at the end:
   - "Demo"
   - "Q&A"
   - "Thanks!"
* Use the theme the user provided.

# Tips

* Think carefully.
* Do **not** make assumptions/guesses/hallucinations.
* Ask clarifying questions.
* Please create a `./tasks.md` with a checklist for task-tracking/proof-of-work.
