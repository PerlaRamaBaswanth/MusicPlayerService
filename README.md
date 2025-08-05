# 🎵 MusicPlayerService


---

## ✅ Features

- 🎶 Play local audio files
- ⏸ Pause / ▶️ Resume / ⏹ Stop controls
- ⏭ Play next / ⏮ Play previous
- 📊 Live playback progress tracking using Combine
- 🧠 Singleton-based service design
- 🎯 Strategy pattern for handling different music sources
- 🧱 MVVM pattern with `ObservableObject` and `@Published` state
- 👩‍💻 Built using **SwiftUI** and **AVPlayer**

---

## 🔧 Architecture

- **MVVM**: Clean separation between UI, business logic, and service
- **Singleton**: `MusicPlayerService` ensures a single source of truth
- **Combine**: Real-time updates to UI for playback state and progress

---

## 📁 Project Structure
MusicPlayerService/
├── Models/
│ └── Song.swift
├── Services/
│ └── MusicPlayerService.swift
├── ViewModels/
│ └── MusicPlayerViewModel.swift
├── Views/
│ └── PlayerView.swift
├── MusicPlayerServiceApp.swift
└── Assets.xcassets/
└── local_song.mp3
└── track2.mp3


---

## ▶️ How to Run

1. Clone the repo
2. Open in Xcode 15 or later
3. Run on an iPhone simulator
4. Tap a track to begin playback!

> 🎧 Make sure your `local_song.mp3` and `track2.mp3` are added to the Xcode project **with target membership** checked.

---

## 📌 Challenge Requirements Covered

- [x] Singleton Service ✅
- [x] Strategy Pattern ✅
- [x] MVVM Architecture ✅
- [x] Combine Framework for UI updates ✅
- [x] Local audio file playback ✅

---

## 👤 Author

- 👨‍💻 Perla Rama Baswanth  
- 📧 baswanthperla99@gmail.com

---




