//
//  ReflectionView.swift
//  haptic_companier_ssc
//
//  Created by GEU on 17/02/26.
//

import SwiftUI

struct ReflectionView: View {
    
    var onDone: () -> Void
    
    @State private var selectedMood: Mood? = nil
    @State private var note: String = ""
    @State private var showMessage = false
    
    enum Mood {
        case lighter
        case same
        case overwhelmed
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                colors: [
                    Color(hue: 0.60, saturation: 0.25, brightness: 0.95),
                    Color(hue: 0.63, saturation: 0.30, brightness: 0.88)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Spacer()
                
                Text("How are you feeling now?")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.black.opacity(0.85))
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 16) {
                    moodButton(title: "Lighter", mood: .lighter)
                    moodButton(title: "About the Same", mood: .same)
                    moodButton(title: "Still Overwhelmed", mood: .overwhelmed)
                }
                .padding(.horizontal, 40)
                
                TextField("Optional note...", text: $note)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.35))
                    )
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.horizontal, 40)
                
                Text(supportMessage)
                    .font(.system(size: 16))
                    .foregroundColor(.black.opacity(0.65))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .frame(height: 50)
                    .opacity(showMessage ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showMessage)
                
                
                Spacer()
                
                
                Button(action: {
                    onDone()
                }) {
                    Text("Return")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 16)
                        .background(
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color(hue: 0.60, saturation: 0.55, brightness: 0.65),
                                            Color(hue: 0.68, saturation: 0.50, brightness: 0.70)
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        )
                        .shadow(color: Color.black.opacity(0.15), radius: 8, y: 5)
                }
                .padding(.bottom, 60)
            }
        }
    }
    private func moodButton(title: String, mood: Mood) -> some View {
        Button(action: {
            guard selectedMood == nil else { return }
            
            selectedMood = mood
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                showMessage = true
            }
            
            Task {
                await AdaptiveRhythmManager.shared.updateRhythm(from: mood)
            }
            
        }) {
            Text(title)
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(
                    selectedMood == mood
                    ? .white
                    : .black.opacity(0.85)
                )
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    Capsule()
                        .fill(
                            selectedMood == mood
                            ? AnyShapeStyle(
                                LinearGradient(
                                    colors: [
                                        Color(hue: 0.60, saturation: 0.55, brightness: 0.65),
                                        Color(hue: 0.68, saturation: 0.50, brightness: 0.70)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            : AnyShapeStyle(Color.white.opacity(0.55))
                        )
                )
                .shadow(color: selectedMood == mood ? .black.opacity(0.15) : .clear,
                        radius: 6,
                        y: 3)
                .opacity(selectedMood == nil || selectedMood == mood ? 1 : 0.5)
        }
        .disabled(selectedMood != nil)
    }

    private var supportMessage: String {
        switch selectedMood {
        case .lighter:
            return "That’s a beautiful step. Even small shifts matter."
        case .same:
            return "That’s okay. Just taking time for yourself is meaningful."
        case .overwhelmed:
            return "It’s okay to still feel heavy. You showed up for yourself."
        case .none:
            return ""
        }
    }
}


