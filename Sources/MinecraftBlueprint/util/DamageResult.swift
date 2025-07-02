
public enum DamageResult: Sendable {
    case success(SuccessResult)
    case failure(FailureReason)
    
    public enum SuccessResult: Sendable {
        case normal
        case killed
        case custom(String)
    }
    public enum FailureReason: Sendable {
        case blocked
        case cancelled
        case custom(String)
    }
}
