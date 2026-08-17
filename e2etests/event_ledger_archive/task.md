# 任务：event_ledger_archive

## 1. 目标

用仓颉 `1.1.3 (cjnative)` 实现一个可执行 cjpm 工程 `event_ledger_archive`：一个**确定性事件台账**，
把账目事件规范化、聚合、以流式 JSON 编码，再压缩、加校验和写入自描述二进制归档，并能读回、
校验完整性、精确分类损坏原因。

这不是玩具示例。评分依据是根目录冻结测试 `event_ledger_archive_test.cj` 的全部用例通过，
且 `cjpm build` / `cjpm test` / `cjpm run` 均无 warning。**不得修改冻结测试来迁就实现。**

## 2. 工程与环境

- 包名 `event_ledger_archive`，`output-type = "executable"`，`cjc-version = "1.1.3"`。
- 源码位于 `src/`，冻结测试文件放在 `src/event_ledger_archive_test.cj`。
- stdx 固定 `1.1.3.1`，用 Skill 的 `scripts/setup_stdx.py --project <工程根>` 安装并配置。
- 只导入实际使用的符号；1.1.3 不会因 `_` 前缀免除未使用告警。
- **禁止**：随机数、当前时间/日期、公网访问、依赖哈希遍历顺序的输出、修改冻结测试。
- 所有对外输出必须完全确定：同一输入在任意主机、任意次运行产生相同字节。

## 3. 必须自然使用的能力

泛型接口与泛型 enum；class / struct / `extend`；派生 `Equatable` / `Hashable` / `ToString`；
模式匹配与 `Option`；异常与 `Resource`；Unicode `Rune` 级与字符串级大小写、`Regex`；
`Decimal` / `BigInt` 与 `RoundingMode`；`ArrayList` / `HashMap` / `HashSet` / 排序；
可靠的并发同步或并发集合；`stdx.encoding.json.stream` 自定义读写、未知字段 `skip`、
`Option` 与数组的 Windows 兼容逐元素路径；Deflate/Zlib、SHA-256、Hex 与 Base64；
大端长度字段、`ByteBuffer`、文件保存/读取与损坏检测。

## 4. 错误类型

```cangjie
public open class LedgerException <: Exception          // init(message: String)
public class ArchiveCorruptException <: LedgerException // init(reason: String)
```

`ArchiveCorruptException.reason` 是**稳定机器可读标签**，不是本地化语句；
其 `message` 为 `"archive corrupt: ${reason}"`。

## 5. 泛型 enum `Validated<T>`

所有输入校验边界返回它，而不是抛异常：

```cangjie
public enum Validated<T> {
    | Valid(T)
    | Invalid(String)

    public func isValid(): Bool
    public func getOrThrow(): T                       // Invalid 抛 LedgerException("invalid value: ${reason}")
    public func reasonOr(fallback: String): String    // Valid 返回 fallback，Invalid 返回失败标签
    public func map<R>(transform: (T) -> R): Validated<R>  // 只变换 Valid，原样保留失败标签
}
```

## 6. 泛型接口 `Projection<R>`

对台账做一次与顺序无关的折叠：

```cangjie
public interface Projection<R> {
    func label(): String
    func seed(): R
    func absorb(accumulator: R, event: LedgerEvent): R
    func render(accumulator: R): String
}
```

## 7. 值类型

```cangjie
@Derive[Equatable, Hashable, ToString, Comparable]
@DeriveOrder[region, code]
public struct AccountRef {
    public let region: String   // 小写地区段，如 eu
    public let code: String     // 大写账号段，如 ACC42
    public init(region: String, code: String)
    public func render(): String   // "region:code"
}
```

比较顺序：先 `region` 再 `code`。派生 `toString()` 形如 `AccountRef(region: eu, code: ACC42)`。

```cangjie
@Derive[Equatable, Hashable, ToString]
public enum Priority { | Routine | Elevated | Urgent
    public func rank(): Int64                             // 0 / 1 / 2
    public func code(): String                            // "routine" / "elevated" / "urgent"
    public static func parse(token: String): Validated<Priority>  // 未知返回 Invalid("unknown-priority")
}
```

派生 `toString()` 形如 `Priority.Urgent`。

