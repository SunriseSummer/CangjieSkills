<!-- cj-doc kind="api-member" level="6" id="std.core.class.stringbuilder.appendfromutf8unchecked" parent="std.core.class.stringbuilder" -->
# StringBuilder.appendFromUtf8Unchecked

[← StringBuilder](index.md)

## 签名

```cangjie role=signature
public unsafe func appendFromUtf8Unchecked(arr: Array<Byte>): Unit
```

在 StringBuilder 末尾插入参数 `arr` 指向的字节数组。

## 契约

相较于 `appendFromUtf8` 函数，它并没有针对于字节数组进行 UTF-8 相关规则的检查，所以它所构建的字符串并不一定保证是合法的，甚至出现非预期的异常，如果不是某些场景下的速度考虑，请优先使用安全的 `appendFromUtf8` 函数。

参数：

- arr: Array\<Byte> - 插入的字节数组。
