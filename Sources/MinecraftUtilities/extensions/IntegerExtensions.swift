
extension UInt8 {
    @inlinable
    public var char: Character {
        Character(UnicodeScalar(self))
    }
}
