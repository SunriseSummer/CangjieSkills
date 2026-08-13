<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.websocket.upgradefromserver" parent="stdx.net.http.class.websocket" -->
# WebSocket.upgradeFromServer

[← WebSocket](index.md)

## 签名

```cangjie role=signature
public static func upgradeFromServer(ctx: HttpContext, subProtocols!: ArrayList<String> = ArrayList<String>(),
                                        origins!: ArrayList<String> = ArrayList<String>(),
                                        userFunc!:(HttpRequest) -> HttpHeaders = {_: HttpRequest => HttpHeaders()}): WebSocket
```

提供服务端升级到 WebSocket 协议的函数，通常在 handler 中使用。

## 契约

服务端升级的流程为：收到客户端发来的升级请求，验证请求，如果验证通过，则回复 101 响应并返回 WebSocket 对象用于 WebSocket 通讯。

- 用户通过 subProtocols，origins 参数来配置其支持的 subprotocol 和 origin 白名单，subProtocols 如果不设置，则表示不支持子协议，origins 如果不设置，则表示接受所有 origin 的握手请求；
- 用户通过 userFunc 来自定义处理升级请求的行为，如处理 cookie 等，传入的 userFunc 要求返回一个 HttpHeaders 对象，其会通过 101 响应回给客户端（升级失败的请求则不会）；
- 暂不支持 WebSocket 的 extensions，因此如果握手过程中出现 extensions 协商则会抛 WebSocketException；
- 只支持 HTTP1_1 和 HTTP2_0 向 WebSocket 升级。

参数：

- ctx: HttpContext - Http 请求上下文，将传入给 handler 的直接传给 upgradeFromServer 即可。
- subProtocols!: ArrayList\<String> - 用户配置的子协议列表，默认值为空，表示不支持。如果用户配置了，则会选取升级请求中最靠前的作为升级后的 WebSocket 的子协议，用户可通过调用返回的 WebSocket 的 subProtocol 查看子协议。
- origins!: ArrayList\<String> - 用户配置的同意握手的 origin 的白名单，如果不配置，则同意来自所有 origin 的握手，如果配置了，则只接受来自配置 origin 的握手。
- userFunc!: (HttpRequest) ->HttpHeaders - 用户配置的自定义处理升级请求的函数，该函数返回一个 HttpHeaders。

返回值：

- WebSocket - 升级得到的 WebSocket 实例。
