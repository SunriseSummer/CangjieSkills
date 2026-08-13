<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.struct.httpstatuscode" parent="stdx.net.http" -->
# HttpStatusCode

[← stdx.net.http](../../index.md)

`HttpStatusCode`

用来表示网页服务器超文本传输协议响应状态的 3 位数字代码。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`STATUS_ACCEPTED: UInt16 = 202`](field-status_accepted.md) | 服务器已接受请求，但尚未处理。 |
| [`STATUS_ALREADY_REPORTED: UInt16 = 208`](field-status_already_reported.md) | 消息体将是一个 XML 消息。 |
| [`STATUS_BAD_GATEWAY: UInt16 = 502`](field-status_bad_gateway.md) | 作为网关或者代理工作的服务器尝试执行请求时，从上游服务器接收到无效的响应。 |
| [`STATUS_BAD_REQUEST: UInt16 = 400`](field-status_bad_request.md) | 语义有误，当前请求无法被服务器理解；或请求参数有误。 |
| [`STATUS_CONFLICT: UInt16 = 409`](field-status_conflict.md) | 由于和被请求的资源的当前状态之间存在冲突，请求无法完成。 |
| [`STATUS_CONTINUE: UInt16 = 100`](field-status_continue.md) | 这个临时响应是用来通知客户端它的部分请求已经被服务器接收，且仍未被拒绝。 |
| [`STATUS_CREATED: UInt16 = 201`](field-status_created.md) | 请求已经被实现，而且有一个新的资源已经依据请求的需要而建立，且其 URI 已经随 Location 头信息返回。 |
| [`STATUS_EARLY_HINTS: UInt16 = 103`](field-status_early_hints.md) | 提前预加载 (css、js) 文档。 |
| [`STATUS_EXPECTATION_FAILED: UInt16 = 417`](field-status_expectation_failed.md) | 服务器无法满足 Expect 的请求头信息。 |
| [`STATUS_FAILED_DEPENDENCY: UInt16 = 424`](field-status_failed_dependency.md) | 由于之前的某个请求发生的错误，导致当前请求失败。 |
| [`STATUS_FORBIDDEN: UInt16 = 403`](field-status_forbidden.md) | 服务器已经理解请求，但是拒绝执行。 |
| [`STATUS_FOUND: UInt16 = 302`](field-status_found.md) | 临时移动。 |
| [`STATUS_GATEWAY_TIMEOUT: UInt16 = 504`](field-status_gateway_timeout.md) | 从上游服务器（URI 标识出的服务器，例如 HTTP、FTP、LDAP）或者辅助服务器（例如 DNS）收到响应超时。 |
| [`STATUS_GONE: UInt16 = 410`](field-status_gone.md) | 被请求的资源在服务器上已经不再可用，而且没有任何已知的转发地址。 |
| [`STATUS_HTTP_VERSION_NOT_SUPPORTED: UInt16 = 505`](field-status_http_version_not_supported.md) | 服务器不支持，或者拒绝支持在请求中使用的 HTTP 版本。 |
| [`STATUS_IM_USED: UInt16 = 226`](field-status_im_used.md) | 服务器已完成对资源的请求，并且响应是应用于当前实例的一个或多个实例操作的结果的表示。 |
| [`STATUS_INSUFFICIENT_STORAGE: UInt16 = 507`](field-status_insufficient_storage.md) | 服务器无法存储完成请求所必须的内容。 |
| [`STATUS_INTERNAL_SERVER_ERROR: UInt16 = 500`](field-status_internal_server_error.md) | 服务器遇到了一个未曾预料的状况，导致了它无法完成对请求的处理。 |
| [`STATUS_LENGTH_REQUIRED: UInt16 = 411`](field-status_length_required.md) | 服务器拒绝在没有定义 Content-Length 头的情况下接受请求。 |
| [`STATUS_LOCKED: UInt16 = 423`](field-status_locked.md) | 当前资源被锁定。 |
| [`STATUS_LOOP_DETECTED: UInt16 = 508`](field-status_loop_detected.md) | 服务器在处理请求时检测到无限递归。 |
| [`STATUS_METHOD_NOT_ALLOWED: UInt16 = 405`](field-status_method_not_allowed.md) | 请求行中指定的请求函数不能被用于请求响应的资源。 |
| [`STATUS_MISDIRECTED_REQUEST: UInt16 = 421`](field-status_misdirected_request.md) | 请求被指向到无法生成响应的服务器。 |
| [`STATUS_MOVED_PERMANENTLY: UInt16 = 301`](field-status_moved_permanently.md) | 永久移动。 |
| [`STATUS_MULTIPLE_CHOICES: UInt16 = 300`](field-status_multiple_choices.md) | 被请求的资源有一系列可供选择的回馈信息，每个都有自己特定的地址和浏览器驱动的商议信息。 |
| [`STATUS_MULTI_STATUS: UInt16 = 207`](field-status_multi_status.md) | DAV 绑定的成员已经在（多状态）响应之前的部分被列举，且未被再次包含。 |
| [`STATUS_NETWORK_AUTHENTICATION_REQUIRED: UInt16 = 511`](field-status_network_authentication_required.md) | 要求网络认证。 |
| [`STATUS_NON_AUTHORITATIVE_INFO: UInt16 = 203`](field-status_non_authoritative_info.md) | 服务器已成功处理了请求。 |
| [`STATUS_NOT_ACCEPTABLE: UInt16 = 406`](field-status_not_acceptable.md) | 请求的资源的内容特性无法满足请求头中的条件，因而无法生成响应实体。 |
| [`STATUS_NOT_EXTENDED: UInt16 = 510`](field-status_not_extended.md) | 获取资源所需要的策略并没有被满足。 |
| [`STATUS_NOT_FOUND: UInt16 = 404`](field-status_not_found.md) | 请求失败，请求所希望得到的资源未被在服务器上发现。 |
| [`STATUS_NOT_IMPLEMENTED: UInt16 = 501`](field-status_not_implemented.md) | 服务器不支持当前请求所需要的某个功能。 |
| [`STATUS_NOT_MODIFIED: UInt16 = 304`](field-status_not_modified.md) | 请求的资源未修改，服务器返回此状态码时，不会返回任何资源。 |
| [`STATUS_NO_CONTENT: UInt16 = 204`](field-status_no_content.md) | 服务器成功处理，但未返回内容。 |
| [`STATUS_OK: UInt16 = 200`](field-status_ok.md) | 请求已经成功，请求所希望的响应头或数据体将随此响应返回。 |
| [`STATUS_PARTIAL_CONTENT: UInt16 = 206`](field-status_partial_content.md) | 服务器已经成功处理了部分 GET 请求。 |
| [`STATUS_PAYMENT_REQUIRED: UInt16 = 402`](field-status_payment_required.md) | 为了将来可能的需求而预留的状态码。 |
| [`STATUS_PERMANENT_REDIRECT: UInt16 = 308`](field-status_permanent_redirect.md) | 请求和所有将来的请求应该使用另一个 URI。 |
| [`STATUS_PRECONDITION_FAILED: UInt16 = 412`](field-status_precondition_failed.md) | 服务器在验证在请求的头字段中给出先决条件时，没能满足其中的一个或多个。 |
| [`STATUS_PRECONDITION_REQUIRED: UInt16 = 428`](field-status_precondition_required.md) | 客户端发送 HTTP 请求时，必须要满足的一些预设条件。 |
| [`STATUS_PROCESSING: UInt16 = 102`](field-status_processing.md) | 处理将被继续执行。 |
| [`STATUS_PROXY_AUTH_REQUIRED: UInt16 = 407`](field-status_proxy_auth_required.md) | 必须在代理服务器上进行身份验证。 |
| [`STATUS_REQUESTED_RANGE_NOT_SATISFIABLE: UInt16 = 416`](field-status_requested_range_not_satisfiable.md) | 客户端请求的范围无效。 |
| [`STATUS_REQUEST_CONTENT_TOO_LARGE: UInt16 = 413`](field-status_request_content_too_large.md) | 请求提交的实体数据大小超过了服务器愿意或者能够处理的范围。 |
| [`STATUS_REQUEST_HEADER_FIELDS_TOO_LARGE: UInt16 = 431`](field-status_request_header_fields_too_large.md) | 请求头字段太大。 |
| [`STATUS_REQUEST_TIMEOUT: UInt16 = 408`](field-status_request_timeout.md) | 请求超时。 |
| [`STATUS_REQUEST_URI_TOO_LONG: UInt16 = 414`](field-status_request_uri_too_long.md) | 求的 URI 长度超过了服务器能够解释的长度。 |
| [`STATUS_RESET_CONTENT: UInt16 = 205`](field-status_reset_content.md) | 服务器成功处理了请求，且没有返回任何内容，希望请求者重置文档视图。 |
| [`STATUS_SEE_OTHER: UInt16 = 303`](field-status_see_other.md) | 对应当前请求的响应可以在另一个 URL 上被找到，而且客户端应当采用 GET 的方式访问那个资源。 |
| [`STATUS_SERVICE_UNAVAILABLE: UInt16 = 503`](field-status_service_unavailable.md) | 临时的服务器维护或者过载。 |
| [`STATUS_SWITCHING_PROTOCOLS: UInt16 = 101`](field-status_switching_protocols.md) | 服务器已经理解了客户端的请求，并将通过 Upgrade 消息头通知客户端采用不同的协议来完成这个请求。 |
| [`STATUS_TEAPOT: UInt16 = 418`](field-status_teapot.md) | 服务端无法处理请求，一个愚弄客户端的状态码，被称为“我是茶壶”错误码，不应被认真对待。 |
| [`STATUS_TEMPORARY_REDIRECT: UInt16 = 307`](field-status_temporary_redirect.md) | 临时重定向。 |
| [`STATUS_TOO_EARLY: UInt16 = 425`](field-status_too_early.md) | 服务器不愿意冒风险来处理该请求。 |
| [`STATUS_TOO_MANY_REQUESTS: UInt16 = 429`](field-status_too_many_requests.md) | 请求过多。 |
| [`STATUS_UNAUTHORIZED: UInt16 = 401`](field-status_unauthorized.md) | 当前请求需要用户验证。 |
| [`STATUS_UNAVAILABLE_FOR_LEGAL_REASONS: UInt16 = 451`](field-status_unavailable_for_legal_reasons.md) | 该请求因法律原因不可用。 |
| [`STATUS_UNPROCESSABLE_ENTITY: UInt16 = 422`](field-status_unprocessable_entity.md) | 请求格式正确，但是由于含有语义错误，无法响应。 |
| [`STATUS_UNSUPPORTED_MEDIA_TYPE: UInt16 = 415`](field-status_unsupported_media_type.md) | 服务器无法处理请求附带的媒体格式。 |
| [`STATUS_UPGRADE_REQUIRED: UInt16 = 426`](field-status_upgrade_required.md) | 服务器拒绝处理客户端使用当前协议发送的请求，但是可以接受其使用升级后的协议发送的请求。 |
| [`STATUS_USE_PROXY: UInt16 = 305`](field-status_use_proxy.md) | 使用代理，所请求的资源必须通过代理访问。 |
| [`STATUS_VARIANT_ALSO_NEGOTIATES: UInt16 = 506`](field-status_variant_also_negotiates.md) | 服务器存在内部配置错误。 |
