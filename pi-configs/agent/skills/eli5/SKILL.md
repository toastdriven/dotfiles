---
name: eli5
description: Explain Like I'm 5 (ELI5). Accepts a URL or a block of text, reads/fetches the content, summarizes it, then re-explains it in the simplest possible terms — as if talking to a 5-year-old.
allowed-tools: bash read
---

# ELI5 — Explain Like I'm 5

## Input

You need **one** of the following. If neither was supplied by the user, ask for it now:

1. **A URL** — a web page, article, or any publicly accessible resource.
2. **A block of text** — pasted directly into the chat.

## Step 1 — Acquire the content

**If a URL was provided**, fetch its readable text using the helper script:

```bash
python3 <skill-dir>/scripts/fetch-url.py "<url>"
```

Replace `<skill-dir>` with the absolute path to this skill's directory
(i.e. the directory containing this SKILL.md file).

If the fetch fails, report the error clearly and stop.

**If raw text was provided**, use that text directly — no fetching needed.

## Step 2 — Summarise

Write a concise summary of the content (3–5 sentences, plain language, no jargon).
Label this section **"Summary"**.

## Step 3 — ELI5 explanation

Re-explain the same content as if you are talking to a curious 5-year-old child:

- Use **very short sentences**.
- Use **everyday words** — avoid technical or domain-specific terms entirely. If you must introduce a concept, use an analogy or a toy/food/animal comparison.
- Use **at most 1–2 short paragraphs** or a simple list of bullet points.
- Aim for warmth and simplicity, not condescension.

Label this section **"ELI5"**.

## Output format

Respond with exactly two labelled sections in Markdown:

```
## Summary
<3–5 sentence plain-language summary>

## ELI5
<simple, friendly explanation suitable for a 5-year-old>
```

Do not add any other sections or commentary outside these two blocks.
