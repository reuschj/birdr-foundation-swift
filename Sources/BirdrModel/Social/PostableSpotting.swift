import Foundation
import BirdrFoundation

/// Defines any type that can hold data for a 
public protocol PostableSpotting: PossiblyTimestamped, Codable {
    associatedtype BirdInformationType

    // Required ---- /

    /// The title of the entry
    var title: String { get }

    /// The lookup-key(s) for the image(s)
    var imageKeys: Set<String> { get set }

    /// The information about the bird spotted
    var bird: BirdInformationType { get }

    // Optional ---- /

    /// Tags the bird spotting with a location with latitude and longitude
    var location: Location? { get }

    /// Tags the bird spotting with a Unix timestamp
    var timestamp: Int? { get }

    /// An optional long description about the bird spotting
    var description: String? { get }
}

// Default implementation
extension PostableSpotting {

    public mutating func addImage(withKey key: String) -> (inserted: Bool, memberAfterInsert: String) {
        imageKeys.insert(key)
    }

    public mutating func removeImage(withKey key: String) -> String? {
        imageKeys.remove(key)
    }
}
