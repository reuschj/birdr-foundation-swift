import Foundation
import BirdrFoundation

/// A type holding all the details about a bird spotting
public struct BirdSpotting: UniquelyIdentified, PostableSpotting {
    public var title: String
    public var imageKeys: Set<String>
    public var bird: BirdIdentification
    public var location: Location?
    public var timestamp: Int?
    public var description: String?
    public let identification: UUID

    public init(
        title: String,
        imageKeys: Set<String> = [],
        bird: BirdIdentification,
        location: Location? = nil,
        timestamp: Int? = nil,
        description: String? = nil
    ) {
        self.title = title
        self.imageKeys = imageKeys
        self.bird = bird
        self.location = location
        self.timestamp = timestamp
        self.description = description
        self.identification = UUID()
    }
    
    /// Just used for request decoding
    public struct Request: PostableSpotting {
        public var title: String
        public var imageKeys: Set<String>
        public var bird: BirdIdentification
        public var location: Location?
        public var timestamp: Int?
        public var description: String?
        
        public func convert() -> BirdSpotting {
            BirdSpotting(
                title: self.title,
                imageKeys: self.imageKeys,
                bird: self.bird,
                location: self.location,
                timestamp: self.timestamp,
                description: self.description
            )
        }
    }
    
    /// Constructs the return type by wrapping itself with a key
    public func makeReturn(withDifferentKey differentKey: String? = nil) -> Return {
        Return(key: differentKey ?? key, spotting: self)
    }
    
    public struct Return: Keyed, Codable {
        public var key: String
        public var spotting: BirdSpotting
    }
}
