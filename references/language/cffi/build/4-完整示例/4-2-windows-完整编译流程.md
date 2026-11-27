<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.build.4-完整示例.4-2-windows-完整编译流程" parent="language.cffi.build.4-完整示例" -->
# 4.2 Windows 完整编译流程

[← 4. 完整示例](index.md)

先用 `clang -shared -Wall -Wextra -Werror -fstack-protector-all` 独立构建 C；Windows cjpm 链接使用 `libnative.dll`，运行期同时放置 `native.dll`。

```shell
# 1. 编写 C 代码 (native.c)，导出函数加 __declspec(dllexport) 修饰
# 2. 编译 C 代码为动态库
clang -shared -Wall -Wextra -Werror -fstack-protector-all native.c -o libnative.dll

# 3.1 使用 cjc 编译
cjc -L . -l native main.cj -o main.exe
./main.exe

# 3.2 基于 cjpm 项目构建
# 将 libnative.dll 放到 libs/ 目录下（用于编译链接）
# 基于前面提到的运行问题，libs/ 下还应放一个名为 native.dll 的副本
# 在 cjpm.toml 中配置 [ffi.c] native = { path = "./libs/" }
# 构建，依赖 libnative.dll
cjpm build
# 运行，依赖 native.dll
cjpm run
```

## 已验证的 C 数组互操作工程

`[ffi.c]` 中的键 `native` 对应 `libnative` 动态库。把仓颉数组交给 C 时，必须在 `unsafe` 中取得裸数据句柄，并保证每次 `acquireArrayRawData` 都与 `releaseArrayRawData` 配对；句柄有效期间不得改变数组布局。

`cjpm` 只链接已经生成的本机库，不编译下面的 C 源码。修改 C 后须先独立执行严格构建：Windows 使用 `clang -shared -Wall -Wextra -Werror -fstack-protector-all native/native.c -o libs/libnative.dll`，Linux/macOS 另加 `-fPIC` 并输出对应的 `libnative.so`/`libnative.dylib`；随后再运行 `cjpm build/test/run`。严格构建不能以仓颉测试通过代替。

```toml cjtest=project id=language.cffi-native-array file=cjpm.toml command=run timeout=120s requires=native-c
[package]
cjc-version = "1.1.3"
name = "cffi_native_array"
version = "0.1.0"
output-type = "executable"

[ffi.c]
native = { path = "./libs/" }
```

```c cjtest=file project=language.cffi-native-array file=native/native.c
#include <stdint.h>

#if defined(_WIN32)
#define CJ_EXPORT __declspec(dllexport)
#else
#define CJ_EXPORT __attribute__((visibility("default")))
#endif

CJ_EXPORT int64_t scale_and_sum(int64_t* values, int32_t length, int64_t factor) {
    int64_t total = 0;
    for (int32_t index = 0; index < length; ++index) {
        values[index] *= factor;
        total += values[index];
    }
    return total;
}
```

```cangjie cjtest=file project=language.cffi-native-array file=src/main.cj
package cffi_native_array

foreign {
    func scale_and_sum(values: CPointer<Int64>, length: Int32, factor: Int64): Int64
}

main(): Unit {
    var values: Array<Int64> = [2, 4, 6, 8]
    var total: Int64 = 0
    unsafe {
        var handle = acquireArrayRawData(values)
        total = scale_and_sum(handle.pointer, Int32(values.size), 3)
        releaseArrayRawData(handle)
    }
    println("total=${total}|first=${values[0]}|last=${values[3]}")
}
```

```text cjtest=expect for=language.cffi-native-array stream=stdout match=exact
total=60|first=6|last=24
```
