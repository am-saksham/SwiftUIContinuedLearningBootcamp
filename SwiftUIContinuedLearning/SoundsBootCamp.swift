//
//  SoundsBootCamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Saksham Gupta on 20/06/24.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case Tada = "Tada-sound"
        case Badum = "Badum-tss"
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
}

struct SoundsBootCamp: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.instance.playSound(sound: .Tada)
            }
            Button("Play sound 2") {
                SoundManager.instance.playSound(sound: .Badum)
            }
        }
    }
}

#Preview {
    SoundsBootCamp()
}
