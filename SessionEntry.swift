//
//  SessionEntry.swift
//  haptic_companier_ssc
//
//  Created by GEU on 17/02/26.
//

import Foundation

struct SessionEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let reflection: String
    let category: String
}

