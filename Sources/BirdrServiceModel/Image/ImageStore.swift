import Foundation
import BirdrFoundation

/// Holder for image
public struct ImageStore: UniquelyIdentified, Codable {
    public let data: Data
    public let type: ImageType
    public let name: String?
    public let identification: UUID

    public init?(
        data: Data,
        type: ImageType? = nil,
        withName name: String? = nil
    ) {
        guard let imageType = type ?? ImageType(fromData: data) else { return nil }
        self.data = data
        self.type = imageType
        self.name = name
        self.identification = UUID()
    }
    
    // Just used for request decoding
    public struct Request: Codable {
        public var data: Data
        public var type: ImageType? = nil
        public var name: String?
        
        public func convert() -> ImageStore? {
            ImageStore(
                data: self.data,
                type: self.type,
                withName: self.name
            )
        }
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
