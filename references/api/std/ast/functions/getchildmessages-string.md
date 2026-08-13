<!-- cj-doc kind="api-member" level="5" id="std.ast.func.getchildmessages-string" parent="std.ast" -->
# getChildMessages(String)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func getChildMessages(children:String): ArrayList<MacroMessage>
```

获取特定内层宏发送的信息。

## 契约

> **注意：**
>
> 该函数只能作为函数被直接调用，不能作为赋值给变量，不能作为实参或返回值使用。

参数：

- children: String - 待接收信息的内层宏名称。

返回值：

- ArrayList\<MacroMessage> - 返回一组 MacroMessage 的对象。
