//
//  PlayerView.swift
//  MusicPlayerService
//

import SwiftUI

struct PlayerView: View {
    @StateObject private var viewModel = MusicPlayerViewModel()

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.songs) { song in
                    Button(action: {
                        viewModel.play(song: song)
                    }) {
                        Text(song.title)
                    }
                }
            }

            Text("Current Song: \(viewModel.currentSong?.title ?? "None")")
                .padding(.top)

            // ⏱ Progress Slider
            VStack {
                Slider(value: Binding(get: {
                    viewModel.currentTime
                }, set: { newVal in
                    // Optional: allow seeking
                }), in: 0...max(viewModel.duration, 1))
                
                HStack {
                    Text(viewModel.currentTime.formatTime())
                    Spacer()
                    Text(viewModel.duration.formatTime())
                }
                .font(.caption)
                .padding(.horizontal)
            }
            .padding()

            // 🎛 Controls
            HStack(spacing: 15) {
                Button("⏮ Previous") {
                    viewModel.playPrevious()
                }

                Button("⏸ Pause") {
                    viewModel.pause()
                }

                Button("⏹ Stop") {
                    viewModel.stop()
                }

                Button("⏭ Next") {
                    viewModel.playNext()
                }
            }
            .padding()

            Text("Player State: \(viewModel.state.description)")
                .padding(.bottom)
        }
    }
}

extension PlayerState {
    var description: String {
        switch self {
        case .playing: return "Playing"
        case .paused: return "Paused"
        case .stopped: return "Stopped"
        }
    }
}

extension Double {
    func formatTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
