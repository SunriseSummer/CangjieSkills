<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.build.3-基于-cjpm-项目编译-推荐.3-5-不同平台的-cjpm-toml-配置" parent="language.cffi.build.3-基于-cjpm-项目编译-推荐" -->
# 3.5 不同平台的 cjpm.toml 配置

[← 3. 基于 cjpm 项目编译（推荐）](index.md)

当需要区分不同目标平台的库路径时，可使用 `[target]` 节：

**Linux x86_64**：

```toml
[ffi.c]
native = { path = "./libs/linux_x86_64/" }
```

**macOS aarch64**：

```toml
[ffi.c]
native = { path = "./libs/macos_aarch64/" }
```

**Windows x86_64**：

```toml
[ffi.c]
native = { path = ".\\libs\\windows_x86_64\\" }
```
