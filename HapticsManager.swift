//
//  HapticsManager.swift
//  haptic_companier_ssc
//
//  Created by GEU on 17/02/26.
//
import Foundation
import CoreHaptics

class HapticsManager {
    
    private var engine: CHHapticEngine?
    
    init() {
        prepareHaptics()
    }
    
    private func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Haptics engine failed to start")
        }
    }
    
    func playContinuous(intensity: Float, sharpness: Float, duration: Double) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
        let sharpnessParam = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
        
        let event = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [intensityParam, sharpnessParam],
            relativeTime: 0,
            duration: duration
        )
        
        do {
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Haptic playback failed")
        }
    }
}


