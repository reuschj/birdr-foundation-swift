import Foundation

/// Any type holding a UUID
public protocol UniquelyIdentified: Keyed {
    var identification: UUID { get }
}

extension UniquelyIdentified {
    public var key: String { identification.uuidString }
}
