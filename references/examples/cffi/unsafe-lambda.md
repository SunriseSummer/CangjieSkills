<!-- cj-doc kind="example-leaf" level="4" id="examples.cffi.unsafe-lambda" parent="examples.cffi" -->
# 限定 Lambda 中的 foreign 调用边界

[← C 互操作与 unsafe 边界](index.md)

Lambda 中的 foreign 调用必须处于词法 unsafe 上下文；优先在 Lambda 内用最小 `unsafe {}` 块，也可由外围 unsafe 函数覆盖定义处。

## 已验证的 Lambda `unsafe` 词法边界

Lambda 体内的 `foreign` 调用必须位于词法 `unsafe` 上下文中。最清晰的写法是在 Lambda 内只包住危险调用；仓颉 1.0.5 也允许由包围 Lambda 定义的 `unsafe func` 提供该上下文，即使 Lambda 之后逃逸并在安全代码中调用。下面同时验证两种形式，前者更利于审计。

```toml cjtest=project id=examples.cffi.unsafe-lambda.language.cffi-unsafe-lambda file=cjpm.toml command=run timeout=120s requires=native-c
[package]
cjc-version = "1.0.5"
name = "cffi_unsafe_lambda"
version = "0.1.0"
output-type = "executable"

[ffi.c]
native = { path = "./libs/" }
```

本机侧源码 `native/native.c`：

```c cjtest=file project=examples.cffi.unsafe-lambda.language.cffi-unsafe-lambda file=native/native.c
#include <stdint.h>

#if defined(_WIN32)
#define CJ_EXPORT __declspec(dllexport)
#else
#define CJ_EXPORT __attribute__((visibility("default")))
#endif

CJ_EXPORT int64_t native_value(void) {
    return 42;
}
```

仓颉源码 `src/main.cj`：

```cangjie cjtest=file project=examples.cffi.unsafe-lambda.language.cffi-unsafe-lambda file=src/main.cj
package cffi_unsafe_lambda

foreign {
    func native_value(): Int64
}

func localizedReader(): () -> Int64 {
    return { =>
        unsafe { native_value() }
    }
}

unsafe func lexicalReader(): () -> Int64 {
    return { => native_value() }
}

main(): Unit {
    let localized = localizedReader()
    let lexical = unsafe { lexicalReader() }
    println("localized=${localized()}")
    println("lexical=${lexical()}")
}
```

预期标准输出：

```text cjtest=expect for=examples.cffi.unsafe-lambda.language.cffi-unsafe-lambda stream=stdout match=exact
localized=42
lexical=42
```
