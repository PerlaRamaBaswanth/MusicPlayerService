import AVFoundation

class LocalMusicSource: MusicSource {
    private var player: AVAudioPlayer?

    func play(song: Song) {
        guard let url = Bundle.main.url(forResource: song.fileName, withExtension: "mp3") else {
            print("❌ File not found: \(song.fileName)")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            print("✅ Now playing: \(song.title)")
        } catch {
            print("❌ Failed to play: \(error)")
        }
    }

    func pause() {
        player?.pause()
    }

    func stop() {
        player?.stop()
    }
}
