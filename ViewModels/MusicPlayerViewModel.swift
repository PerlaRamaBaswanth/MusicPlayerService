//
//  MusicPlayerViewModel.swift
//  MusicPlayerService
//

import Foundation
import Combine
import AVFoundation

class MusicPlayerViewModel: ObservableObject {
    @Published var songs: [Song] = [
        Song(title: "Track 1", artist: "Local", fileName: "local_song", sourceType: .local),
        Song(title: "Track 2", artist: "Local", fileName: "track2", sourceType: .local),
        Song(title: "Mock Spotify", artist: "Spotify", fileName: "", sourceType: .spotify)
    ]

    @Published var currentSong: Song?
    @Published var state: PlayerState = .stopped
    @Published var currentIndex: Int = 0
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0

    private let playerService = MusicPlayerService.shared
    private var cancellables = Set<AnyCancellable>()
    private var timer: AnyCancellable?

    var player: AVPlayer {
        return playerService.player
    }

    init() {
        bind()
        if !songs.isEmpty {
            currentSong = songs[0]
        }
    }

    private func bind() {
        playerService.$currentSong
            .assign(to: &$currentSong)

        playerService.$playerState
            .assign(to: &$state)
    }

    func play(song: Song) {
        if let index = songs.firstIndex(where: { $0.id == song.id }) {
            currentIndex = index
            currentSong = song
            playerService.play(song: song)
            setupDuration()
            startProgressTimer()
        }
    }

    func playCurrent() {
        guard songs.indices.contains(currentIndex) else { return }
        let song = songs[currentIndex]
        currentSong = song
        playerService.play(song: song)
        setupDuration()
        startProgressTimer()
    }

    func playNext() {
        guard currentIndex + 1 < songs.count else { return }
        currentIndex += 1
        playCurrent()
    }

    func playPrevious() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        playCurrent()
    }

    func pause() {
        playerService.pause()
        stopProgressTimer()
    }

    func stop() {
        playerService.stop()
        stopProgressTimer()
        currentTime = 0
    }

    private func setupDuration() {
        if let duration = player.currentItem?.asset.duration {
            self.duration = CMTimeGetSeconds(duration)
        }
    }

    private func startProgressTimer() {
        stopProgressTimer() // avoid multiple timers

        timer = Timer.publish(every: 0.5, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                let currentTime = self.player.currentTime()
                self.currentTime = CMTimeGetSeconds(currentTime)
            }
    }

    private func stopProgressTimer() {
        timer?.cancel()
        timer = nil
    }
}
