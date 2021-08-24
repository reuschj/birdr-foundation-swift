import Foundation

/// Image formats supported for upload
public enum ImageType: String, RawRepresentable, Codable, CustomStringConvertible {
    case jpg = "image/jpeg"
    case png = "image/png"
    case bmp = "image/bmp"
    case gif = "image/gif"
    case tiff = "image/tiff"
    case webp = "image/webp"
    case svg = "image/svg+xml"
    
    public var description: String { rawValue }
    
    public init?(fromData data: Data) {
        var value: UInt8 = 0
        data.copyBytes(to: &value, count: 1)
        switch (value) {
        case 0xFF:
            self = .jpg
        case 0x89:
            self = .png
        case 0x47:
            self = .gif
        case 0x49, 0x4D :
            self = .tiff
        case 0x52:
            self = .webp
        case 0x42:
            self = .bmp
        case 0x3C:
            self = .svg
        default:
            return nil
        }
    }
}
