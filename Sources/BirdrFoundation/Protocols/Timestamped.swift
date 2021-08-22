import Foundation

/// Any type that has a possible timestamp (optional)
public protocol PossiblyTimestamped {
    var timestamp: Int? { get }
}

extension PossiblyTimestamped {
    public var date: Date? {
        guard let timestamp = timestamp else { return nil }
        return getDateFrom(timestamp: timestamp)
    }
}

/// Any type that is guaranteed to have a timestamp
public protocol Timestamped {
    var timestamp: Int { get }
}

extension Timestamped {
    public var date: Date {
        getDateFrom(timestamp: timestamp)
    }
}
