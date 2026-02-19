//
//  AdaptiveRhythmManager.swift
//  haptic_companier_ssc
//
//  Created by GEU on 19/02/26.
//

import Foundation

struct BreathingRhythm {
    var inhale: Double
    var exhale: Double
}

actor AdaptiveRhythmManager {
    
    static let shared = AdaptiveRhythmManager()
    
    private var currentRhythm = BreathingRhythm(inhale: 4, exhale: 4)
    
    func getRhythm() -> BreathingRhythm {
        currentRhythm
    }
    
    func updateRhythm(from mood: ReflectionView.Mood?) {
        guard let mood else { return }
        
        switch mood {
        case .lighter:
            currentRhythm = BreathingRhythm(inhale: 4, exhale: 4)
            
        case .same:
            currentRhythm = BreathingRhythm(inhale: 4, exhale: 5)
            
        case .overwhelmed:
            currentRhythm = BreathingRhythm(inhale: 5, exhale: 6)
        }
    }
}


