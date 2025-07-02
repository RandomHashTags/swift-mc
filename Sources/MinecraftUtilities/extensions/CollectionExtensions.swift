
extension Collection {
    @inlinable
    public func get(_ index: Self.Index) -> Element? {
        return index < endIndex && index >= startIndex ? self[index] : nil
    }
}

extension Array {
    @inlinable
    func mapSet<T>(_ transform: (Element) throws -> T) rethrows -> Set<T> {
        return try map(transform).asSet
    }
}
extension Array where Element: Hashable {
    @inlinable
    var asSet: Set<Element> {
        return Set<Element>(self)
    }
}

extension Set {
    @inlinable
    mutating func remove(contentsOf set: Set<Element>) {
        for element in set {
            remove(element)
        }
    }
}
