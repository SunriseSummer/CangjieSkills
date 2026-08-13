package reflect_mapper

import std.collection.*
import std.reflect.*

public class Account {
    @Mapped["user_name", true]
    public var name: String = "initial"

    @Mapped["age", false]
    @IntRange[0, 130]
    public var age: Int64 = 7

    @Mapped["enabled", false]
    public var enabled: Bool = false

    public var ignored: String = "unchanged"
}

public class Code {
    public let value: String
    public init(value: String) { this.value = value }
}

public class CodeDecoder <: TextDecoder<Code> {
    public func decode(text: String): Code { Code("code-${text}") }
}

public class CustomModel {
    @Mapped["code", false]
    public var code: Code = Code("default")
}

public class UnsupportedModel {
    @Mapped["ratio", false]
    public var ratio: Float64 = 1.5
}

private func inputOf(entries: Array<(String, String)>): HashMap<String, String> {
    let result = HashMap<String, String>()
    for ((key, value) in entries) {
        result.add(key, value)
    }
    return result
}

private func accountMapper(): ReflectMapper<Account> {
    return ReflectMapper<Account>({ => Account() })
}

@Test
class ReflectMapperTests {
    @TestCase
    func annotationIsVisibleThroughReflection(): Unit {
        let field = ClassTypeInfo.of<Account>().getInstanceVariable("name")
        let annotation = field.findAnnotation<Mapped>().getOrThrow()
        @Assert(annotation.key, "user_name")
        @Assert(annotation.required)
    }

    @TestCase
    func mapsRenamedStringField(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada")]))
        @Assert(result.value.name, "Ada")
    }

    @TestCase
    func mapsInt64Field(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("age", "42")]))
        @Assert(result.value.age, 42)
    }

    @TestCase
    func mapsTrueField(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("enabled", "true")]))
        @Assert(result.value.enabled)
    }

    @TestCase
    func mapsFalseField(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("enabled", "false")]))
        @Assert(!result.value.enabled)
    }

    @TestCase
    func missingOptionalFieldsAreAllowed(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada")]))
        @Assert(result.isValid)
        @Assert(result.value.age, 7)
    }

    @TestCase
    func missingRequiredFieldIsReported(): Unit {
        let result = accountMapper().map(inputOf([]))
        @Assert(!result.isValid)
        @Assert(result.issues.size, 1)
        @Assert(result.issues[0].field, "user_name")
        @Assert(result.issues[0].code, "missing")
    }

    @TestCase
    func invalidIntegerIsReported(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("age", "old")]))
        @Assert(result.issues[0].code, "decode")
        @Assert(result.value.age, 7)
    }

    @TestCase
    func invalidBooleanIsReported(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("enabled", "yes")]))
        @Assert(result.issues[0].field, "enabled")
        @Assert(result.issues[0].code, "decode")
    }

    @TestCase
    func lowerRangeBoundaryIsAccepted(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("age", "0")]))
        @Assert(result.isValid)
        @Assert(result.value.age, 0)
    }

    @TestCase
    func upperRangeBoundaryIsAccepted(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("age", "130")]))
        @Assert(result.isValid)
        @Assert(result.value.age, 130)
    }

    @TestCase
    func belowRangeIsRejected(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("age", "-1")]))
        @Assert(result.issues[0].code, "range")
        @Assert(result.value.age, 7)
    }

    @TestCase
    func aboveRangeIsRejected(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("age", "131")]))
        @Assert(result.issues[0].code, "range")
    }

    @TestCase
    func unannotatedFieldIsIgnored(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("ignored", "changed")]))
        @Assert(result.value.ignored, "unchanged")
    }

    @TestCase
    func unknownInputKeyIsIgnored(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada"), ("extra", "value")]))
        @Assert(result.isValid)
    }

    @TestCase
    func emptyRequiredStringIsStillPresent(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "")]))
        @Assert(result.isValid)
        @Assert(result.value.name, "")
    }

    @TestCase
    func mapOrThrowReturnsMappedValue(): Unit {
        let value = accountMapper().mapOrThrow(inputOf([("user_name", "Grace"), ("age", "33")]))
        @Assert(value.name, "Grace")
        @Assert(value.age, 33)
    }

    @TestCase
    func mapOrThrowThrowsCustomException(): Unit {
        try {
            accountMapper().mapOrThrow(inputOf([]))
            @Fail("expected MappingException")
        } catch (error: MappingException) {
            @Assert(error.getClassName(), "MappingException")
            @Assert(error.issues.size, 1)
        }
    }

    @TestCase
    func exceptionMessageIsStable(): Unit {
        try {
            accountMapper().mapOrThrow(inputOf([]))
            @Fail("expected MappingException")
        } catch (error: MappingException) {
            @Assert(error.message, "mapping failed with 1 issue(s)")
        }
    }

    @TestCase
    func registrySupportsGenericCustomDecoder(): Unit {
        let registry = DecoderRegistry()
        registry.register<Code>(CodeDecoder())
        let mapper = ReflectMapper<CustomModel>({ => CustomModel() }, registry: registry)
        let result = mapper.map(inputOf([("code", "x7")]))
        @Assert(result.isValid)
        @Assert(result.value.code.value, "code-x7")
    }

    @TestCase
    func unsupportedTypeProducesDecodeIssue(): Unit {
        let mapper = ReflectMapper<UnsupportedModel>({ => UnsupportedModel() })
        let result = mapper.map(inputOf([("ratio", "2.0")]))
        @Assert(result.issues.size, 1)
        @Assert(result.issues[0].code, "decode")
    }

    @TestCase
    func mappingResultSatisfiesValidationStateByExtension(): Unit {
        let result = accountMapper().map(inputOf([("user_name", "Ada")]))
        let state: ValidationState = result
        @Assert(state.isValid)
    }

    @TestCase
    func issuesAreSortedByReflectedFieldName(): Unit {
        let result = accountMapper().map(inputOf([("age", "bad"), ("enabled", "bad")]))
        @Assert(result.issues.size, 3)
        @Assert(result.issues[0].field, "age")
        @Assert(result.issues[1].field, "enabled")
        @Assert(result.issues[2].field, "user_name")
    }

    @TestCase
    func issueToStringIsDeterministic(): Unit {
        let issue = MappingIssue("age", "range", "too large")
        @Assert(issue.toString(), "age:range:too large")
    }

    @TestCase
    func defaultDecodersRemainAvailableAfterRegistration(): Unit {
        let registry = DecoderRegistry()
        registry.register<Code>(CodeDecoder())
        let mapper = ReflectMapper<Account>({ => Account() }, registry: registry)
        let result = mapper.map(inputOf([("user_name", "Ada"), ("age", "8")]))
        @Assert(result.value.age, 8)
    }
}
