
public enum ServerPacketMojangErrors {
    
    public enum VarIntEnum: Error, CustomStringConvertible {
        case doesntExist(type: Any.Type, id: Int)
        
        public var description: String {
            switch self {
            case .doesntExist(let type, let id):
                return "`\(type)` with rawValue \(id) doesn't exist"
            }
        }
    }
    
}
