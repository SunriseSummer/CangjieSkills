package secure_crypto_envelope

import std.fs.*

private func pair(): RsaSigningKeyPair {
    RsaSigningKeyPair(
        CryptoEnvelope.privateKeyFromPem(String.fromUtf8(File.readFrom("./fixtures/rsa_private.pem"))),
        CryptoEnvelope.publicKeyFromPem(String.fromUtf8(File.readFrom("./fixtures/rsa_public.pem")))
    )
}
private func expectEnvelopeError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected EnvelopeException")
    } catch (_: EnvelopeException) { @Assert(true) }
}

@Test
class TestBasics {
    @TestCase func secureBytes16() { @Assert(CryptoEnvelope.secureBytes(16).size, 16) }
    @TestCase func secureBytes1() { @Assert(CryptoEnvelope.secureBytes(1).size, 1) }
    @TestCase func sha256Abc() {
        @Assert(CryptoEnvelope.sha256Hex("abc".toArray()),
            "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
    }
    @TestCase func sha256Empty() {
        @Assert(CryptoEnvelope.sha256Hex([]),
            "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
    }
    @TestCase func generatedPairWorks() {
        let keys = CryptoEnvelope.generateSigningKeyPair()
        let sig = CryptoEnvelope.sign("x".toArray(), keys.privateKey)
        @Assert(CryptoEnvelope.verify("x".toArray(), sig, keys.publicKey), true)
    }
    @TestCase func privatePemRoundTrip() {
        let keys = pair()
        let restored = CryptoEnvelope.privateKeyFromPem(
            CryptoEnvelope.privateKeyToPem(keys.privateKey))
        let sig = CryptoEnvelope.sign("pem".toArray(), restored)
        @Assert(CryptoEnvelope.verify("pem".toArray(), sig, keys.publicKey), true)
    }
    @TestCase func publicPemRoundTrip() {
        let keys = pair()
        let restored = CryptoEnvelope.publicKeyFromPem(
            CryptoEnvelope.publicKeyToPem(keys.publicKey))
        let sig = CryptoEnvelope.sign("pem".toArray(), keys.privateKey)
        @Assert(CryptoEnvelope.verify("pem".toArray(), sig, restored), true)
    }
    @TestCase func pemLabels() {
        let keys = pair()
        @Assert(CryptoEnvelope.privateKeyToPem(keys.privateKey).contains("PRIVATE KEY"), true)
        @Assert(CryptoEnvelope.publicKeyToPem(keys.publicKey).contains("PUBLIC KEY"), true)
    }
}

@Test
class TestEncryption {
    @TestCase func asciiRoundTrip() {
        let keys = pair(); let data = "hello".toArray()
        @Assert(CryptoEnvelope.decrypt(CryptoEnvelope.encrypt(data, keys.publicKey),
            keys.privateKey), data)
    }
    @TestCase func emptyRoundTrip() {
        let keys = pair()
        @Assert(CryptoEnvelope.decrypt(CryptoEnvelope.encrypt([], keys.publicKey),
            keys.privateKey), [])
    }
    @TestCase func unicodeRoundTrip() {
        let keys = pair(); let data = "仓颉语言".toArray()
        @Assert(CryptoEnvelope.decrypt(CryptoEnvelope.encrypt(data, keys.publicKey),
            keys.privateKey), data)
    }
    @TestCase func binaryRoundTrip() {
        let keys = pair(); let data: Array<Byte> = [0, 255, 1, 128, 0]
        @Assert(CryptoEnvelope.decrypt(CryptoEnvelope.encrypt(data, keys.publicKey),
            keys.privateKey), data)
    }
    @TestCase func mediumRoundTrip() {
        let keys = pair(); let data = Array<Byte>(128, repeat: 42)
        @Assert(CryptoEnvelope.decrypt(CryptoEnvelope.encrypt(data, keys.publicKey),
            keys.privateKey), data)
    }
    @TestCase func oaepIsProbabilistic() {
        let keys = pair(); let data = "same".toArray()
        @Assert(CryptoEnvelope.encrypt(data, keys.publicKey) !=
            CryptoEnvelope.encrypt(data, keys.publicKey), true)
    }
    @TestCase func rsaCiphertextHasModulusLength() {
        let keys = pair()
        @Assert(CryptoEnvelope.encrypt("x".toArray(), keys.publicKey).size, 256)
    }
    @TestCase func encryptionDoesNotMutateInput() {
        let keys = pair(); let data: Array<Byte> = [1, 2, 3]; let before = data.clone()
        CryptoEnvelope.encrypt(data, keys.publicKey)
        @Assert(data, before)
    }
}

@Test
class TestSigningEnvelope {
    @TestCase func signatureVerifies() {
        let keys = pair(); let data = "signed".toArray()
        @Assert(CryptoEnvelope.verify(data, CryptoEnvelope.sign(data, keys.privateKey),
            keys.publicKey), true)
    }
    @TestCase func changedDataFails() {
        let keys = pair(); let sig = CryptoEnvelope.sign("one".toArray(), keys.privateKey)
        @Assert(CryptoEnvelope.verify("two".toArray(), sig, keys.publicKey), false)
    }
    @TestCase func changedSignatureFails() {
        let keys = pair(); let data = "one".toArray()
        let sig = CryptoEnvelope.sign(data, keys.privateKey); sig[0] = sig[0] ^ 1
        @Assert(CryptoEnvelope.verify(data, sig, keys.publicKey), false)
    }
    @TestCase func wrongPublicKeyFails() {
        let first = pair(); let second = CryptoEnvelope.generateSigningKeyPair()
        let data = "one".toArray()
        @Assert(CryptoEnvelope.verify(data, CryptoEnvelope.sign(data, first.privateKey),
            second.publicKey), false)
    }
    @TestCase func sealAndOpen() {
        let keys = pair(); let data = "payload".toArray()
        @Assert(CryptoEnvelope.open(CryptoEnvelope.seal(data, keys.publicKey, keys.privateKey),
            keys.privateKey, keys.publicKey), data)
    }
    @TestCase func envelopeContainsCipherAndSignature() {
        let keys = pair(); let env = CryptoEnvelope.seal("x".toArray(),
            keys.publicKey, keys.privateKey)
        @Assert(env.ciphertext.size, 256); @Assert(env.signature.size, 256)
    }
    @TestCase func tamperedCiphertextRejected() {
        let keys = pair(); let env = CryptoEnvelope.seal("x".toArray(),
            keys.publicKey, keys.privateKey); env.ciphertext[0] = env.ciphertext[0] ^ 1
        expectEnvelopeError { => CryptoEnvelope.open(env, keys.privateKey, keys.publicKey) }
    }
    @TestCase func tamperedSignatureRejected() {
        let keys = pair(); let env = CryptoEnvelope.seal("x".toArray(),
            keys.publicKey, keys.privateKey); env.signature[0] = env.signature[0] ^ 1
        expectEnvelopeError { => CryptoEnvelope.open(env, keys.privateKey, keys.publicKey) }
    }
}
