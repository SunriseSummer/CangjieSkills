<!-- cj-doc kind="api-member" level="6" id="std.io.class.bytebuffer.seek" parent="std.io.class.bytebuffer" -->
# ByteBuffer.seek

[← ByteBuffer](index.md)

## 签名

```cangjie role=signature
public func seek(sp: SeekPosition): Int64
```

将光标跳转到指定位置。

## 契约

> **说明：**
>
> - 指定的位置不能位于流中数据头部之前。
> - 指定位置可以超过流中数据末尾。

参数：

- sp: SeekPosition - 指定光标跳转后的位置。

返回值：

- Int64 - 流中数据的头部到跳转后位置的偏移量（以字节为单位）。

异常：

- IOException - 当指定的位置位于流中数据头部之前时，抛出异常。
