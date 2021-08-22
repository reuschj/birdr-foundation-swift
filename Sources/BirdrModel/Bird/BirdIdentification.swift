import Foundation

/// Holds information about type and species of bird
public struct BirdIdentification: Codable {
    public let commonName: String
    public let taxonomy: BirdTaxonomy?

    public init(
        called commonName: String,
        taxonomy: BirdTaxonomy?
    ) {
        self.commonName = commonName
        self.taxonomy = taxonomy
    }
}

extension BirdIdentification: CustomStringConvertible {
    public var description: String { commonName }
}