## 8. 金额 `Money`：Decimal / BigInt / RoundingMode

```cangjie
@Derive[Equatable, Hashable, ToString, Comparable]
public struct Money {
    public let minorUnits: BigInt          // 有符号最小单位数，120.50 即 12050
    public init(minorUnits: BigInt)
    public static const SCALE: Int32 = 2
    public static func zero(): Money
    public static func fromUnits(units: Int64): Money         // fromUnits(7) == 7.00
    public static func parse(text: String): Validated<Money>
    public func amount(): Decimal                             // 标度恒为 2 的精确值
    public func text(): String                                // 恒带两位小数
    public func plus(other: Money): Money
    public func negated(): Money
    public func isZero(): Bool
    public func sharePerPart(parts: Int64): Money
}
```

硬性要求：

- 浮点数**不得**参与任何金额路径。
- `parse` 用 `Decimal.tryParse` 保留失败（`Invalid("unparsable-amount")`），再以
  `RoundingMode.HalfEven` 归一到标度 2。因此 `parse("12.345").text() == "12.34"`，
  `parse("12.355").text() == "12.36"`，`parse("120.505").text() == "120.50"`。
- `text()` 恒为两位小数：`zero().text() == "0.00"`，`parse("-5").text() == "-5.00"`。
- `sharePerPart(parts)`：`parts <= 0` 抛 `LedgerException`；否则以 HalfEven、
  中间精度 18 位相除后归一到标度 2。`parse("10.00").sharePerPart(3).text() == "3.33"`。
  该函数不追踪余数，语义是"每份报价"而非无损拆分。
  注意精确的中点按 HalfEven 向偶数末位靠：`0.05 / 2 == 0.025` 得 `"0.02"`，
  而 `0.15 / 2 == 0.075` 得 `"0.08"`。这与 HalfUp 不同，不要按 HalfUp 预期结果。
- 比较顺序由 `minorUnits` 决定。派生 `toString()` 形如 `Money(minorUnits: 300)`。

## 9. 文本规范化与校验：Unicode 与 Regex

```cangjie
public func normalizeRegion(raw: String): String    // trim 后字符串级 toLower
public func normalizeCode(raw: String): String      // trim 后字符串级 toUpper
public func parseAccount(raw: String): Validated<AccountRef>
public func canonicalTag(raw: String): String
public func extractTags(memo: String): Array<String>
public func flipRuneCase(symbol: Rune): Rune
public func classifyRunes(text: String): RuneProfile
```

```cangjie
@Derive[Equatable, Hashable, ToString]
public struct RuneProfile {
    public let letters: Int64
    public let digits: Int64
    public let spaces: Int64
    public init(letters: Int64, digits: Int64, spaces: Int64)
    public func counted(): Int64      // 三类之和
}
```

规则：

- **大小写必须在字符串级施加**。Unicode 大小写映射会改变 Rune 数量：德语 `ß` 的字符串级
  大写是两个字符 `SS`，因此 `normalizeCode("stra\u{df}e") == "STRASSE"`。
- `flipRuneCase` 是**单 Rune 级**翻转，与字符串级不同：大写返回小写、小写返回大写、
  其他原样返回。单 Rune 无法表达 `ß` 的两字符大写，故 `flipRuneCase(r'\u{df}')` 返回
  `r'\u{df}'` 本身；`flipRuneCase(r'\u{c4}')`（`Ä`）返回 `r'\u{e4}'`（`ä`）。
- `parseAccount`：先 trim、按第一个 `:` 切分、左段小写化、右段大写化，再用正则
  `^(?<region>[a-z]{2})[:](?<code>[A-Z]{3}[0-9]{1,6})$` 校验。因此
  `" Eu:acc42 "` 与 `"eu:ACC42"` 都得到同一个 `AccountRef("eu", "ACC42")`。
  无 `:` 返回 `Invalid("missing-separator")`；正则不匹配返回 `Invalid("malformed-account")`。
- `canonicalTag`：字符串级小写；字母和数字保留，其余每段连续非字母数字折叠为单个 `-`；
  首尾不留 `-`。故 `canonicalTag("  Hello, W\u{f6}rld! ") == "hello-w\u{f6}rld"`，
  `canonicalTag("  EU  ") == "eu"`，`canonicalTag("---") == ""`。
