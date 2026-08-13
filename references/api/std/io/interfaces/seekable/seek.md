<!-- cj-doc kind="api-member" level="6" id="std.io.interface.seekable.seek" parent="std.io.interface.seekable" -->
# Seekable.seek

[← Seekable](index.md)

## 签名

```cangjie role=signature
func seek(sp: SeekPosition): Int64
```

移动光标到指定的位置。

## 契约

参数：

- sp: SeekPosition - 指定光标移动后的位置。

返回值：

- Int64 - 返回流中数据的起点到移动后位置的偏移量（以字节为单位）。
