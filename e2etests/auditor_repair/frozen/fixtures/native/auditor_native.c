/*
 * auditor_native.c - native support for macro_native_source_auditor.
 *
 * Target: Windows x64, built with clang as a shared library.
 *   clang -shared -fstack-protector-all native/auditor_native.c -o libs/libauditor_native.dll
 *
 * Digest is a modular rolling hash so that results stay inside Int64 on the
 * Cangjie side and never depend on platform integer width:
 *   h = (h * 131 + byte) % 1000000007
 */
#include <stdint.h>

#if defined(_WIN32)
#define CJ_EXPORT __declspec(dllexport)
#else
#define CJ_EXPORT __attribute__((visibility("default")))
#endif

#define AUDITOR_ABI_VERSION 10005
#define AUDITOR_DIGEST_BASE 131
#define AUDITOR_DIGEST_MOD 1000000007

CJ_EXPORT int64_t auditor_abi_version(void) {
    return (int64_t)AUDITOR_ABI_VERSION;
}

CJ_EXPORT int64_t auditor_digest_update(int64_t state, const uint8_t* data, int64_t length) {
    int64_t hash = state % AUDITOR_DIGEST_MOD;
    if (hash < 0) {
        hash += AUDITOR_DIGEST_MOD;
    }
    if (data == 0) {
        return hash;
    }
    for (int64_t index = 0; index < length; ++index) {
        hash = (hash * AUDITOR_DIGEST_BASE + (int64_t)data[index]) % AUDITOR_DIGEST_MOD;
    }
    return hash;
}

CJ_EXPORT int64_t auditor_digest(const uint8_t* data, int64_t length) {
    return auditor_digest_update(0, data, length);
}

CJ_EXPORT int64_t auditor_count_byte(const uint8_t* data, int64_t length, uint8_t target) {
    int64_t total = 0;
    if (data == 0) {
        return 0;
    }
    for (int64_t index = 0; index < length; ++index) {
        if (data[index] == target) {
            ++total;
        }
    }
    return total;
}

CJ_EXPORT int64_t auditor_scale(int64_t* values, int64_t length, int64_t factor) {
    int64_t total = 0;
    if (values == 0) {
        return 0;
    }
    for (int64_t index = 0; index < length; ++index) {
        values[index] *= factor;
        total += values[index];
    }
    return total;
}
