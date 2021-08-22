/// Stores the scientific classification of a bird
/// The enums will cover only supported species of birds
/// and is not exepected to cover all animal types.
/// TODO: The enums need to be build out to support more birds
public struct BirdTaxonomy: Codable {
    public var kingdom: Kingdom = .animalia
    public var phylum: Phylum = .chordata
    public var `class`: Class = .aves
    public var order: Order
    public var family: Family
    public var genus: Genus
    public var species: Species

    public init(
        kingdom: Kingdom = .animalia,
        phylum: Phylum = .chordata,
        class: Class = .aves,
        order: Order,
        family: Family,
        genus: Genus,
        species: Species
    ) {
        self.kingdom = kingdom
        self.phylum = phylum
        self.class = `class`
        self.order = order
        self.family = family
        self.genus = genus
        self.species = species
    }

    public enum Kingdom: String, Codable, CustomStringConvertible {
        /// All birds will be in this kingdom
        case animalia

        public var description: String { rawValue }
    }

    public enum Phylum: String, Codable, CustomStringConvertible {
        /// All birds will be in this phylum
        case chordata

        public var description: String { rawValue }
    }

    public enum Class: String, Codable, CustomStringConvertible {
        /// All birds will be in this class
        case aves

        public var description: String { rawValue }
    }

    public enum Order: String, Codable, CustomStringConvertible {
        case charadriiformes
        case passeriformes
        case psittaciformes

        public var description: String { rawValue }
    }

    public enum Family: String, Codable, CustomStringConvertible {
        case corvidae
        case cardinalidae
        case eurylaimidae
        case laridae
        case passeridae
        case psittacidae
        case turdidae

        public var description: String { rawValue }
    }

    public enum Genus: String, Codable, CustomStringConvertible {
        case anous
        case ara
        case cardinalis
        case cyanocitta
        case passer
        case psarisomus
        case turdus

        public var description: String { rawValue }
    }

    public enum Species: String, Codable, CustomStringConvertible {
        case aArarauna
        case aMinutus
        case cCardinalis
        case cCristata
        case pDalhousiae
        case pDomesticus
        case tMigratorius

        public var description: String { rawValue }
    }
}

extension BirdTaxonomy: CustomStringConvertible {
    public var description: String {
        [
            kingdom.description,
            phylum.description,
            self.class.description,
            order.description,
            family.description,
            genus.description,
            species.description
        ].joined(separator: " : ")
    }
}
