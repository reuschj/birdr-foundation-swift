import Foundation
import BirdrFoundation

/// Holder for image
public struct ImageStore: UniquelyIdentified, Codable {
    public let data: Data
    public let type: String
    public let name: String?
    public let identification: UUID

    public init(
        data: Data,
        type: String,
        withName name: String? = nil
    ) {
        self.data = data
        self.type = type
        self.name = name
        self.identification = UUID()
    }
    
    /// Constructs the return type by wrapping itself with a key
    public func makeReturn(withDifferentKey differentKey: String? = nil) -> Return {
        Return(key: differentKey ?? key, storedImage: self)
    }

    public struct Return: Keyed, Codable {
        public let key: String
        public let storedImage: ImageStore
    }
}
