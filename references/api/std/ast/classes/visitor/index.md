<!-- cj-doc kind="api-type" level="5" id="std.ast.class.visitor" parent="std.ast" -->
# Visitor

[← std.ast](../../index.md)

`abstract Visitor`

一个抽象类，其内部默认定义了访问不同类型 AST 节点访问（`visit`）函数。

## 方法

| 签名 | 功能 |
|---|---|
| [`breakTraverse(): Unit`](breaktraverse.md) | 用于重写 `visit` 函数中，通过调用该函数来终止继续遍历子节点的行为。 |
| [`protected needBreakTraverse(): Bool`](needbreaktraverse.md) | 用于判断是否需要停止遍历。 |
| [`protected open visit(_: Annotation): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Argument): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ArrayLiteral): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: AsExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: AssignExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: BinaryExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Block): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Body): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: CallExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ClassDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ConstPattern): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Constructor): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Decl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: DoWhileExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: EnumDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: EnumPattern): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ExceptTypePattern): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Expr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ExtendDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ForInExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: FuncDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: FuncParam): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: FuncType): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: GenericConstraint): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: GenericParam): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: IfExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ImportContent): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ImportList): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: IncOrDecExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: InterfaceDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: IsExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: JumpExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: LambdaExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: LetPatternExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: LitConstExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: MacroDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: MacroExpandDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: MacroExpandExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: MainDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: MatchCase): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: MatchExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: MemberAccess): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Modifier): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Node): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: OptionalExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: PackageHeader): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ParenExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ParenType): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Pattern): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: PrefixType): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: PrimaryCtorDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: PrimitiveType): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: PrimitiveTypeExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: Program): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: PropDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: QualifiedType): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: QuoteExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: RangeExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: RefExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: RefType): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ReturnExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: SpawnExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: StructDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: SubscriptExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: SynchronizedExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ThisType): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: ThrowExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: TrailingClosureExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: TryExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: TupleLiteral): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: TuplePattern): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: TupleType): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: TypeAliasDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: TypeConvExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: TypeNode): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: TypePattern): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: UnaryExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: VArrayExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: VArrayType): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: VarDecl): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: VarOrEnumPattern): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: VarPattern): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: WhileExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: WildcardExpr): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
| [`protected open visit(_: WildcardPattern): Unit`](visit/index.md) | 定义访问节点时的操作，需要重写。 |
