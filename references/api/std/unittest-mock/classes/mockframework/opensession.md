<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.mockframework.opensession" parent="std.unittest.mock.class.mockframework" -->
# MockFramework.openSession

[← MockFramework](index.md)

## 签名

```cangjie role=signature
public static func openSession(name: String, sessionKind: MockSessionKind): Unit
```

打开一个新会话。

## 契约

功能：打开一个新会话。会话形成一个类似堆栈的结构。
会话关闭的顺序与开始时的顺序相反。
在给定会话期间创建的 `mock object` 只能在该会话或其任何内部会话内部访问。
每个会话都保留自己的调用日志，因此对最新打开会话内进行的调用执行任何验证， 只有在会议结束时才能验证期望。

参数：

- name: String - 会话的名称。
- sessionKind: MockSessionKind - 指定允许的桩类型。
