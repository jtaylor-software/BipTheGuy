//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Jeremy Taylor on 4/29/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
  @State private var audioPlayer: AVAudioPlayer!
  @State private var isFullSize = true
  
  var body: some View {
    VStack {
      Spacer()
      Image("clown")
        .resizable()
        .scaledToFit()
        .scaleEffect(isFullSize ? 1.0 : 0.9)
        .onTapGesture {
          playsound(soundName: "punchSound")
          isFullSize = false // will immediately shrink using .scaleEffect to 90% of size
          withAnimation (.spring(response: 0.3, dampingFraction: 0.3)) {
            isFullSize = true // will go from 90% to 100% size but using the .spring animation
          }
        }
      
      
      Spacer()
      
      Button {
        
      } label: {
        Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
      }
      
    }
    .padding()
  }
  
  func playsound(soundName: String) {
    if audioPlayer != nil && audioPlayer.isPlaying {
      audioPlayer.stop()
    }
    guard let soundFile = NSDataAsset(name: soundName) else {
      print("😡 Could not read file named \(soundName)")
      return
    }
    do {
      audioPlayer = try AVAudioPlayer(data: soundFile.data)
      audioPlayer.play()
    } catch {
      print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
    }
  }
}

#Preview {
  ContentView()
}
