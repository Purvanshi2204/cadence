import SwiftUI

@main
struct HapticCalmApp: App {
    
    @StateObject private var store = SessionStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}

