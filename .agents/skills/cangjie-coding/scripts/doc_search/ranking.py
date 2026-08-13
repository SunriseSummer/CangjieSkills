from __future__ import annotations

import argparse
import re

from .backend import load_records
from .catalog import normalized_selector, normalized_title, selected_domains, selected_kinds
from .constants import BROAD_ROUTING_ROOTS, GENERIC_ARGUMENT_TERMS, NON_ACTION_QUERY_TERMS
from .content import matching_snippets, normalized_search_record
from .models import Hit
from .query import domain_match, folded_term_present, routing_terms_for, with_identifier_aliases


def manifest_hits(
    query: str,
    terms: list[str],
    args: argparse.Namespace,
    *,
    limit: int | None = -1,
    records: list[dict] | None = None,
) -> list[Hit]:
    domains = selected_domains(args)
    kinds = selected_kinds(args)
    phrase = query.casefold()
    hits: list[Hit] = []
    for record in records if records is not None else load_records():
        if not domain_match(record, domains) or (kinds and record.get("kind") not in kinds):
            continue
        signatures = record.get("signatures") or ([record.get("signature", "")] if record.get("signature") else [])
        # Examples often contain the only searchable combination of cooperating
        # API names. Cache normalized fields so repeated --query values scan the
        # in-memory index without reparsing every page for each query.
        normalized, all_text = normalized_search_record(
            str(record.get("id", "")), str(record.get("title", "")),
            str(record.get("summary", "")), str(record.get("path", "")),
            " ".join(signatures),
        )
        present = [term for term in terms if folded_term_present(all_text, term)]
        if (args.all_terms and len(present) != len(terms)) or (not args.all_terms and not present):
            continue
        score = len(present) * 50
        if len(present) == len(terms):
            score += 80
        # Multi-word coding queries conventionally put the subject first
        # ("enum pattern matching", "HashMap get add").  Keep that intent
        # when generic trailing words appear in several unrelated pages.
        if len(terms) > 1 and len(terms[0]) >= 2 and folded_term_present(normalized["id"], terms[0]):
            score += 120
        elif len(terms) > 1 and len(terms[0]) >= 2 and folded_term_present(normalized["title"], terms[0]):
            score += 90
        if len(terms) > 1 and len(terms[0]) >= 2:
            intent_terms = [term for term in terms[1:] if term not in NON_ACTION_QUERY_TERMS]
            has_intent_match = any(term in present for term in intent_terms)
            subject_title = re.sub(r"^\d+(?:\.\d+)*[.、]?\s*", "", normalized["title"])
            # An explicit language-only search asks for the language guide,
            # even when generated core-type pages are also tagged as language.
            # Receiver/action boosts are useful for mixed-domain API lookup but
            # would otherwise crowd the requested guide leaf out of the result.
            is_api_surface = (
                str(record.get("path", "")).startswith("api/")
                and domains != {"language"}
            )
            if is_api_surface and has_intent_match and re.match(rf"^{re.escape(terms[0])}(?:$|[<.(\s])", subject_title):
                # Treat the first query token as the requested receiver/type.
                # This keeps `Array Float64 initialization` on Array.init even
                # though another constructor page mentions both Array and Float64.
                score += 300
            id_parts = str(record.get("id", "")).casefold().split(".")
            receiver_match = is_api_surface and (
                any(
                    folded_term_present(with_identifier_aliases(part).casefold(), terms[0])
                    for part in id_parts[:-1]
                )
                or (
                record.get("kind") in {"api-type", "api-package"}
                and bool(id_parts)
                and folded_term_present(with_identifier_aliases(id_parts[-1]).casefold(), terms[0])
                )
                or (terms[0] == "string" and "unicodestringextension" in id_parts)
            )
            if receiver_match and has_intent_match:
                score += 350
            action_segment = id_parts[-1] if id_parts else ""
            summary_receiver_match = (
                is_api_surface
                and folded_term_present(normalized["summary"], terms[0])
            )
            action_matches = {
                term for term in intent_terms
                if folded_term_present(action_segment, term)
                or folded_term_present(normalized["title"], term)
            }
            if summary_receiver_match and action_matches and len(terms) <= 3:
                # Generated overload leaves can share a generic signature and
                # hash-based ID. Their summary is then the only compact field
                # that names the concrete receiver (Int64, UInt16, ...).
                score += 500
            if receiver_match:
                score += 300 * len(action_matches)
        if (
            len(terms) > 1
            and normalized["id"].rsplit(".", 1)[-1] == terms[0]
            and normalized_title(record) == terms[0]
        ):
            score += 180
        if (
            len(terms) > 1
            and record.get("kind") in {"guide-topic", "guide-index", "index"}
            and str(record.get("id", "")).casefold().rsplit(".", 1)[-1] == terms[0]
        ):
            # The exact subject overview is the intended first disclosure layer.
            # Keep it visible even when several API member names match trailing
            # intent words such as `toString`.
            score += 800
        if len(terms) > 1 and len(present) >= 2 and record.get("kind") == "guide-leaf":
            leaf_label = " ".join(
                (
                    normalized["id"].rsplit(".", 1)[-1],
                    normalized["title"],
                )
            )
            # Once the subject overview is known, prefer the leaf whose own
            # label names the requested operation over sibling leaves that only
            # inherit the term from their parent index.
            score += 220 * sum(
                1 for term in terms[1:] if folded_term_present(leaf_label, term)
            )
        # A qualified package/type prefix is an explicit routing request.
        # Without this boost, `std.math abs sqrt` tied with std.math.numeric
        # because both pages happened to mention the same function names.
        record_id = normalized["id"]
        if record_id and phrase.startswith(record_id + " "):
            score += 320
        coverage_weights = {"id": 350, "signature": 300, "title": 250, "summary": 150, "path": 100, "content": 40}
        for key, weight in coverage_weights.items():
            value = normalized.get(key, "")
            if terms and all(folded_term_present(value, term) for term in terms):
                score += weight
        weights = {"id": 180, "signature": 160, "title": 120, "summary": 70, "path": 50, "content": 20}
        for key, weight in weights.items():
            if phrase and phrase in normalized.get(key, ""):
                score += weight
        if phrase == normalized["id"] or phrase == normalized["title"]:
            score += 400
        title_without_number = re.sub(r"^\d+(?:\.\d+)*[.、]?\s*", "", normalized["title"])
        if phrase and title_without_number.startswith(phrase):
            score += 180
        # Chinese negative-topic pages naturally contain the positive query
        # ("非命名参数" contains "命名参数").  Keep them discoverable, but do
        # not rank them ahead of the positive topic unless the query asks for 非.
        if phrase and not phrase.startswith("非") and title_without_number.startswith("非" + phrase):
            score -= 260
        if record.get("kind") in ("api-member", "guide-leaf") and len(present) == len(terms):
            score += 20
        if record.get("kind") == "example-leaf" and len(present) == len(terms):
            # A verified application leaf that covers the whole scenario is
            # usually more useful than a neighboring specialized guide whose
            # project snippet happens to contain the same words.
            score += 260
        hits.append(Hit(score, record, tuple(present)))
    hits.sort(key=lambda hit: (-hit.score, hit.record.get("level", 99), hit.record.get("path", "")))
    actual_limit = args.max_results if limit == -1 else limit
    selected = hits if actual_limit is None else hits[:actual_limit]
    if actual_limit is not None:
        for hit in selected:
            hit.matched_snippets = matching_snippets(hit.record, terms)
    return selected

