"""Small Markdown rules shared by validation without depending on generators."""

from __future__ import annotations

import re


def escape_inline_code_pipes_in_tables(text: str) -> str:
    """Escape pipes inside inline code on table rows."""
    output: list[str] = []
    for line in text.splitlines(keepends=True):
        if line.lstrip().startswith("|"):
            line = re.sub(
                r"(`+)(.*?)\1",
                lambda match: match.group(1)
                + re.sub(r"(?<!\\)\|", r"\\|", match.group(2))
                + match.group(1),
                line,
            )
        output.append(line)
    return "".join(output)
