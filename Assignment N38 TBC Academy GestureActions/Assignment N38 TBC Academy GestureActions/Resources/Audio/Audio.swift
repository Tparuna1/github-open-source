//
//  Audio.swift
//  Assignment N38 TBC Academy GestureActions
//
//  Created by tornike <parunashvili on 22.12.23.
//

import AVFoundation

final class AudioPlayer {
    static var audioPlayer: AVAudioPlayer?

    static func playSound(fileName: String, fileExtension: String) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileExtension) else { return }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error playing audio file: \(error.localizedDescription)")
        }
    }
}
