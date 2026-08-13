#!/usr/bin/env python3
"""Query the authored Markdown knowledge tree during Skill development."""

from pathlib import Path
import sys

sys.dont_write_bytecode = True
SCRIPT_ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_ROOT))

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
if hasattr(sys.stderr, "reconfigure"):
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

from doc_search import *  # noqa: F401,F403,E402
from doc_search import configure_backend, main  # noqa: E402
from doc_search.markdown_backend import MarkdownBackend  # noqa: E402


SKILL_ROOT = SCRIPT_ROOT.parent
configure_backend(MarkdownBackend(SKILL_ROOT))


if __name__ == "__main__":
    raise SystemExit(main())
