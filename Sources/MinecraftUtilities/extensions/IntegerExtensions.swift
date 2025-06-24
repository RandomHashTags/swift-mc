public extension UInt8 {
    var char: Character {
        return Character(UnicodeScalar(self))
    }
}
