import Foundation

enum MusicSourceType {
    case local
    case spotify
}

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let fileName: String
    let sourceType: MusicSourceType
}
