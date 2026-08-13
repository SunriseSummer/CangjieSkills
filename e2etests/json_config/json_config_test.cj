package json_config

func capturedError(source: String): String {
    try {
        normalizeConfig(source)
        "no error"
    } catch (error: ConfigError) {
        error.message
    }
}

@Test
func normalConfigurationTest(): Unit {
    @Expect(
        normalizeConfig("{\"name\":\"worker-pool\",\"workers\":8,\"enabled\":true}"),
        "name=worker-pool;workers=8;enabled=true"
    )
}

@Test
func missingFieldTest(): Unit {
    @Expect(
        capturedError("{\"name\":\"worker-pool\",\"enabled\":true}"),
        "missing field 'workers'"
    )
}

@Test
func wrongFieldTypeTest(): Unit {
    @Expect(
        capturedError("{\"name\":\"worker-pool\",\"workers\":\"eight\",\"enabled\":true}"),
        "field 'workers' must be an integer"
    )
}

@Test
func malformedJsonTest(): Unit {
    @Expect(capturedError("{not-json}"), "invalid JSON document")
}
