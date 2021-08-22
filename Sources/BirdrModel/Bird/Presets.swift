/// Presets
extension BirdIdentification {

    // TODO: Build out

    /// Maps enum cases to presets
    public enum Preset: String, RawRepresentable, Codable, CustomStringConvertible {
        case americanRobin
        case blackNoddy
        case blueAndYellowMacaw
        case blueJay
        case houseSparrow
        case longTailedBroadbill
        case northernCardinal

        public var description: String { identification.description }

        public var identification: BirdIdentification {
            switch self {
            case .americanRobin: return .americanRobin
            case .blackNoddy: return .blackNoddy
            case .blueAndYellowMacaw: return .blueAndYellowMacaw
            case .blueJay: return .blueJay
            case .houseSparrow: return .houseSparrow
            case .longTailedBroadbill: return .longTailedBroadbill
            case .northernCardinal: return .northernCardinal
            }
        }
    }

    public static var americanRobin: BirdIdentification {
        Self.init(called: "American Robin", taxonomy: BirdTaxonomy(
            order: .passeriformes,
            family: .turdidae,
            genus: .turdus,
            species: .tMigratorius
        ))
    }

    public static var blueAndYellowMacaw: BirdIdentification {
        Self.init(called: "Blue and Yellow Macaw", taxonomy: BirdTaxonomy(
            order: .psittaciformes,
            family: .psittacidae,
            genus: .ara,
            species: .aArarauna
        ))
    }

    public static var blueJay: BirdIdentification {
        Self.init(called: "Blue Jay", taxonomy: BirdTaxonomy(
            order: .passeriformes,
            family: .corvidae,
            genus: .cyanocitta,
            species: .cCristata
        ))
    }

    public static var blackNoddy: BirdIdentification {
        Self.init(called: "Black Noddy", taxonomy: BirdTaxonomy(
            order: .charadriiformes,
            family: .laridae,
            genus: .anous,
            species: .aMinutus
        ))
    }

    public static var houseSparrow: BirdIdentification {
        Self.init(called: "House Sparrow", taxonomy: BirdTaxonomy(
            order: .charadriiformes,
            family: .passeridae,
            genus: .passer,
            species: .pDomesticus
        ))
    }

    public static var longTailedBroadbill: BirdIdentification {
        Self.init(called: "Long-tailed Broadbill", taxonomy: BirdTaxonomy(
            order: .passeriformes,
            family: .eurylaimidae,
            genus: .psarisomus,
            species: .pDalhousiae
        ))
    }

    public static var northernCardinal: BirdIdentification {
        Self.init(called: "Northern Cardinal", taxonomy: BirdTaxonomy(
            order: .passeriformes,
            family: .cardinalidae,
            genus: .cardinalis,
            species: .cCardinalis
        ))
    }
}
