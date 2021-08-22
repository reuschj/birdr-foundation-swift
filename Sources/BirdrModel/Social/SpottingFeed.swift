import Foundation
import BirdrFoundation

/// A user feed of multiple bird spottings
public struct SpottingFeed<Spotting>: UniquelyIdentified, Codable where Spotting: PostableSpotting {
    public var userID: String
    public var posts: [Post] = []
    public let identification: UUID

    public init(userId: String) {
        self.userID = userId
        self.posts = []
        self.identification = UUID()
    }

    public mutating func add(post: Post) {
        posts.append(post)
    }
    
    public mutating func post(
        spotting: Spotting,
        withKey key: String,
        at timestamp: Int = getCurrentUnixTimestamp()
    ) {
        add(post: Post(key: key, timestamp: timestamp, spotting: spotting))
    }

    public struct Post: Timestamped, Keyed, Codable {
        public let key: String
        public let timestamp: Int
        public let spotting: Spotting

        public init(
            key: String,
            timestamp: Int,
            spotting: Spotting
        ) {
            self.key = key
            self.timestamp = timestamp
            self.spotting = spotting
        }
    }
    
    public func makeReturn(withKey key: String) -> Return {
        Return(key: key, feed: self)
    }
    
    public struct Return: Keyed, Codable {
        public var key: String
        public var feed: SpottingFeed
    }
}
