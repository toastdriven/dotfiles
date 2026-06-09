---
name: eligruber
description: Explain Like Gruber (ELI-Gruber). Accepts a URL or a block of text and produces a sarcastic, deadpan "translation" in the style of John Gruber's classic PR-speak dissections — quoting the original passage-by-passage and following each with a brutally honest restatement of what it actually means.
allowed-tools: bash read
---

# ELI-Gruber — Explain Like Gruber

John Gruber was known for a specific rhetorical form: take a piece of corporate
PR-speak (or any overblown, mealy-mouthed, or self-serving prose) and translate
it, passage by passage, into plain English — the blunt, unvarnished version of
what the author actually meant. The effect is devastating precisely because the
translation requires no exaggeration; reality is damning enough.

Reference example (study this closely before writing your own output):
https://daringfireball.net/2007/02/macrovision_translation

Key traits of the style:
- **Structure:** Alternate between quoted source passages and their translations.
  Each block of original text is followed immediately by a one-or-two-sentence
  translation. The rhythm is tight: long windy original → short brutal response.
- **Tone:** Dry, withering, zero patience for weasel words or self-flattery.
  Not ranting — *cold*. Sarcasm through understatement, not hyperbole.
- **Technique:** Strip out the rhetorical padding and state the naked self-interest,
  the logical fallacy, or the absurdity underneath. Sometimes a single short
  declarative sentence is the entire rebuttal. Occasionally surreal
  ("I am high as a kite.") when something is spectacularly incoherent.
- **No mercy, no hedging.** Do not soften translations or add qualifiers.
  Do not explain the joke. Trust the reader.

---

## Input

You need **one** of the following. If neither was supplied by the user, ask for it now:

1. **A URL** — a web page, article, press release, blog post, or any publicly
   accessible resource.
2. **A block of text** — pasted directly into the chat.

---

## Step 1 — Acquire the content

**If a URL was provided**, fetch its readable text using the helper script:

```bash
python3 <skill-dir>/scripts/fetch-url.py "<url>"
```

Replace `<skill-dir>` with the absolute path to this skill's directory
(i.e., the directory containing this SKILL.md file).

If the fetch fails, report the error clearly and stop.

**If raw text was provided**, use that text directly — no fetching needed.

---

## Step 2 — Select passages

Identify the most bloated, self-serving, misleading, or absurd passages in the
source — the ones that reward translation. You do not need to cover every sentence;
choose the passages where the gap between what is said and what is meant is widest.
Aim for 5–10 passage/translation pairs (more if the source is long or especially rich).

---

## Step 3 — Write the translation

Produce the output as a sequence of alternating blocks:

1. The original passage, in a blockquote (`> `).
2. The translation, as plain text immediately below it — no label, no preamble.

Between each pair, add a single blank line separator.

Open with a one-line title of your own invention (not the source's title) that
itself captures the sarcastic frame. Do not add any closing commentary.

---

## Output format

```
# <Your invented title>

> <Original passage one>

<Translation one.>

> <Original passage two>

<Translation two.>

...
```

Nothing else. No introduction. No conclusion. No meta-commentary about what you
just did. The title and the pairs speak for themselves.
