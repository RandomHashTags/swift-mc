
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

/// Status of an advancement for a player.
public struct AdvancementProgress: Sendable {
    /// Criteria that has been awarded.
    var _awardedCriteria:[String:Date]

    /// Criteria that has not been awarded.
    var _remainingCriteria:[String]
}

// MARK: Criteria
extension AdvancementProgress {
    public var awardedCriteria: Dictionary<String, Date> {
        _read {
            yield _awardedCriteria
        }
    }

    /// - Returns: the `Date` the specified criteria was awarded.
    public func dateAwardedForCriteria(_ criteria: String) -> Date? {
        return _awardedCriteria[criteria]
    }

    /// Marks the specified criteria as awarded at the current time.
    /// 
    /// - Returns: `true` if awarded; `false` if criteria does not exist or already awarded.
    @discardableResult
    public mutating func awardCriteria(_ criteria: String) -> Bool {
        if awardedCriteria[criteria] != nil {
            return false
        }
        _awardedCriteria[criteria] = Date.now
        return true
    }

    /// Marks the specified criteria as uncompleted.
    /// 
    /// - Returns: `true` if removed; `false` if criteria does not exist or not awarded.
    public mutating func revokeCriteria(_ criteria: String) -> Bool {
        if _awardedCriteria[criteria] == nil {
            return false
        }
        _awardedCriteria[criteria] = nil
        return true
    }
}

// MARK: Awarded Criteria
extension AdvancementProgress {
    struct AwardedCriteria: Sendable {
        let id:String
        let timestamp:Date
    }
}