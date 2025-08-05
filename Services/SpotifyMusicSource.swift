//
//  SpotifyMusicSource.swift
//  MusicPlayerService
//

class SpotifyMusicSource: MusicSource {
    func play(song: Song) {
        print("Mock playing from Spotify: \(song.title)")
    }

    func pause() {
        print("Spotify paused")
    }

    func stop() {
        print("Spotify stopped")
    }
}


