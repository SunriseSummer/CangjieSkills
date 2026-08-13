<!-- cj-doc kind="api-member" level="7" id="std.io.class.bufferedinputstream.seek" parent="std.io.class.bufferedinputstream.extension.extend-t-bufferedinputstream-t-seekable-where-t-seekable" -->
# BufferedInputStream<T> where T <: InputStream.seek

[← extend<T> BufferedInputStream<T> <: Seekable where T <: Seekable](extensions/extend-t-bufferedinputstream-t-seekable-where-t-seekable.md)

## 签名

```cangjie role=signature
public func seek(sp: SeekPosition): Int64
```

移动光标到指定的位置。

## 契约

> **说明：**
>
> - 指定的位置不能位于流中数据头部之前。
> - 指定位置可以超过流中数据末尾。
> - 调用该函数会先清空缓存区，再移动光标的位置。

参数：

- sp: SeekPosition - 指定光标移动后的位置。

返回值：

- Int64 - 返回流中数据的起点到移动后位置的偏移量（以字节为单位）。

异常：

- IOException - 当指定的位置位于流中数据头部之前时，抛出异常。
