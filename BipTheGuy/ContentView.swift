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
  
    var body: some View {
        VStack {
          Spacer()
            Image("clown")
            .resizable()
            .scaledToFit()
            .onTapGesture {
              playsound(soundName: "punchSound")
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
