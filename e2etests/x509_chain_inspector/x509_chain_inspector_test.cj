package x509_chain_inspector

import std.fs.*
import std.time.*
import stdx.crypto.x509.*

private func text(name: String): String {
    String.fromUtf8(File.readFrom("./fixtures/${name}"))
}
private func root(): X509Certificate { X509Inspector.decodeCertificates(text("root.pem"))[0] }
private func intermediate(): X509Certificate {
    X509Inspector.decodeCertificates(text("intermediate.pem"))[0]
}
private func leaf(): X509Certificate { X509Inspector.decodeCertificates(text("leaf.pem"))[0] }
private func csr(): X509CertificateRequest { X509Inspector.decodeRequest(text("leaf.csr.pem")) }
private func validTime(): DateTime { DateTime.of(year: 2027, month: 1, dayOfMonth: 1) }

@Test
class TestCertificateParsing {
    @TestCase func decodesSingleCertificate() {
        @Assert(X509Inspector.decodeCertificates(text("leaf.pem")).size, 1)
    }
    @TestCase func decodesOrderedBundle() {
        let bundle = X509Inspector.decodeCertificates(
            text("leaf.pem") + text("intermediate.pem") + text("root.pem"))
        @Assert(bundle.size, 3)
        @Assert(bundle[0].subject.commonName, Some("service.example.test"))
        @Assert(bundle[2].subject.commonName, Some("CJ Test Root"))
    }
    @TestCase func summarizesSubjectAndIssuer() {
        let summary = X509Inspector.summarize(leaf())
        @Assert(summary.subjectCommonName, "service.example.test")
        @Assert(summary.issuerCommonName, "CJ Test Intermediate")
    }
    @TestCase func exposesSubjectOrganization() {
        let cert = leaf()
        @Assert(cert.subject.countryName, Some("CN"))
        @Assert(cert.subject.organizationName, Some("Cangjie Skill Lab"))
        @Assert(cert.subject.organizationalUnitName, Some("Fixtures"))
    }
    @TestCase func exposesDnsSansInOrder() {
        @Assert(X509Inspector.summarize(leaf()).dnsNames,
            ["service.example.test", "api.example.test"])
    }
    @TestCase func exposesEmailSan() {
        @Assert(X509Inspector.summarize(leaf()).emailAddresses,
            ["ops@example.test"])
    }
    @TestCase func exposesIpSan() {
        let ips = X509Inspector.summarize(leaf()).ipAddresses
        @Assert(ips.size, 1)
        let expected: Array<Byte> = [127, 0, 0, 1]
        @Assert(ips[0], expected)
    }
    @TestCase func reportsAlgorithms() {
        let summary = X509Inspector.summarize(leaf())
        @Assert(summary.publicKeyAlgorithm.isEmpty(), false)
        @Assert(summary.signatureAlgorithm.isEmpty(), false)
    }
    @TestCase func certificatePublicKeyEncodesPem() {
        @Assert(leaf().publicKey.encodeToPem().encode().contains("PUBLIC KEY"), true)
    }
    @TestCase func serialNumbersDifferAcrossChain() {
        @Assert(leaf().serialNumber != intermediate().serialNumber, true)
        @Assert(intermediate().serialNumber != root().serialNumber, true)
    }
}
@Test
class TestRoundTripsAndCsr {
    @TestCase func certificatePemRoundTrip() {
        let cert = leaf(); @Assert(X509Inspector.certificatePemRoundTrip(cert), cert)
    }
    @TestCase func certificateDerRoundTrip() {
        let cert = leaf(); @Assert(X509Inspector.certificateDerRoundTrip(cert), cert)
    }
    @TestCase func decodesCsrSubject() {
        @Assert(csr().subject.commonName, Some("service.example.test"))
    }
    @TestCase func decodesCsrDnsNames() {
        @Assert(csr().dnsNames, ["service.example.test", "api.example.test"])
    }
    @TestCase func decodesCsrEmailAndIp() {
        let request = csr()
        @Assert(request.emailAddresses, ["ops@example.test"])
        let expected: Array<Byte> = [127, 0, 0, 1]
        @Assert(request.IPAddresses[0], expected)
    }
    @TestCase func requestPemRoundTrip() {
        let request = csr()
        @Assert(X509Inspector.requestPemRoundTrip(request).subject.commonName,
            Some("service.example.test"))
    }
    @TestCase func requestDerRoundTrip() {
        let request = csr()
        @Assert(X509Inspector.requestDerRoundTrip(request).dnsNames, request.dnsNames)
    }
    @TestCase func requestPublicKeyIsRsa() {
        @Assert(csr().publicKeyAlgorithm.toString().isEmpty(), false)
    }
}

@Test
class TestVerification {
    @TestCase func verifiesExplicitChainAndDns() {
        @Assert(X509Inspector.verifyChain(leaf(), [root()], [intermediate()],
            "service.example.test", validTime()), true)
    }
    @TestCase func verifiesSecondDnsSan() {
        @Assert(X509Inspector.verifyChain(leaf(), [root()], [intermediate()],
            "api.example.test", validTime()), true)
    }
    @TestCase func rejectsWrongDns() {
        @Assert(X509Inspector.verifyChain(leaf(), [root()], [intermediate()],
            "wrong.example.test", validTime()), false)
    }
    @TestCase func rejectsMissingIntermediate() {
        @Assert(X509Inspector.verifyChain(leaf(), [root()], [],
            "service.example.test", validTime()), false)
    }
    @TestCase func rejectsWrongRoot() {
        @Assert(X509Inspector.verifyChain(leaf(), [leaf()], [intermediate()],
            "service.example.test", validTime()), false)
    }
    @TestCase func rejectsExpiredTime() {
        let expired = DateTime.of(year: 2030, month: 1, dayOfMonth: 1)
        @Assert(X509Inspector.verifyChain(leaf(), [root()], [intermediate()],
            "service.example.test", expired), false)
    }
}
