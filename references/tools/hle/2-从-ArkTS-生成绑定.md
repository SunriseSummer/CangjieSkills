<!-- cj-doc kind="guide-leaf" level="4" id="tools.hle.2-从-ArkTS-生成绑定" parent="tools.hle" -->
# 2. 从 ArkTS 生成绑定

[← HLE](index.md)

ArkTS 模式接受 `.d.ts` 或 `.d.ets`。`-r` 指向 TypeScript 编译器，`-j` 指向 SDK 的 `analysis.js`；`--lib` 用于三方库代码生成。

```bash
hle -i /work/api.d.ts -r /work/node_modules/typescript \
  -j ${CANGJIE_HOME}/tools/dtsparser/analysis.js \
  --module-name=ark_api -o /work/generated
```

除仓颉胶水代码外，此模式还生成描述 ArkTS 声明的 JSON。把生成目录作为派生代码管理；输入声明或 HLE 版本变化后重新生成，并对公开绑定做编译验证。