- `extractTags`：用正则 `#([\p{L}\p{N}_-]+)` 按**首次出现顺序**取出 `#tag`，
  逐个 `canonicalTag`，丢弃规范化后为空的结果，不去重。
- `classifyRunes`：一趟统计字母、数字、空白三类 Rune；标点与符号不计入任一类，
  因此 `counted()` 可以小于输入的 Rune 长度。

## 10. 事件模型

```cangjie
public enum EventKind {
    | Credit(Money)
    | Debit(Money)
    | Transfer(AccountRef, Money)     // 参数顺序：对手方账户，金额
    | Note(String)

    public func tag(): String            // "credit" / "debit" / "transfer" / "note"
    public func balanceDelta(): Money    // 见下
}
```

`balanceDelta()`：`Credit` 为正；`Debit` 取负；`Transfer` 建模为转出，取负；`Note` 为零。

必须用 `extend EventKind <: ToString` 提供显示形式（不得写进 enum 声明体）：

```text
credit(120.50)   debit(20.25)   transfer(eu:ACC42,5.00)   note(some text)
```

```cangjie
public class LedgerEvent <: JsonSerializable & JsonDeserializable<LedgerEvent> & ToString {
    public let seq: Int64
    public let account: AccountRef
    public let kind: EventKind
    public let priority: Priority
    public let tags: Array<String>
    public let memo: Option<String>
    public init(seq: Int64, account: AccountRef, kind: EventKind,
                priority: Priority, tags: Array<String>, memo: Option<String>)
}
```

`toString()` 固定为（`memo` 为 `None` 时打印 `-`）：

```text
#<seq> <account.render()> <kind> <priority.code()> [<tags 以 , 连接>] <memo 或 ->
```

## 11. 流式 JSON 编解码

用 `stdx.encoding.json.stream` 自定义读写，**不得**改用 `JsonValue` 之类的 DOM 路径。

`Money` 与 `AccountRef` 的 JSON 能力必须由 `extend` 提供；
`Money` 序列化为 **JSON 字符串**以保住精确标度。

固定线格式（写入端字段顺序即下列顺序，紧凑无空格）：

```text
Money        "120.50"
AccountRef   {"region":"eu","code":"ACC42"}
EventKind    {"type":"credit","amount":"120.50"}
             {"type":"debit","amount":"20.25"}
             {"type":"transfer","amount":"5.00","counterparty":{"region":"eu","code":"ACC42"}}
             {"type":"note","text":"..."}
LedgerEvent  {"seq":1,"account":{...},"kind":{...},"priority":"routine","tags":["a","b"],"memo":null}
Envelope     {"schema":"event-ledger/1","events":[...],"annotation":null}
BatchNote    {"author":"oracle","comment":"deterministic demo batch"}
```

读取端必须满足：

- 每个字段名后**只消费一个完整值**；未识别字段一律 `skip()`，读者状态与 JSON 结构保持同步。
- `EventKind` 先收集全部已识别字段再按 `type` 派发，因此 `type` 可以出现在对象任意位置。
- `memo` / `annotation` 的 JSON `null` 读成 `None`，非 null 读成 `Some(...)`。
- **数组与 `Option` 走逐元素路径**：`tags`、`events` 用 `startArray` / `peek` / `endArray`
  逐项 `readValue<T>()`，不调用泛型数组反序列化。这是 Windows cjnative 1.1.3.1 的可移植写法。
- 缺失必填字段抛 `LedgerException`：`"event is missing '<name>'"`、
  `"kind '<k>' is missing 'amount'"`、`"kind 'transfer' is missing 'counterparty'"`、
  `"kind 'note' is missing 'text'"`、`"unknown kind '<k>'"`、`"bad amount '<t>': <reason>"`。
- `Envelope.fromJson` 校验 `schema`，不等于 `ENVELOPE_SCHEMA` 时抛
  `LedgerException("unsupported schema '<s>'")`。

