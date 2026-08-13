<!-- cj-doc kind="api-member" level="5" id="std.ast.func.parseprogram-tokens" parent="std.ast" -->
# parseProgram(Tokens)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func parseProgram(input: Tokens): Program
```

用于解析单个仓颉文件的源码，获取一个 Program 类型的节点。

## 契约

> **注意：**
>
> 仓颉宏展开后的代码不允许出现包的声明和包导入语句。使用该函数时，若输入的源码中包含包声明或包导入语句，输出的 Program 节点中也会包含（在 packageHeader 和 importLists 属性中），因此不能在宏函数中直接将该节点返回为 Tokens。

参数：

- input: Tokens - 待解析源码的词法单元。

返回值：

- Program - 一个 Program 类型的节点。

异常：

- ParseASTException - 当输入的 Tokens 类型无法构造为 Program 节点时，抛出异常，异常中包含报错提示信息。
