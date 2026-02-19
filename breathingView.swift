//
//  breathingView.swift
//  haptic_companier_ssc
//
//  Created by GEU on 17/02/26.
//

import SwiftUI

struct BreathingView: View {
    
    var onComplete: () -> Void
    
    @State private var scale: CGFloat = 0.94
    @State private var isRunning = false
    @State private var breathingTask: Task<Void, Never>?
    @State private var isInhaling = true

    private let inhaleDuration: Double = 4
    private let exhaleDuration: Double = 4
    private let totalSession: Double = 60
    
    private let haptics = HapticsManager()
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                colors: [
                    Color(
                        hue: isInhaling ? 0.58 : 0.62,
                        saturation: 0.35,
                        brightness: 0.90
                    ),
                    Color(
                        hue: isInhaling ? 0.60 : 0.65,
                        saturation: 0.40,
                        brightness: 0.80
                    )
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                // MARK: Text (no animation)
                Text(isInhaling ? "Inhale" : "Exhale")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.white.opacity(0.95))
                    .padding(.bottom, 20)
                
                
                // MARK: Orb
                ZStack {
                    
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color(hue: isInhaling ? 0.55 : 0.65, saturation: 0.55, brightness: 1.0),
                                    Color(hue: isInhaling ? 0.58 : 0.68, saturation: 0.50, brightness: 0.85),
                                    Color(hue: isInhaling ? 0.62 : 0.72, saturation: 0.45, brightness: 0.75)
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 150
                            )
                        )
                        .frame(width: 240, height: 240)
                        .blur(radius: 35)
                        .opacity(0.6)

                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color(hue: isInhaling ? 0.55 : 0.65, saturation: 0.55, brightness: 1.0),
                                    Color(hue: isInhaling ? 0.58 : 0.68, saturation: 0.50, brightness: 0.85),
                                    Color(hue: isInhaling ? 0.62 : 0.72, saturation: 0.45, brightness: 0.75)
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 150
                            )
                        )
                        .frame(width: 240, height: 240)
                }
                .scaleEffect(scale)
                
                Spacer()
                
                Button(action: stopSession) {
                    Text("Stop")
                        .font(.system(size: 20))
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.horizontal, 44)
                        .padding(.vertical, 16)
                        .background(
                            Capsule()
                                .fill(Color.white.opacity(0.2))
                        )
                }
                .padding(.bottom, 50)
            }
        }
        .onAppear {
            startSession()
        }
    }
    
    private func startSession() {
        isRunning = true
        
        breathingTask = Task {
            
            let endTime = Date().addingTimeInterval(totalSession)
            
            while isRunning && Date() < endTime {

                await MainActor.run {
                    isInhaling = true
                }

                await MainActor.run {
                    withAnimation(.easeInOut(duration: inhaleDuration)) {
                        scale = 1.05
                    }
                }

                haptics.playContinuous(
                    intensity: 0.5,
                    sharpness: 0.2,
                    duration: inhaleDuration
                )
                
                try? await Task.sleep(nanoseconds: UInt64(inhaleDuration * 1_000_000_000))
                
                if Task.isCancelled { break }
                await MainActor.run {
                    isInhaling = false
                }

                await MainActor.run {
                    withAnimation(.easeOut(duration: exhaleDuration)) {
                        scale = 0.94
                    }
                }

                
                haptics.playContinuous(
                    intensity: 0.3,
                    sharpness: 0.1,
                    duration: exhaleDuration
                )
                
                try? await Task.sleep(nanoseconds: UInt64(exhaleDuration * 1_000_000_000))
            }
            
            finishSession()
        }
    }
    
    
    private func stopSession() {
        isRunning = false
        breathingTask?.cancel()
        finishSession()
    }
    
    
    private func finishSession() {
        withAnimation(.easeOut(duration: 1.5)) {
            scale = 0.94
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            onComplete()
        }
    }
}
