import Foundation
import BirdrFoundation

/// A user feed of multiple bird spottings
public struct SpottingFeed<Spotting>: UniquelyIdentified, Codable
    where Spotting: PostableSpotting, Spotting: UniquelyIdentified {

    public var userKey: String
    public var posts: [Post] = []
    public let identification: UUID

    public init(
        userKey: String
    ) {
        self.userKey = userKey
        self.posts = []
        self.identification = UUID()
    }

    public mutating func add(post: Post) {
        posts.append(post)
    }
    
    public mutating func post(
        spotting: Spotting,
        at timestamp: Int = getCurrentUnixTimestamp()
    ) {
        add(post: Post(key: spotting.key, timestamp: timestamp))
    }

    public struct Post: Timestamped, Keyed, Codable {
        public let key: String
        public let timestamp: Int

        public init(
            key: String,
            timestamp: Int
        ) {
            self.key = key
            self.timestamp = timestamp
        }
    }
    
    // Just used for request decoding
    public struct Request: Codable {
        public var userKey: String
        
        public func convert() -> SpottingFeed<Spotting> {
            SpottingFeed(userKey: self.userKey)
        }
    }
    
    /// Constructs the return type by wrapping itself with a key
    public func makeReturn(withDifferentKey differentKey: String? = nil) -> Return {
        Return(key: differentKey ?? key, feed: self)
    }
    
    public struct Return: Keyed, Codable {
        public var key: String
        public var feed: SpottingFeed
    }
}
