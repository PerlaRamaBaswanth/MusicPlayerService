//
//  MusicSource.swift
//  MusicPlayerService
//

protocol MusicSource {
    func play(song: Song)
    func pause()
    func stop()
}

