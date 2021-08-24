import Foundation
import BirdrFoundation

/// Holder for image
public struct ImageStore: UniquelyIdentified, Codable {
    public let data: Data
    public let type: ImageType
    public let name: String?
    public let identification: UUID
    
    public init(
        data: Data,
        type: ImageType,
        withName name: String? = nil
    ) {
        self.data = data
        self.type = type
        self.name = name
        self.identification = UUID()
    }

    public init?(
        data: Data,
        withName name: String? = nil
    ) {
        guard let imageType = ImageType(fromData: data) else { return nil }
        self.init(data: data, type: imageType, withName: name)
    }
    
    public init(
        uuid: UUID,
        data: Data,
        type: ImageType,
        withName name: String? = nil
    ) {
        self.data = data
        self.type = type
        self.name = name
        self.identification = uuid
    }
    
    public init?(
        uuidString: String,
        data: Data,
        type: ImageType? = nil,
        withName name: String? = nil
    ) {
        guard
            let uuid = UUID(uuidString: uuidString),
            let imageType = type ?? ImageType(fromData: data)
        else { return nil }
        self.init(uuid: uuid, data: data, type: imageType, withName: name)
    }
    
    // Just used for request decoding
    public struct Request: Codable {
        public var data: Data
        public var type: ImageType? = nil
        public var name: String?
        
        public func convert() -> ImageStore? {
            guard let explicitType = self.type else {
                return ImageStore(
                    data: self.data,
                    withName: self.name
                )
            }
            return ImageStore(
                data: self.data,
                type: explicitType,
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
