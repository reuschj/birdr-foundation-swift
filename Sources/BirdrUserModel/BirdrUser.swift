import Foundation
import BirdrFoundation

/// Model for a birdr user
public struct BirdrUser: Timestamped, UniquelyIdentified, UserProtocol, Codable {
    public var userName: String
    public var name: UserName
    public let identification: UUID
    public let feedKey: String?
    public var location: String?
    public var profilePhotoKey: String?
    public let timestamp: Int
    public var description: String?
    
    public init(
        userName: String,
        name: UserName,
        feedKey: String? = nil,
        location: String? = nil,
        profilePhotoKey: String? = nil,
        description: String? = nil
    ) {
        self.userName = userName
        self.name = name
        self.feedKey = feedKey
        self.location = location
        self.profilePhotoKey = profilePhotoKey
        self.description = description
        self.timestamp = getCurrentUnixTimestamp()
        self.identification = UUID()
    }
    
    // Just used for request decoding
    public struct Request: UserProtocol, Codable {
        public var userName: String
        public var name: UserName
        public let feedKey: String?
        public var location: String?
        public var profilePhotoKey: String?
        public var description: String?
        
        public func convert() -> BirdrUser {
            BirdrUser(
                userName: self.userName,
                name: self.name,
                feedKey: self.feedKey,
                location: self.location,
                profilePhotoKey: self.profilePhotoKey,
                description: self.description
            )
        }
    }
    
    /// Constructs the return type by wrapping itself with a key
    public func makeReturn(withDifferentKey differentKey: String? = nil) -> Return {
        Return(key: differentKey ?? key, user: self)
    }
    
    public struct Return: Keyed, Codable {
        public var key: String
        public var user: BirdrUser
    }
}
