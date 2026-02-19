//
//  ReflectionCategorizer.swift
//  haptic_companier_ssc
//
//  Created by GEU on 19/02/26.
//
import Foundation

struct ReflectionCategorizer {
    
    static func categorize(_ text: String) -> String {
        let lower = text.lowercased()
        
        if lower.contains("presentation") || lower.contains("meeting") || lower.contains("interview") {
            return "performance anxiety"
        }
        
        if lower.contains("friends") || lower.contains("party") || lower.contains("people") || lower.contains("social") {
            return "social stress"
        }
        
        if lower.contains("exam") || lower.contains("study") || lower.contains("deadline") {
            return "academic stress"
        }
        
        if lower.contains("night") || lower.contains("sleep") || lower.contains("overthinking") {
            return "night overthinking"
        }
        
        return "general stress"
    }
}

