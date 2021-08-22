public struct BirdSpotting: PostableSpotting {
    public var title: String
    public var imageKeys: Set<String>
    public var bird: BirdIdentification
    public var location: Location?
    public var timestamp: Int?
    public var description: String?

    public init(
        title: String,
        imageKeys: Set<String> = [],
        bird: BirdIdentification,
        location: Location?,
        timestamp: Int?,
        description: String?
    ) {
        self.title = title
        self.imageKeys = imageKeys
        self.bird = bird
        self.location = location
        self.timestamp = timestamp
        self.description = description
    }
}
