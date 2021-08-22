/// Simple holder of location specified by latitude and longitude
public struct Location: Codable {
    public let latitude: Double
    public let longitude: Double

    public init(
        latitude: Double,
        longitude: Double
    ) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Location: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}

extension Location: CustomStringConvertible {
    public var description: String { "\(latitude), \(longitude)" }
}
