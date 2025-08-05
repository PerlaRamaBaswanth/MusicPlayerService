//
//  MusicPlayerService.swift
//  MusicPlayerService
//

import Foundation
import AVFoundation
import Combine

class MusicPlayerService {
    static let shared = MusicPlayerService()

    
    let player = AVPlayer()

    @Published var currentSong: Song?
    @Published var playerState: PlayerState = .stopped

    private init() {}

    func play(song: Song) {
        guard song.sourceType == .local else {
            print("Unsupported source type: \(song.sourceType)")
            return
        }

        // Load local mp3 from bundle
        if let url = Bundle.main.url(forResource: song.fileName, withExtension: "mp3") {
            let item = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: item)
            player.play()
            currentSong = song
            playerState = .playing
        } else {
            print("❌ Could not find local file: \(song.fileName).mp3")
        }
    }

    func pause() {
        player.pause()
        playerState = .paused
    }

    func stop() {
        player.pause()
        player.seek(to: .zero)
        playerState = .stopped
    }
}