```cangjie
public const ENVELOPE_SCHEMA = "event-ledger/1"

public class Envelope<M> <: JsonSerializable & JsonDeserializable<Envelope<M>>
        where M <: JsonSerializable & JsonDeserializable<M> {
    public let schema: String
    public let events: Array<LedgerEvent>
    public let annotation: Option<M>
    public init(schema: String, events: Array<LedgerEvent>, annotation: Option<M>)
}

public class BatchNote <: JsonSerializable & JsonDeserializable<BatchNote> & ToString {
    public let author: String
    public let comment: String
    public init(author: String, comment: String)
    // toString() == "${author}: ${comment}"
}

public func encodeJsonBytes<T>(value: T): Array<Byte> where T <: JsonSerializable
public func encodeJsonText<T>(value: T): String where T <: JsonSerializable
public func decodeJsonBytes<T>(data: Array<Byte>): T where T <: JsonDeserializable<T>
public func decodeJsonText<T>(text: String): T where T <: JsonDeserializable<T>
```

写入使用 `WriteConfig.compact`。

## 12. 二进制归档：大端长度、Deflate、SHA-256

帧布局（所有多字节整数**大端**，与主机字节序无关）：

```text
偏移 0     4 字节   魔数 "ELA1"
偏移 4     4 字节   大端 uint32：未压缩 JSON 长度
偏移 8     4 字节   大端 uint32：deflate 载荷长度
偏移 12    N 字节   raw-deflate 载荷（DeflateFormat，无 gzip 头）
偏移 12+N  32 字节  未压缩 JSON 的 SHA-256
```

摘要覆盖**未压缩**的 JSON，所以它证明的是语义内容，篡改与截断都能被发现。

```cangjie
public const ARCHIVE_MAGIC = "ELA1"
public const DIGEST_BYTES = 32
public const HEADER_BYTES = 12

@Derive[Equatable, Hashable, ToString]
public struct ArchiveHeader {
    public let rawLength: Int64
    public let payloadLength: Int64
    public init(rawLength: Int64, payloadLength: Int64)
}

public func writeBigEndianU32(sink: ByteBuffer, value: UInt32): Unit
public func readBigEndianU32(data: Array<Byte>, offset: Int64): UInt32
public func sha256(data: Array<Byte>): Array<Byte>
public func sha256Hex(data: Array<Byte>): String        // 小写 hex
public func sha256Base64(data: Array<Byte>): String
public func decodeHexDigest(text: String): Array<Byte>
public func deflateBytes(data: Array<Byte>): Array<Byte>
public func inflateBytes(data: Array<Byte>, expected: Int64): Array<Byte>
public func encodeFrame(raw: Array<Byte>): Array<Byte>
public func readHeader(frame: Array<Byte>): ArchiveHeader
public func decodeFrame(frame: Array<Byte>): Array<Byte>
public func encodeArchive<M>(envelope: Envelope<M>): Array<Byte>
public func decodeArchive<M>(frame: Array<Byte>): Envelope<M>
public func saveArchive<M>(path: String, envelope: Envelope<M>): String   // 返回 JSON 的 hex 摘要
public func loadArchive<M>(path: String): Envelope<M>
```

压缩必须用 `Resource`：

```cangjie
public class DeflateCollector <: Resource {
    public init()
    public func push(chunk: Array<Byte>): Unit    // 已关闭后 push 抛 LedgerException
    public func isClosed(): Bool
    public func close(): Unit                     // 幂等
    public func payload(): Array<Byte>            // 必要时先 close，再返回完整 deflate 载荷
}
```

deflate 尾部只有 `close()` 之后才完整，所以 `payload()` 先关闭流。该类型要能被
`try (c = DeflateCollector()) { ... }` 驱动，异常路径也释放原生压缩上下文。

## 13. 损坏分类

`decodeFrame` 的检查顺序与失败标签固定如下，`ArchiveCorruptException.reason` 取这些值：

| 顺序 | 条件 | reason |
|---|---|---|
| 1 | 总长 < `HEADER_BYTES + DIGEST_BYTES`，或读大端 u32 时不足 4 字节 | `truncated` |
| 2 | 前 4 字节不是 `ELA1` | `magic` |
| 3 | `HEADER_BYTES + payloadLength + DIGEST_BYTES != frame.size` | `payload-length` |
| 4 | 载荷不是合法 deflate 流（`ZlibException`） | `payload` |
| 5 | 解压结果长度 != 声明的 `rawLength` | `raw-length` |
| 6 | 未压缩 JSON 的 SHA-256 != 尾部 32 字节 | `digest` |

