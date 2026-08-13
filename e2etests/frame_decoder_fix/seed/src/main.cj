package frame_decoder_fix

main(): Unit {
    let decoder = FrameDecoder(1024)
    let frames = decoder.feed(encode(Frame(1, 7, [1, 2, 3])))
    for (frame in frames) {
        println("${frame.sequence}|${frame.flags}|${frame.payload.size}")
    }
    println("buffered=${decoder.bufferedBytes()}")
}
