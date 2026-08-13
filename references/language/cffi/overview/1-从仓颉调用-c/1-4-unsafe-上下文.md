<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.1-从仓颉调用-c.1-4-unsafe-上下文" parent="language.cffi.overview.1-从仓颉调用-c" -->
# 1.4 unsafe 上下文

[← 1. 从仓颉调用 C](index.md)

标记不安全的 C 互操作代码，可修饰函数、表达式或作用域块：

```cangjie cjtest=syntax id=syntax-ae7c2149e6-1 form=unit
foreign func rand(): Int32

// 修饰函数
unsafe func doUnsafeWork() {
    return rand()
}

// 修饰作用域块
main() {
    unsafe {
        let r = doUnsafeWork() // unsafe 传染性
        println(r)
    }
    // 修饰单个表达式
    let r = unsafe { rand() }
    println(r)
}
```

调用以下函数须在 `unsafe` 上下文中：`foreign` 函数、`@C` 函数、`CFunc` 变量、`unsafe` 修饰的函数。

> **注意：** Lambda 中的危险调用必须位于词法 `unsafe` 上下文。优先在 Lambda 内用最小的 `unsafe {}` 块包住调用，便于定位和审计。
>
> 仓颉 1.0.5 也接受在包围 Lambda 定义的 `unsafe func` 或 `unsafe {}` 中直接调用；该 Lambda 即使随后逃逸到安全代码中也能被调用。因此“Lambda 内层 `unsafe {}`”是推荐的局部边界，不是唯一可编译形式。

## 已验证的 Lambda `unsafe` 词法边界

Lambda 体内的 `foreign` 调用必须位于词法 `unsafe` 上下文中。最清晰的写法是在 Lambda 内只包住危险调用；仓颉 1.0.5 也允许由包围 Lambda 定义的 `unsafe func` 提供该上下文，即使 Lambda 之后逃逸并在安全代码中调用。下面同时验证两种形式，前者更利于审计。

```toml cjtest=project id=language.cffi-unsafe-lambda file=cjpm.toml command=run timeout=120s requires=native-c
[package]
cjc-version = "1.0.5"
name = "cffi_unsafe_lambda"
version = "0.1.0"
output-type = "executable"

[ffi.c]
native = { path = "./libs/" }
```

```c cjtest=file project=language.cffi-unsafe-lambda file=native/native.c
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

```cangjie cjtest=file project=language.cffi-unsafe-lambda file=src/main.cj
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

```text cjtest=expect for=language.cffi-unsafe-lambda stream=stdout match=exact
localized=42
lexical=42
```
