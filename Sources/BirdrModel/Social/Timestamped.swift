import Foundation

private func getDate(fromTimestamp timestamp: Int) -> Date {
    Date(timeIntervalSince1970: Double(timestamp) / 1_000)
}

/// Any type that has a possible timestamp (optional)
public protocol PossiblyTimestamped {
    var timestamp: Int? { get }
}

extension PossiblyTimestamped {
    public var date: Date? {
        guard let timestamp = timestamp else { return nil }
        return getDate(fromTimestamp: timestamp)
    }
}

/// Any type that is guaranteed to have a timestamp
public protocol Timestamped {
    var timestamp: Int { get }
}

extension Timestamped {
    public var date: Date {
        getDate(fromTimestamp: timestamp)
    }
}