`decodeHexDigest` 另有两个标签：长度不是 32 字节为 `digest-length`，非法 hex 文本为
`digest-encoding`。

配套的分类函数（`ok` 表示帧完好）：

```cangjie
public func classifyFrame(frame: Array<Byte>): String
```

## 14. 台账与投影

```cangjie
public class EventLedger {
    public init()
    public prop size: Int64
    public func record(event: LedgerEvent): Unit
    public func bySequence(): Array<LedgerEvent>
    public func byPriority(): Array<LedgerEvent>
    public func byImpact(): Array<LedgerEvent>
    public func accountIndex(): HashMap<AccountRef, Array<Int64>>
    public func tagVocabulary(): HashSet<String>
    public func sortedTags(): Array<String>
    public func balanceOf(account: AccountRef): Money
    public func balances(): HashMap<AccountRef, Money>
    public func balanceReport(): Array<String>
    public func project<R>(projection: Projection<R>): String
    public func concurrentTagCounts(shards: Int64): ConcurrentTally
    public func toEnvelope<M>(annotation: Option<M>): Envelope<M>
    public static func fromEnvelope<M>(envelope: Envelope<M>): EventLedger
}
```

- 只追加。`record` 用 `HashSet<Int64>` 拒绝重复 `seq`，冲突抛
  `LedgerException("duplicate sequence <n>")`。
- `record` 存入前把 tags 逐个 `canonicalTag`、丢弃空串、**去重并升序排序**，
  于是相同标签集合总是产生相同序列化结果。
- `bySequence()`：按 `seq` 升序。
- `byPriority()`：先按 `seq` 升序，再以 `rank()` 稳定降序，故同级仍按 `seq` 升序。
- `byImpact()`：先按 `seq` 升序，再以 `balanceDelta()` 稳定降序。
- `accountIndex()`：每个账户对应升序的 `seq` 数组。
- `sortedTags()` 返回排序后的标签数组；`balanceReport()` 按账户排序，每行
  `region:code=amount`。二者都不得依赖哈希遍历顺序。
- `project` 返回 `"${label()}=${render(...)}"`，按 `seq` 升序折叠。

必须提供三个投影实现：

| 类型 | `label()` | 累加器 | `render()` |
|---|---|---|---|
| `NetBalanceProjection` | `net` | `Money` | `Money.text()` |
| `KindHistogramProjection` | `kinds` | `HashMap<String, Int64>` | 按键排序的 `k:n`，以 `\|` 连接 |
| `GrossVolumeProjection` | `gross` | `BigInt` | `BigInt.toString()` |

`GrossVolumeProjection` 累加 `balanceDelta().minorUnits` 的**绝对值**，用 `BigInt` 保证宽整数精确。

## 15. 并发统计

```cangjie
public class ConcurrentTally {
    public let shardMerged: HashMap<String, Int64>   // 由各分片映射按分片号升序合并
    public let mutexMerged: HashMap<String, Int64>   // 由工作线程在互斥锁下累加
    public let visitedEvents: Int64                  // 原子计数
    public init(shardMerged: HashMap<String, Int64>,
                mutexMerged: HashMap<String, Int64>,
                visitedEvents: Int64)
    public func isConsistent(): Bool                 // 两份统计逐键一致
    public func report(): Array<String>              // shardMerged 的排序 "tag=count" 行
}
```

`concurrentTagCounts(shards)` 用 `shards` 个线程统计标签出现次数，`shards <= 0` 抛
`LedgerException("shard count must be positive")`。三种同步机制协同，且结果与线程交错无关：

- 每个工作线程先折叠**私有** `HashMap`，再以自己的分片号为键，用
  `ConcurrentHashMap.addIfAbsent` **一次性**发布，因此发布是原子且无竞争的；
  重复发布抛 `LedgerException("shard <n> published twice")`。
- 一个 `Mutex` 保护第二份由工作线程直接合并的统计。
- 一个 `AtomicInt64` 统计访问过的事件数。

主线程按分片号升序合并各分片映射。注意 1.1.3 的 `ConcurrentHashMap` **没有** CAS 形式的
`replace(key, old, new)`，因此不要用"读-改-写"循环累加同一个键。

