<!-- cj-doc kind="api-member" level="6" id="stdx.effect.class.command.defaultimpl" parent="stdx.effect.class.command" -->
# Command<Res>.defaultImpl

[← Command<Res>](index.md)

## 签名

```cangjie role=signature
public open func defaultImpl(): Res
```

没有匹配 handler 时执行默认处理。子类可重写该方法提供确定结果；基类实现抛出 `UnhandledCommandException`。

## 返回值

- Res - 效应的默认结果。

## 异常

- UnhandledCommandException - 子类未重写默认实现，且调用点没有匹配 handler。

