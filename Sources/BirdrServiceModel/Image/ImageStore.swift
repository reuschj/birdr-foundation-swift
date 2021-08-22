import Foundation

public struct ImageStore: Codable {
    public let data: Data
    public let type: String
    public let name: String?

    public init(
        data: Data,
        type: String,
        withName name: String? = nil
    ) {
        self.data = data
        self.type = type
        self.name = name
    }

    public struct Return: Codable {
        public let key: String
        public let storedImage: ImageStore
    }
}