`visitedEvents` 必须等于 `size`；`isConsistent()` 必须为 `true`；`report()` 与串行统计一致。

## 16. 入口

```cangjie
public const DEMO_NOTE_TEXT = "Stra\u{df}e audit"
public func buildDemoLedger(): EventLedger
public func demoNote(): BatchNote                    // BatchNote("oracle", "deterministic demo batch")
public func demoReport(): Array<String>
```

`buildDemoLedger()` 构造固定的 4 个事件：

| seq | 账户入参 | 事件 | 优先级 | tags 入参 | memo |
|---|---|---|---|---|---|
| 1 | `" Eu:acc42 "` | `Credit(parse("120.505"))` | `Routine` | `["Payroll", "  EU  "]` | `Some("initial #payroll funding")` |
| 2 | `" Eu:acc42 "` | `Debit(parse("20.25"))` | `Elevated` | `["Fees"]` | `None` |
| 3 | `"us:ACC7"` | `Transfer(eu, fromUnits(5))` | `Urgent` | `["Rebalance", "eu"]` | `Some("cross-region #rebalance step")` |
| 4 | `"us:ACC7"` | `Note(DEMO_NOTE_TEXT)` | `Routine` | `[]` | `None` |

`demoReport()` 返回报告行；`main(): Unit` 逐行 `println`，输出完全确定。
报告须覆盖：事件数、`byPriority()` 各行、`balanceReport()`、`sortedTags()`、三个投影、
并发统计、JSON 字节数与 hex 摘要、帧长度与压缩效果、还原一致性、写盘/读回、
以及若干损坏分类。写盘用相对路径 `event-ledger-demo.ela`，读回后删除，不留残留文件。

固定的可核对量（由第 8、9、14 节规则推出）：

- `demoReport()` 第一行为 `events=4`。
- `balanceReport()` 为 `["eu:ACC42=100.25", "us:ACC7=-5.00"]`。
  账户 1 收 120.50、付 20.25 得 100.25；账户 2 转出 5.00 得 -5.00。
- `sortedTags()` 为 `["eu", "fees", "payroll", "rebalance"]`。
- `net=95.25`，`kinds=credit:1|debit:1|note:1|transfer:1`，`gross=14575`。

`main` 必须逐行输出以下黄金文本（末尾保留换行）。其中压缩后长度是本题固定的
stdx 1.1.3.1 / Windows x64 环境产物；不得从隐藏哈希猜测措辞：

```text
events=4
event #3 us:ACC7 transfer(eu:ACC42,5.00) urgent [eu,rebalance] cross-region #rebalance step
event #2 eu:ACC42 debit(20.25) elevated [fees] -
event #1 eu:ACC42 credit(120.50) routine [eu,payroll] initial #payroll funding
event #4 us:ACC7 note(Straße audit) routine [] -
balance eu:ACC42=100.25
balance us:ACC7=-5.00
tags=eu,fees,payroll,rebalance
net=95.25
kinds=credit:1|debit:1|note:1|transfer:1
gross=14575
tally consistent=true visited=4
tally eu=2,fees=1,payroll=1,rebalance=1
json bytes=785
json sha256=8e3c73937aaaeea083ef28e6910fac687ec38833258168af68dac41387b2b163
frame bytes=373 raw=785 payload=329
frame compressed=true
restored events=4 identical=true
restored note=oracle: deterministic demo batch
saved sha256=8e3c73937aaaeea083ef28e6910fac687ec38833258168af68dac41387b2b163
reloaded events=4
damage magic=magic
damage cut=payload-length
damage digest=digest
damage intact=ok
```

## 17. 验收

```text
python <skill>/scripts/setup_stdx.py --project <工程根>
cjpm clean && cjpm build && cjpm test && cjpm run
python accept.py --project <工程根> --skill-root <skill-root>
```

- 冻结测试 `event_ledger_archive_test.cj` 全部用例通过，`cjpm test` 在 90 秒内完成。
- `cjpm build` / `cjpm test` / `cjpm run` 输出 **0 warning**。
- `cjpm run` 输出逐字节确定。
- 测试不依赖任何哈希遍历顺序，不使用随机、当前时间或网络。
