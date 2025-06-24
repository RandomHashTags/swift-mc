public enum ValueType {
    case string(String)
    case char(Int8)
    case charUnsigned(UInt8)
    case short(Int16)
    case shortUnsigned(UInt16)
    
    case integer(Int)
    case integerUnsigned(UInt)
    case long(Int64)
    case longUnsigned(UInt64)
    
    case float(Float)
    case double(Double)
    
    case boolean(Bool)
    
    case location((any Location)?)
    case itemStack((any ItemStack)?)
}
