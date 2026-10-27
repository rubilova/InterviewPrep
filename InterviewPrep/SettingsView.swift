//
//  SettingsView.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 10/27/26.
//
import SwiftUI

struct SettingsView: View {
    @State private var isSoundOn = true

    var body: some View {
        VStack {
            Text(isSoundOn ? "🔊 Sound on" : "🔇 Sound off")
            SoundToggle(isSoundOn: $isSoundOn)
        }
    }
}

struct SoundToggle: View {
    @Binding var isSoundOn: Bool
    
    var body: some View {
        Toggle("Is sound on: ", isOn: $isSoundOn)
    }
}

#Preview {
    SettingsView()
}
