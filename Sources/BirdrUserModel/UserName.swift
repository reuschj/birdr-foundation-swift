import Foundation

/// Model for a user name
public struct UserName: Codable, CustomStringConvertible {
    public var prefix: Prefix?
    public var first: String
    public var middle: String?
    public var last: String
    public var suffix: Suffix?
    
    public init(
        prefix: Prefix? = nil,
        first: String,
        middle: String? = nil,
        last: String,
        suffix: Suffix? = nil
    ) {
        self.prefix = prefix
        self.first = first
        self.middle = middle
        self.last = last
        self.suffix = suffix
    }
    
    public var description: String {
        [prefix?.rawValue, first, middle, last, suffix?.rawValue].compactMap { $0 }.joined(separator: " ")
    }
    
    public enum Prefix: String, RawRepresentable, Codable {
        case mr = "Mr."
        case mrs = "Mrs."
        case ms = "Ms."
        case dr = "Dr."
    }
    
    public enum Suffix: String, RawRepresentable, Codable {
        case jr = "Jr."
        case sr = "Sr."
        case ii = "II"
        case iii = "III"
    }
}
