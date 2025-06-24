public enum DamageResult {
    case success(SuccessResult)
    case failure(FailureReason)
    
    public enum SuccessResult {
        case normal
        case killed
        case custom(String)
    }
    public enum FailureReason {
        case blocked
        case cancelled
        case custom(String)
    }
}
