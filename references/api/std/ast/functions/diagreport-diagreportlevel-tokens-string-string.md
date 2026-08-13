<!-- cj-doc kind="api-member" level="5" id="std.ast.func.diagreport-diagreportlevel-tokens-string-string" parent="std.ast" -->
# diagReport(DiagReportLevel, Tokens, String, String)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func diagReport(level: DiagReportLevel, tokens: Tokens, message: String, hint: String): Unit
```

报错接口，在编译过程的宏展开阶段输出错误提示信息，支持 `WARNING` 和 `ERROR` 两个等级的报错。

## 契约

> **注意：**
>
> - 该接口在 错误等级为 `ERROR` 时会终止编译过程，但不会终止宏展开过程，建议用户调用接口后直接 return 或者抛出异常来终止宏展开过程。
> - 该接口会按照 cjc 标准报错的接口，将传入的 tokens 所在行的代码列出，并对 tokens 的内容用波浪线进行标注， message 信息将展示在首行， hint 信息将紧跟波浪线进行展示。
> - 报错引用的源码内容目前仅依据第一个 Token 的开始位置和最后一个 Token 的结束位置确定，不校验中间 Token 位置信息的一致性。
> - 该接口在非宏展开过程中调用无效，参见示例代码。

参数：

- level: DiagReportLevel - 报错信息等级。
- tokens: Tokens - 报错信息中所引用源码内容对应的 Tokens。
- message: String - 报错的主信息。
- hint: String - 辅助提示信息。

异常：

- ASTException - 当输入的 Tokens 存在以下错误时，抛出异常。

    - 输入的 Tokens 为空；
    - 输入的 Tokens 中的 Token 来自于不同的源文件；
    - 输入的 Tokens 中首位 Token 位置早于末位 Token 位置；
    - 输入的 Tokens 中的 Token 位置范围超出了宏调用的位置范围。
