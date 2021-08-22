/// A user feed of bird spottings
public struct SpottingFeed<Spotting>: Codable where Spotting: PostableSpotting {
    public var userID: String
    public var posts: [Post] = []

    public init(userId: String) {
        self.userID = userId
        self.posts = []
    }

    public mutating func add(post: Post) {
        posts.append(post)
    }

    public struct Post: Timestamped, Codable {
        public let identifcation: String
        public let timestamp: Int
        public let spotting: Spotting

        public init(
            identifcation: String,
            timestamp: Int,
            spotting: Spotting
        ) {
            self.identifcation = identifcation
            self.timestamp = timestamp
            self.spotting = spotting
        }
    }
}
