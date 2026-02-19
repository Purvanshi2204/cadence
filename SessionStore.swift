//
//  SessionStore.swift
//  haptic_companier_ssc
//
//  Created by GEU on 17/02/26.
//

import Foundation

class SessionStore: ObservableObject {
    
    @Published var sessions: [SessionEntry] = []
    
    private let saveKey = "sessions_key"
    
    init() {
        load()
    }
    
    func add(reflection: String) {
        
        let category = ReflectionCategorizer.categorize(reflection)
        
        let entry = SessionEntry(
            id: UUID(),
            date: Date(),
            reflection: reflection,
            category: category
        )
        
        sessions.append(entry)
        save()
    }

    
    private func save() {
        if let encoded = try? JSONEncoder().encode(sessions) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([SessionEntry].self, from: data) {
            sessions = decoded
        }
    }
}
