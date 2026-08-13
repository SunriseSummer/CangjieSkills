from __future__ import annotations

import re

from .constants import (GENERIC_ARGUMENT_TERMS, GENERIC_SCOPE_TERMS, QUERY_SHAPE_NOISE, QUERY_TERM_ALIASES, SEARCHABLE_IDENTIFIER_PARTS)


def terms_for(query: str) -> list[str]:
    raw = [item.casefold() for item in re.findall(r"\w+", query, flags=re.UNICODE)]
    # Code-shaped examples such as b'.' or version text otherwise introduce
    # one-character terms (b, 0, 1) that match unrelated snippets and can
    # outrank the actual concept. Preserve them only when the whole query is
    # itself a one-character lookup.
    if any(len(item) > 1 for item in raw):
        raw = [item for item in raw if not (item.isascii() and len(item) == 1)]
    terms: list[str] = []
    seen: set[str] = set()
    for normalized in raw:
        if normalized not in seen:
            seen.add(normalized)
            terms.append(normalized)
    return terms

def routing_terms_for(query: str) -> list[str]:
    """Ignore a broad navigation label when a query also names a real topic."""
    terms = terms_for(query)
    specific = [term for term in terms if term not in GENERIC_SCOPE_TERMS]
    return specific if specific else terms

def symbol_like_anchors(query: str) -> list[str]:
    """Identify a likely accidental bundle of independent code symbols."""
    anchors: list[str] = []
    seen: set[str] = set()
    for raw in re.findall(r"[A-Za-z_][A-Za-z0-9_.]*", query):
        folded = raw.casefold()
        leaf = raw.rsplit(".", 1)[-1]
        if folded in QUERY_SHAPE_NOISE or folded in seen:
            continue
        looks_symbolic = (
            "." in raw
            or leaf[:1].isupper()
            or any(character.isupper() for character in leaf[1:])
            or folded in GENERIC_ARGUMENT_TERMS
        )
        if looks_symbolic:
            seen.add(folded)
            anchors.append(raw)
    return anchors

def query_shape_note(query: str) -> str:
    anchors = symbol_like_anchors(query)
    if len(anchors) < 4:
        return ""
    return (
        "Note: this query contains many symbol-like anchors "
        f"({', '.join(anchors[:8])}). If they are independent lookups, keep one "
        "script process but repeat --query once per symbol or tightly coupled intent; "
        "keep them together only when searching for one page where they cooperate."
    )

def ascii_identifier_present(text: str, term: str) -> bool:
    r"""Match an ASCII identifier with ``\w``-like boundaries without regex scans."""
    start = text.find(term)
    while start >= 0:
        end = start + len(term)
        before_word = start > 0 and (text[start - 1].isalnum() or text[start - 1] == "_")
        after_word = end < len(text) and (text[end].isalnum() or text[end] == "_")
        if not before_word and not after_word:
            return True
        start = text.find(term, start + 1)
    return False

def _term_present_folded(text: str, term: str) -> bool:
    aliases = QUERY_TERM_ALIASES.get(term, ())
    if any(_term_present_folded(text, alias.casefold()) for alias in aliases):
        return True
    if term.isascii() and term and all(char.isalnum() or char == "_" for char in term):
        return ascii_identifier_present(text, term)
    if term == "阻塞" and term in text:
        # “非阻塞” is the opposite contract, not evidence for an English
        # blocking/blocked query routed through the 阻塞 alias.
        start = text.find(term)
        while start >= 0:
            if start == 0 or text[start - 1] != "非":
                return True
            start = text.find(term, start + 1)
        return False
    if term in text:
        return True
    # Chinese natural-language queries often concatenate a subject and an
    # action ("文件写入") while documentation separates them in a sentence.
    # Requiring both two-character edge anchors recovers that intent without
    # turning every individual Han character into a noisy search token.
    if re.fullmatch(r"[\u3400-\u9fff]{4,}", term):
        return term[:2] in text and term[-2:] in text
    return False

def term_present(text: str, term: str) -> bool:
    return _term_present_folded(text.casefold(), term.casefold())

def folded_term_present(folded_text: str, folded_term: str) -> bool:
    """Match values already normalized by the search index without re-folding them."""
    return _term_present_folded(folded_text, folded_term)

def with_identifier_aliases(value: str) -> str:
    """Expose camel-case identifier components without fuzzy prose matching."""
    aliases: set[str] = set()
    for identifier in re.findall(r"[A-Za-z][A-Za-z0-9_]*", value):
        # `CFFI` is commonly written as the repository/path token `cffi`;
        # expose the user-facing `FFI` concept without enabling arbitrary
        # substring matches inside identifiers.
        if identifier.casefold() == "cffi":
            aliases.add("ffi")
        parts = re.findall(r"[A-Z]+(?=[A-Z][a-z]|\d|$)|[A-Z]?[a-z]+|\d+", identifier)
        if len(parts) < 2:
            continue
        # Acronyms are often the concept users know (PI, HTTP, TLS), while the
        # declaration embeds them in getPI/HttpRequest/TlsSocket. Generic
        # single camel-case words such as get/read stay excluded to avoid noise.
        aliases.update(
            part for part in parts
            if len(part) >= 2 and (part.isupper() or part.casefold() in SEARCHABLE_IDENTIFIER_PARTS)
        )
        for start in range(len(parts)):
            for end in range(start + 2, len(parts) + 1):
                aliases.add("".join(parts[start:end]))
    return value + (" " + " ".join(sorted(aliases)) if aliases else "")

def record_domain(record: dict) -> str:
    path = record.get("path", "")
    declared = str(record.get("domain", ""))
    if declared and declared != "all":
        return declared
    if path.startswith("language/"):
        return "language"
    if path.startswith("tools/"):
        return "tools"
    if path.startswith("api/stdx/") or path.startswith("guides/stdx/"):
        return "stdx"
    if path.startswith("api/std/") or path.startswith("guides/std/"):
        return "std"
    if path.startswith("api/"):
        return "api"
    if path.startswith("guides/"):
        return "guides"
    if path.startswith("examples/"):
        return "examples"
    return "all"

def domain_match(record: dict, domains: set[str]) -> bool:
    if not domains or "all" in domains:
        return True
    actual = record_domain(record)
    path = record.get("path", "")
    return (
        actual in domains
        or ("api" in domains and path.startswith("api/"))
        or (("examples" in domains or "guides" in domains) and path.startswith("examples/"))
    )
