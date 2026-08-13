package decimal_invoice

import std.convert.*
import std.math.numeric.*

private func dec(value: String): Decimal { Decimal.parse(value) }

private func expectInvoiceError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected InvoiceException")
    } catch (_: InvoiceException) {
        @Assert(true)
    }
}

@Test
class InvoiceTests {
    @TestCase func parsesLineItem() {
        let item = LineItem.parse("book|12.345|2")
        @Assert(item.sku, "book")
        @Assert(item.unitPrice, dec("12.345"))
        @Assert(item.quantity, 2)
    }

    @TestCase func rejectsMalformedLine() {
        expectInvoiceError { => LineItem.parse("book|12"); () }
    }

    @TestCase func rejectsEmptySku() {
        expectInvoiceError { => LineItem.parse("|12.00|1"); () }
    }

    @TestCase func rejectsInvalidPrice() {
        expectInvoiceError { => LineItem.parse("book|x|1"); () }
    }

    @TestCase func rejectsNegativePrice() {
        expectInvoiceError { => let _ = LineItem("bad", dec("-0.01"), 1) }
    }

    @TestCase func rejectsNonPositiveQuantity() {
        expectInvoiceError { => let _ = LineItem("bad", dec("1.00"), 0) }
    }

    @TestCase func rejectsNegativeTaxRate() {
        expectInvoiceError { => Invoice([], dec("-0.01")); () }
    }

    @TestCase func computesHalfUpSubtotal() {
        let invoice = Invoice([LineItem("a", dec("1.005"), 1)], dec("0"))
        @Assert(invoice.subtotal().toString(), "1.01")
    }

    @TestCase func computesTaxAndTotal() {
        let invoice = Invoice([
            LineItem.parse("book|12.345|2"),
            LineItem.parse("pen|1.10|3")
        ], dec("0.075"))
        @Assert(invoice.subtotal().toString(), "27.99")
        @Assert(invoice.tax().toString(), "2.10")
        @Assert(invoice.total().toString(), "30.09")
        @Assert(invoice.totalMinorUnits().toString(), "3009")
    }

    @TestCase func emptyInvoiceIsZeroAtScaleTwo() {
        let invoice = Invoice([], dec("0.20"))
        @Assert(invoice.render(), "subtotal=0.00;tax=0.00;total=0.00")
    }

    @TestCase func inputArrayIsDefensivelyCopied() {
        let items = [LineItem("a", dec("1.00"), 1)]
        let invoice = Invoice(items, dec("0"))
        items[0] = LineItem("b", dec("9.00"), 1)
        @Assert(invoice.total().toString(), "1.00")
    }

    @TestCase func renderIsDeterministic() {
        let invoice = Invoice([LineItem("x", dec("2.50"), 2)], dec("0.10"))
        @Assert(invoice.render(), "subtotal=5.00;tax=0.50;total=5.50")
    }
}
