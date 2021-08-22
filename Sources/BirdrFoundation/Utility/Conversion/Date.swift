import Foundation

public func getMillisecondsFrom(timeInterval: TimeInterval) -> Int {
    Int(round(timeInterval * 1_000))
}

public func getUnixTimestampFrom(date: Date = Date()) -> Int {
    getMillisecondsFrom(timeInterval: date.timeIntervalSince1970)
}

public func getCurrentUnixTimestamp() -> Int {
    getUnixTimestampFrom(date: Date())
}

public func getTimeIntervalFrom(milliseconds: Int) -> TimeInterval {
    Double(milliseconds) / 1_000
}

public func getDateFrom(timestamp: Int) -> Date {
    Date(timeIntervalSince1970: getTimeIntervalFrom(milliseconds: timestamp))
}
