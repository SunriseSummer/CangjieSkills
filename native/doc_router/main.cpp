// Cangjie document router. The runtime uses only C++17 and the generated index.
#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <map>
#include <set>
#include <sstream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <utility>
#include <vector>

namespace router {
constexpr std::size_t kFeatures = 12;
const std::array<const char*, kFeatures> feature_names = {{
    "log_bm25", "raw_coverage", "title_coverage", "receiver_match",
    "member_match", "alias_coverage", "exact_selector", "is_leaf",
    "broad_root", "symbol_pair", "domain_match", "ascii_coverage"
}};

std::string lower(std::string value) {
    for (char& c : value) if (c >= 'A' && c <= 'Z') c += 'a' - 'A';
    return value;
}
bool ascii_letter(uint32_t c) { return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'); }
bool digit(uint32_t c) { return c >= '0' && c <= '9'; }
bool ascii_word(uint32_t c) { return ascii_letter(c) || digit(c) || c == '_'; }
bool upper(uint32_t c) { return c >= 'A' && c <= 'Z'; }
bool lowercase(uint32_t c) { return c >= 'a' && c <= 'z'; }
std::string trim(std::string value) {
    auto space = [](unsigned char c) { return c == ' ' || c == '\t' || c == '\r' || c == '\n'; };
    while (!value.empty() && space(value.back())) value.pop_back();
    std::size_t first = 0;
    while (first < value.size() && space(value[first])) ++first;
    return value.substr(first);
}

// Strict decoding prevents malformed index/query text from changing token boundaries.
std::vector<std::pair<uint32_t, std::string>> unicode(const std::string& text) {
    std::vector<std::pair<uint32_t, std::string>> out;
    for (std::size_t i = 0; i < text.size();) {
        std::size_t start = i;
        unsigned char lead = text[i++];
        uint32_t value = 0; int continuation = 0;
        if (lead < 0x80) value = lead;
        else if (lead >= 0xC2 && lead <= 0xDF) { value = lead & 31; continuation = 1; }
        else if (lead >= 0xE0 && lead <= 0xEF) { value = lead & 15; continuation = 2; }
        else if (lead >= 0xF0 && lead <= 0xF4) { value = lead & 7; continuation = 3; }
        else throw std::runtime_error("invalid UTF-8 text");
        for (int j = 0; j < continuation; ++j) {
            if (i >= text.size() || (static_cast<unsigned char>(text[i]) & 0xC0) != 0x80)
                throw std::runtime_error("invalid UTF-8 text");
            value = (value << 6) | (static_cast<unsigned char>(text[i++]) & 63);
        }
        if ((continuation == 1 && value < 0x80) || (continuation == 2 && value < 0x800) ||
            (continuation == 3 && value < 0x10000) || value > 0x10FFFF ||
            (value >= 0xD800 && value <= 0xDFFF) || value == 0)
            throw std::runtime_error("invalid UTF-8 text");
        out.emplace_back(value, text.substr(start, i - start));
    }
    return out;
}
bool han(uint32_t c) { return c >= 0x3400 && c <= 0x9FFF; }

std::vector<std::string> tokens(const std::string& text) {
    auto chars = unicode(text);
    std::vector<std::string> result;
    for (std::size_t i = 0; i < chars.size();) {
        if (han(chars[i].first)) {
            std::size_t end = i + 1;
            while (end < chars.size() && han(chars[end].first)) ++end;
            if (end == i + 1) result.push_back(chars[i].second);
            else for (std::size_t j = i; j + 1 < end; ++j) result.push_back(chars[j].second + chars[j + 1].second);
            i = end;
        } else if (ascii_letter(chars[i].first) || chars[i].first == '_') {
            std::string word;
            while (i < chars.size() && ascii_word(chars[i].first)) word += chars[i++].second;
            std::set<std::string> pieces{lower(word)};
            // The same boundaries as Python's acronym/camel/digit tokenizer.
            for (std::size_t start = 0; start < word.size();) {
                if (word[start] == '_') { ++start; continue; }
                std::size_t end = start + 1;
                if (digit(word[start])) { while (end < word.size() && digit(word[end])) ++end; }
                else if (upper(word[start])) {
                    if (end < word.size() && lowercase(word[end])) {
                        while (end < word.size() && lowercase(word[end])) ++end;
                    } else {
                        while (end < word.size() && upper(word[end])) ++end;
                        if (end > start + 1 && end < word.size() && lowercase(word[end])) --end;
                    }
                } else { while (end < word.size() && lowercase(word[end])) ++end; }
                pieces.insert(lower(word.substr(start, end - start)));
                start = end;
            }
            result.insert(result.end(), pieces.begin(), pieces.end());
        } else if (digit(chars[i].first)) {
            std::string number;
            while (i < chars.size() && digit(chars[i].first)) number += chars[i++].second;
            result.push_back(number);
        } else ++i;
    }
    return result;
}
const std::unordered_set<std::string> stopwords = {
    "how", "to", "the", "a", "an", "in", "of", "is", "can", "i", "use", "using", "with", "and", "for", "do", "does", "what", "please", "cangjie",
    "怎么", "如何", "使用", "仓颉", "语言", "实现", "一个", "可以", "什么", "请问", "想要", "需要", "进行", "以及", "这个", "问题"
};
std::vector<std::string> query_tokens(const std::string& query) {
    std::set<std::string> unique;
    for (auto& token : tokens(query)) if (!stopwords.count(token)) unique.insert(token);
    return {unique.begin(), unique.end()};
}
std::unordered_set<std::string> token_set(const std::string& text) {
    auto list = tokens(text);
    return {list.begin(), list.end()};
}

std::string json_string(const std::string& text) {
    std::ostringstream out; out << '"';
    for (unsigned char c : text) {
        switch (c) {
            case '"': out << "\\\""; break;
            case '\\': out << "\\\\"; break;
            case '\b': out << "\\b"; break;
            case '\f': out << "\\f"; break;
            case '\n': out << "\\n"; break;
            case '\r': out << "\\r"; break;
            case '\t': out << "\\t"; break;
            default:
                if (c < 32) out << "\\u00" << "0123456789abcdef"[c >> 4] << "0123456789abcdef"[c & 15];
                else out << static_cast<char>(c);
        }
    }
    out << '"'; return out.str();
}

class Reader {
    std::string bytes; std::size_t cursor = 0;
public:
    explicit Reader(const std::string& path) {
        std::ifstream input(path, std::ios::binary | std::ios::ate);
        if (!input) throw std::runtime_error("cannot open index: " + path);
        auto size = input.tellg();
        if (size < 8 || size > 256 * 1024 * 1024) throw std::runtime_error("index size out of bounds");
        bytes.resize(static_cast<std::size_t>(size)); input.seekg(0);
        if (!input.read(&bytes[0], static_cast<std::streamsize>(bytes.size()))) throw std::runtime_error("cannot read index");
    }
    std::size_t remaining() const { return bytes.size() - cursor; }
    std::string raw(std::size_t size) {
        if (size > remaining()) throw std::runtime_error("truncated index");
        std::string value = bytes.substr(cursor, size); cursor += size; return value;
    }
    uint32_t u32() {
        if (remaining() < 4) throw std::runtime_error("truncated index integer");
        uint32_t value = 0;
        for (int i = 0; i < 4; ++i) value |= static_cast<uint32_t>(static_cast<unsigned char>(bytes[cursor++])) << (8 * i);
        return value;
    }
    uint32_t count(uint32_t maximum, const char* field) {
        auto n = u32();
        if (n > maximum || n > remaining() / 4) throw std::runtime_error(std::string("index count out of bounds: ") + field);
        return n;
    }
    float f32() {
        uint32_t value = u32(); float result;
        static_assert(sizeof(float) == 4, "32-bit float required");
        std::memcpy(&result, &value, sizeof(result));
        if (!std::isfinite(result)) throw std::runtime_error("non-finite model/index value");
        return result;
    }
    std::string string() {
        auto n = u32(); if (n > 1024 * 1024) throw std::runtime_error("index string too long");
        auto value = raw(n); unicode(value); return value;
    }
};

struct Document {
    std::string id, path, title, domain, kind, receiver, member;
    uint32_t length = 0;
    std::unordered_set<std::string> title_terms;
};
struct Posting { uint32_t doc; float tf; };
struct Term { std::vector<Posting> postings; double idf = 0; };
struct Alias { std::string trigger; std::vector<std::string> expansion; };
struct Index {
    std::vector<Document> docs;
    std::unordered_map<std::string, Term> terms;
    std::vector<Alias> aliases;
    std::unordered_set<std::string> receiver_names;
    std::array<double, kFeatures> weights;
    std::string hash;
    double avg_length = 1;

    explicit Index(const std::string& path) {
        Reader r(path);
        if (r.raw(8) != std::string("CJROUT1\0", 8) || r.u32() != 1) throw std::runtime_error("unsupported index format");
        hash = r.string();
        if (hash.size() != 64 || hash.find_first_not_of("0123456789abcdef") != std::string::npos) throw std::runtime_error("invalid corpus hash");
        auto ndocs = r.count(500000, "documents");
        if (!ndocs) throw std::runtime_error("empty document index");
        docs.reserve(ndocs);
        std::set<std::string> paths, ids;
        double total_length = 0;
        for (uint32_t i = 0; i < ndocs; ++i) {
            Document d;
            d.id = r.string(); d.path = r.string(); d.title = r.string();
            d.domain = r.string(); d.kind = r.string(); d.receiver = lower(r.string()); d.member = lower(r.string());
            d.length = r.u32();
            if (d.path.compare(0, 11, "references/") != 0 || d.path.find("..") != std::string::npos ||
                d.path.find('\\') != std::string::npos || d.path.size() < 14 || d.path.substr(d.path.size()-3) != ".md" ||
                d.id.empty() || !paths.insert(d.path).second || !ids.insert(d.id).second || d.length == 0 || d.length > 10000000)
                throw std::runtime_error("invalid or duplicate document metadata");
            d.title_terms = token_set(d.title + " " + d.receiver + " " + d.member);
            if (!d.receiver.empty()) receiver_names.insert(d.receiver);
            total_length += d.length; docs.push_back(std::move(d));
        }
        avg_length = total_length / ndocs;
        auto nterms = r.count(5000000, "terms");
        terms.reserve(nterms);
        for (uint32_t i = 0; i < nterms; ++i) {
            auto token = r.string();
            if (token.empty() || token.size() > 4096) throw std::runtime_error("invalid index term");
            auto n = r.count(ndocs, "postings");
            if (!n || n > r.remaining() / 8) throw std::runtime_error("invalid postings count");
            Term term; term.postings.reserve(n); uint32_t prev = 0;
            for (uint32_t j = 0; j < n; ++j) {
                auto doc = r.u32(); float tf = r.f32();
                if (doc >= ndocs || (j && doc <= prev) || tf <= 0 || tf > 10000000) throw std::runtime_error("invalid posting");
                term.postings.push_back({doc, tf}); prev = doc;
            }
            term.idf = std::log(1.0 + (ndocs - n + .5) / (n + .5));
            if (!terms.emplace(token, std::move(term)).second) throw std::runtime_error("duplicate index term");
        }
        auto naliases = r.count(10000, "aliases");
        for (uint32_t i = 0; i < naliases; ++i) {
            Alias a; a.trigger = lower(r.string());
            if (a.trigger.empty()) throw std::runtime_error("empty alias trigger");
            auto n = r.count(1000, "alias expansions");
            for (uint32_t j = 0; j < n; ++j) a.expansion.push_back(r.string());
            aliases.push_back(std::move(a));
        }
        if (r.u32() != kFeatures) throw std::runtime_error("ranker feature count mismatch");
        for (double& w : weights) { w = r.f32(); if (std::abs(w) > 1000) throw std::runtime_error("ranker weight out of bounds"); }
        if (r.remaining()) throw std::runtime_error("unexpected trailing index data");
    }
};

bool trigger_match(const std::string& query, const std::string& trigger) {
    std::size_t pos = query.find(trigger);
    bool ascii = std::all_of(trigger.begin(), trigger.end(), [](unsigned char c) { return c < 128; });
    while (pos != std::string::npos) {
        std::size_t end = pos + trigger.size();
        if (!ascii || ((pos == 0 || !ascii_word(query[pos-1])) && (end == query.size() || !ascii_word(query[end])))) return true;
        pos = query.find(trigger, pos + 1);
    }
    return false;
}
std::vector<std::string> whole_identifiers(const std::string& query) {
    std::vector<std::string> result;
    for (std::size_t i=0; i<query.size();) {
        auto c=static_cast<unsigned char>(query[i]);
        if (ascii_letter(c) || c=='_') {
            std::size_t start=i++;
            while(i<query.size() && ascii_word(static_cast<unsigned char>(query[i]))) ++i;
            auto word=lower(query.substr(start,i-start));
            if(!stopwords.count(word)) result.push_back(word);
        } else ++i;
    }
    return result;
}
struct Options {
    std::string index;
    std::vector<std::string> queries, candidate_paths;
    std::set<std::string> domains;
    int top_k = 5;
    bool explain = false, stdin_mode = false, dump_features = false, bm25_only = true;
};
struct Hit {
    uint32_t doc;
    double bm25 = 0, raw_matched = 0, alias_matched = 0, ascii_matched = 0;
    std::array<double, kFeatures> features{};
    double score = 0;
};
struct Answer {
    std::string query;
    std::vector<Hit> hits;
    std::string status = "no_match";
};

Answer search(const Index& index, const std::string& query, const Options& options) {
    if (query.size() > 16384) throw std::runtime_error("query exceeds 16384 UTF-8 bytes");
    Answer answer; answer.query = query;
    auto raw = query_tokens(query);
    if (raw.empty()) return answer;
    std::string folded = lower(trim(query));
    // Typed identifiers and manifest paths bypass statistical ambiguity.
    std::string selector = folded;
    if (selector.size() > 2 && selector.substr(selector.size()-2) == "()") selector.resize(selector.size()-2);
    std::map<std::string, double> query_terms;
    for (const auto& token : raw) query_terms[token] = 1;
    std::set<std::string> alias_terms;
    auto identifiers = whole_identifiers(query);
    std::set<std::string> full_identifiers(identifiers.begin(), identifiers.end());
    std::vector<std::string> alias_identifiers;
    std::string primary_receiver;
    bool alias_receiver = false;
    for (const auto& word: identifiers) if (index.receiver_names.count(word)) { primary_receiver=word; break; }
    for (const auto& alias : index.aliases) if (trigger_match(folded, alias.trigger)) {
        for (const auto& expansion : alias.expansion) {
            for (const auto& word: whole_identifiers(expansion)) alias_identifiers.push_back(word);
            for (const auto& token : query_tokens(expansion)) {
                if (!query_terms.count(token)) { query_terms[token] = .45; alias_terms.insert(token); }
            }
        }
    }
    if (primary_receiver.empty()) for (const auto& word: alias_identifiers) if (index.receiver_names.count(word)) { primary_receiver=word; alias_receiver=true; break; }
    std::set<std::string> alias_identifier_set(alias_identifiers.begin(),alias_identifiers.end());
    double raw_total = 0, alias_total = 0, ascii_total = 0;
    std::size_t unknown_terms = 0;
    std::unordered_map<std::string, double> idfs;
    for (const auto& token : raw) {
        auto it = index.terms.find(token);
        if (it == index.terms.end()) { ++unknown_terms; continue; }
        idfs[token] = it->second.idf;
        raw_total += it->second.idf;
        if (std::all_of(token.begin(), token.end(), [](unsigned char c){return c < 128;})) ascii_total += it->second.idf;
    }
    // Unknown ngrams carry a small denominator cost instead of disappearing:
    // a single incidental corpus word cannot explain a long out-of-domain query.
    raw_total += unknown_terms * 2.0;
    for (const auto& token : alias_terms) {
        auto it = index.terms.find(token);
        if (it != index.terms.end()) alias_total += it->second.idf;
    }
    std::unordered_map<uint32_t, Hit> candidates;
    for (const auto& qt : query_terms) {
        auto it = index.terms.find(qt.first);
        if (it == index.terms.end()) continue;
        const auto& term = it->second;
        bool is_raw = qt.second == 1;
        bool is_ascii = std::all_of(qt.first.begin(), qt.first.end(), [](unsigned char c){return c < 128;});
        for (const auto& posting : term.postings) {
            const auto& d = index.docs[posting.doc];
            if (!options.domains.empty() && !options.domains.count(d.domain) &&
                !(options.domains.count("examples") && d.path.compare(0,20,"references/examples/")==0)) continue;
            auto& hit = candidates[posting.doc]; hit.doc = posting.doc;
            double norm = 1.2 * (.25 + .75 * d.length / index.avg_length);
            hit.bm25 += qt.second * term.idf * (posting.tf * 2.2 / (posting.tf + norm));
            if (is_raw) { hit.raw_matched += term.idf; if (is_ascii) hit.ascii_matched += term.idf; }
            else hit.alias_matched += term.idf;
        }
    }
    if (options.dump_features) for (const auto& path : options.candidate_paths) {
        bool found = false;
        for (uint32_t i = 0; i < index.docs.size(); ++i) if (index.docs[i].path == path) {
            auto& hit = candidates[i]; hit.doc = i; found = true; break;
        }
        if (!found) throw std::runtime_error("unknown candidate path: " + path);
    }
    std::string requested_domain;
    if (folded.find("stdx.") != std::string::npos) requested_domain = "stdx";
    else if (folded.find("std.") != std::string::npos) requested_domain = "std";
    else if (folded.find("cjpm") != std::string::npos || folded.find("cjc") != std::string::npos || folded.find("cjfmt") != std::string::npos || folded.find("cjlint") != std::string::npos) requested_domain = "tools";
    bool any_exact = false;
    for (auto& item : candidates) {
        auto& hit = item.second; const auto& d = index.docs[hit.doc]; auto& f = hit.features;
        double title_weight = 0;
        for (const auto& token : raw) if (d.title_terms.count(token) && idfs.count(token)) title_weight += idfs[token];
        double receiver = !d.receiver.empty() && d.receiver==primary_receiver ? (alias_receiver ? .65 : 1.0) : 0.0;
        double member = !d.member.empty() && full_identifiers.count(d.member) ? 1.0 :
            (!d.member.empty() && alias_identifier_set.count(d.member) ? .65 : 0.0);
        bool exact = selector == lower(d.id) || selector == lower(d.title) || selector == lower(d.path) ||
            (d.path.size() > 11 && selector == lower(d.path.substr(11)));
        bool leaf = d.kind == "api-member" || d.kind == "guide-leaf" || d.kind == "example-leaf";
        bool broad = d.kind == "index" || d.kind == "guide-index" || d.kind == "guide-topic";
        f = {{std::log1p(hit.bm25), raw_total ? hit.raw_matched/raw_total : 0,
            raw_total ? title_weight/raw_total : 0, receiver, member,
            alias_total ? hit.alias_matched/alias_total : 0, exact ? 1.0 : 0.0, leaf ? 1.0 : 0.0,
            broad ? 1.0 : 0.0, receiver * member,
            !requested_domain.empty() && requested_domain == d.domain ? 1.0 : 0.0,
            ascii_total ? hit.ascii_matched/ascii_total : 0}};
        for (std::size_t j=0; j<kFeatures; ++j) hit.score += f[j]*index.weights[j];
        if(options.bm25_only) hit.score=hit.bm25;
        if (exact) any_exact = true;
        answer.hits.push_back(hit);
    }
    std::sort(answer.hits.begin(), answer.hits.end(), [&](const Hit& a, const Hit& b) {
        if (options.bm25_only && a.bm25 != b.bm25) return a.bm25 > b.bm25;
        if (!options.bm25_only && a.features[6] != b.features[6]) return a.features[6] > b.features[6];
        if (a.score != b.score) return a.score > b.score;
        return index.docs[a.doc].path < index.docs[b.doc].path;
    });
    // Match evidence is independent of learned scores; unknown prose must not be
    // turned into a confident random path by a ranker bias or an alias alone.
    if (!options.dump_features && !answer.hits.empty()) {
        const auto& first = answer.hits.front();
        bool weak = first.bm25 < 1.0 || (first.features[1] < .30 && first.features[5] < .4);
        std::size_t known_raw = idfs.size();
        bool incidental = raw.size() >= 4 && known_raw * 4 < raw.size() && alias_total == 0 && first.features[3] == 0 && first.features[4] == 0;
        if (!any_exact && (weak || incidental || (known_raw == 0 && alias_total == 0))) answer.hits.clear();
        else if (any_exact) answer.hits.erase(std::remove_if(answer.hits.begin(), answer.hits.end(), [](const Hit& h){return h.features[6] != 1;}), answer.hits.end());
        else {
            double cutoff = answer.hits.front().score - std::max(3.0, std::abs(answer.hits.front().score)*.35);
            answer.hits.erase(std::remove_if(answer.hits.begin(), answer.hits.end(), [&](const Hit& h){return h.bm25 < .75 || h.score < cutoff;}), answer.hits.end());
        }
    }
    std::vector<Hit> forced;
    if (options.dump_features) for (const auto& hit : answer.hits) {
        if (std::find(options.candidate_paths.begin(), options.candidate_paths.end(), index.docs[hit.doc].path) != options.candidate_paths.end()) forced.push_back(hit);
    }
    if (answer.hits.size() > static_cast<std::size_t>(options.top_k)) answer.hits.resize(options.top_k);
    for (const auto& hit : forced) if (std::none_of(answer.hits.begin(), answer.hits.end(), [&](const Hit& h){return h.doc == hit.doc;})) answer.hits.push_back(hit);
    if (!answer.hits.empty()) answer.status = "ok";
    return answer;
}

std::string render(const Index& index, const std::vector<Answer>& answers, bool explain) {
    std::ostringstream out; out << std::setprecision(9);
    out << "{\"format\":1,\"corpus_hash\":" << json_string(index.hash);
    if (explain) {
        out << ",\"feature_names\":[";
        for (std::size_t j = 0; j < kFeatures; ++j) { if (j) out << ','; out << json_string(feature_names[j]); }
        out << ']';
    }
    out << ",\"queries\":[";
    for (std::size_t i = 0; i < answers.size(); ++i) {
        if (i) out << ',';
        const auto& answer = answers[i];
        out << "{\"query\":" << json_string(answer.query) << ",\"status\":" << json_string(answer.status) << ",\"paths\":[";
        for (std::size_t j = 0; j < answer.hits.size(); ++j) { if (j) out << ','; out << json_string(index.docs[answer.hits[j].doc].path); }
        out << ']';
        if (explain) {
            out << ",\"results\":[";
            for (std::size_t j = 0; j < answer.hits.size(); ++j) {
                if (j) out << ',';
                const auto& hit = answer.hits[j]; const auto& doc = index.docs[hit.doc];
                out << "{\"path\":" << json_string(doc.path) << ",\"id\":" << json_string(doc.id) << ",\"score\":" << hit.score << ",\"features\":[";
                for (std::size_t k = 0; k < kFeatures; ++k) { if (k) out << ','; out << hit.features[k]; }
                out << "]}";
            }
            out << ']';
        }
        out << '}';
    }
    out << "]}"; return out.str();
}

Options parse(int argc, char** argv) {
    Options options;
    bool bm25_requested = false, learned_requested = false;
    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        auto value = [&]() -> std::string {
            if (++i >= argc) throw std::runtime_error("missing argument for " + arg);
            return argv[i];
        };
        if (arg == "--index") options.index = value();
        else if (arg == "--query") options.queries.push_back(value());
        else if (arg == "--candidate-path") options.candidate_paths.push_back(value());
        else if (arg == "--top-k") {
            std::string text = value(); std::size_t end = 0;
            try { options.top_k = std::stoi(text, &end); } catch (...) { throw std::runtime_error("--top-k must be an integer from 1 to 1000"); }
            if (end != text.size() || options.top_k < 1 || options.top_k > 1000) throw std::runtime_error("--top-k must be an integer from 1 to 1000");
        } else if (arg == "--domain") {
            std::stringstream values(value()); std::string domain;
            const std::set<std::string> valid = {"language", "std", "stdx", "tools", "examples"};
            while (std::getline(values, domain, ',')) {
                if (!valid.count(domain)) throw std::runtime_error("unknown --domain: " + domain);
                options.domains.insert(domain);
            }
            if (options.domains.empty()) throw std::runtime_error("empty --domain");
        } else if (arg == "--bm25-only") { options.bm25_only = true; bm25_requested = true; }
        else if (arg == "--learned-ranker") { options.bm25_only = false; learned_requested = true; }
        else if (arg == "--explain") options.explain = true;
        else if (arg == "--stdin") options.stdin_mode = true;
        else if (arg == "--dump-features") { options.dump_features = true; options.explain = true; }
        else if (arg == "--help" || arg == "-h") {
            std::cout << "Usage: cj-doc-router --index router.idx [--query TEXT ... | --stdin] [--top-k 5] [--domain std] [--explain] [--learned-ranker]\n"
                         "Prints JSON containing ranked references/...md paths. --stdin processes one UTF-8 query per line.\n"
                         "Default: BM25 ranking (--bm25-only). --learned-ranker enables the experimental frozen linear model.\n";
            std::exit(0);
        } else throw std::runtime_error("unknown argument: " + arg);
    }
    if (bm25_requested && learned_requested) throw std::runtime_error("--bm25-only and --learned-ranker are mutually exclusive");
    if (options.index.empty()) throw std::runtime_error("--index is required");
    if (options.queries.empty() && !options.stdin_mode) throw std::runtime_error("--query or --stdin is required");
    if (!options.candidate_paths.empty() && !options.dump_features) throw std::runtime_error("--candidate-path requires --dump-features");
    return options;
}
} // namespace router

int main(int argc, char** argv) {
    try {
        auto options = router::parse(argc, argv);
        router::Index index(options.index);
        if (!options.queries.empty()) {
            std::vector<router::Answer> answers;
            for (const auto& query : options.queries) answers.push_back(router::search(index, query, options));
            std::cout << router::render(index, answers, options.explain) << '\n';
        }
        if (options.stdin_mode) {
            std::string line;
            while (std::getline(std::cin, line)) {
                if (!line.empty() && line.back() == '\r') line.pop_back();
                std::cout << router::render(index, {router::search(index, line, options)}, options.explain) << std::endl;
            }
            if (std::cin.bad()) throw std::runtime_error("stdin read failed");
        }
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "error: " << error.what() << '\n';
        return 2;
    }
}
