package layered_config

import std.env.*
import std.fs.*

private func expectConfigError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected ConfigException")
    } catch (_: ConfigException) {
        @Assert(true)
    }
}

@Test
class LayeredConfigTests {
    @TestCase func parsesAllValueKinds() {
        let config = LayeredConfig.parse("name=s:api\nport=i:8080\nenabled=b:true\n")
        @Assert(config.requireText("name"), "api")
        @Assert(config.requireInteger("port"), 8080)
        @Assert(config.requireFlag("enabled"))
    }

    @TestCase func ignoresCommentsBlankLinesAndSpaces() {
        let config = LayeredConfig.parse(" # comment\n\n name = s: value with spaces \n")
        @Assert(config.size(), 1)
        @Assert(config.requireText("name"), "value with spaces")
    }

    @TestCase func overlayUsesHigherPrecedence() {
        let low = LayeredConfig.parse("name=s:base\nport=i:80\n")
        let high = LayeredConfig.parse("port=i:443\nsecure=b:true\n")
        let merged = low.overlay(high)
        @Assert(merged.requireText("name"), "base")
        @Assert(merged.requireInteger("port"), 443)
        @Assert(merged.requireFlag("secure"))
    }

    @TestCase func overlayIsIndependent() {
        let low = LayeredConfig.parse("name=s:base\n")
        let high = LayeredConfig.parse("port=i:443\n")
        let merged = low.overlay(high)
        low.put("name", ConfigValue.Text("changed"))
        high.put("port", ConfigValue.Integer(80))
        @Assert(merged.requireText("name"), "base")
        @Assert(merged.requireInteger("port"), 443)
    }

    @TestCase func missingKeyFails() { expectConfigError { => LayeredConfig().requireText("missing"); () } }
    @TestCase func wrongTypeFails() { expectConfigError { => LayeredConfig.parse("port=i:80\n").requireText("port"); () } }
    @TestCase func duplicateKeyFails() { expectConfigError { => LayeredConfig.parse("a=s:x\na=s:y\n"); () } }
    @TestCase func malformedValuesFail() { expectConfigError { => LayeredConfig.parse("a=i:nope\nb=b:yes\nc=x:value\n"); () } }

    @TestCase func errorMessageContainsEveryLine() {
        try {
            LayeredConfig.parse("bad\nok=s:value\nalso-bad\nnum=i:x\n")
            @Fail("expected ConfigException")
        } catch (error: ConfigException) {
            @Assert(error.message.contains("line 1"))
            @Assert(error.message.contains("line 3"))
            @Assert(error.message.contains("line 4"))
        }
    }

    @TestCase func parsesUtf8File() {
        let file = File.createTemp(getTempDirectory())
        let path = file.info.path
        file.close()
        try {
            File.writeTo(path, "name=s:仓颉\ncount=i:2\n".toArray())
            let config = LayeredConfig.parseFile(path)
            @Assert(config.requireText("name"), "仓颉")
            @Assert(config.requireInteger("count"), 2)
        } finally {
            removeIfExists(path)
        }
    }
}
