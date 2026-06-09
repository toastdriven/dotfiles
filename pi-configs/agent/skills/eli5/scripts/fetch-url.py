#!/usr/bin/env python3
"""
fetch-url.py <url>

Fetches a URL and prints its readable plain text to stdout.
Uses only Python stdlib — no third-party dependencies required.
"""

import sys
import re
import urllib.request
import urllib.error
import html

def strip_html(raw: str) -> str:
    # Remove <script> and <style> blocks entirely
    raw = re.sub(r'<(script|style)[^>]*>.*?</\1>', ' ', raw, flags=re.DOTALL | re.IGNORECASE)
    # Replace block-level tags with newlines for readability
    raw = re.sub(r'</(p|div|li|h[1-6]|br|tr|blockquote)[^>]*>', '\n', raw, flags=re.IGNORECASE)
    raw = re.sub(r'<(br)[^>]*/?>',  '\n', raw, flags=re.IGNORECASE)
    # Strip all remaining tags
    raw = re.sub(r'<[^>]+>', ' ', raw)
    # Decode HTML entities
    raw = html.unescape(raw)
    # Collapse whitespace while preserving paragraph breaks
    lines = [re.sub(r'[ \t]+', ' ', line).strip() for line in raw.splitlines()]
    # Remove blank-line runs (keep at most one consecutive blank line)
    cleaned = []
    prev_blank = False
    for line in lines:
        if line == '':
            if not prev_blank:
                cleaned.append('')
            prev_blank = True
        else:
            cleaned.append(line)
            prev_blank = False
    return '\n'.join(cleaned).strip()


def main():
    if len(sys.argv) < 2:
        print("Usage: fetch-url.py <url>", file=sys.stderr)
        sys.exit(1)

    url = sys.argv[1]
    req = urllib.request.Request(
        url,
        headers={"User-Agent": "Mozilla/5.0 (compatible; eli5-skill/1.0)"},
    )
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            content_type = resp.headers.get_content_type()
            raw_bytes = resp.read()
            charset = resp.headers.get_content_charset() or 'utf-8'
            raw = raw_bytes.decode(charset, errors='replace')
    except urllib.error.URLError as e:
        print(f"Error fetching URL: {e}", file=sys.stderr)
        sys.exit(1)

    if 'html' in content_type:
        text = strip_html(raw)
    else:
        text = raw  # plain text, JSON, etc. — pass through as-is

    print(text)


if __name__ == '__main__':
    main()
