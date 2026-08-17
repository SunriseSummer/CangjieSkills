<!-- cj-doc kind="api-member" level="6" id="std.ast.class.resumeexpr.init" parent="std.ast.class.resumeexpr" -->
# ResumeExpr.init

[← ResumeExpr](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public init()
```

构造一个默认的 ResumeExpr 对象。

## 重载 2

### 签名

```cangjie role=signature
public init(inputs: Tokens)
```

从词法单元流构造一个 ResumeExpr 对象。

**注意:**
>
编译时需要添加 `--experimental` 和 `--enable-eh` 编译选项以支持 `Effect Handlers` 特性。

## 参数

- inputs: Tokens — 要解析为 ResumeExpr 节点的词法单元集合。

## 异常

- ASTException — 当输入的 Tokens 无法解析为 ResumeExpr 节点，或编译未开启 `Effect Handlers` 实验特性时抛出。