def compact_routing_hits(hits: list[Hit], query: str, limit: int) -> list[Hit]:
    """Hide generic roots and diversify results across uncovered query terms."""
    phrase = normalized_selector(query)
    specific: list[Hit] = []
    for hit in hits:
        record = hit.record
        record_id = str(record.get("id", "")).casefold()
        title = str(record.get("title", "")).strip().casefold()
        is_requested_root = phrase in {record_id, title, normalized_title(record)}
        if record_id not in BROAD_ROUTING_ROOTS or is_requested_root:
            specific.append(hit)
    candidates = list(specific if specific else hits)
    selected: list[Hit] = []
    covered: set[str] = set()
    positions = {id(hit): index for index, hit in enumerate(candidates)}
    while candidates and len(selected) < limit:
        best = max(
            candidates,
            key=lambda hit: (
                hit.score + 160 * len(set(hit.matched_terms) - covered),
                1 if str(hit.record.get("kind", "")).endswith("leaf") else 0,
                int(hit.record.get("level", 0)),
                -positions[id(hit)],
            ),
        )
        candidates.remove(best)
        selected.append(best)
        covered.update(best.matched_terms)
    terms = routing_terms_for(query)
    for hit in selected:
        hit.matched_snippets = matching_snippets(hit.record, terms)
    return selected
