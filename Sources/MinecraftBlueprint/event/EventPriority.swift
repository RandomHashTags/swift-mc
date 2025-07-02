
public enum EventPriority: Sendable {
    @inlinable
    public static var highest: UInt8 {
        50
    }

    @inlinable
    public static var high: UInt8 {
        100
    }

    @inlinable
    public static var normal: UInt8 {
        125
    }

    @inlinable
    public static var low: UInt8 {
        150
    }

    @inlinable
    public static var lowest: UInt8 {
        200
    }
}