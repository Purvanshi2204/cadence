import SwiftUI


struct ContentView: View {
    
    @State private var screen: Screen = .start
    
    enum Screen {
        case start
        case breathing
        case reflection
    }
    
    var body: some View {
        switch screen {
            
        case .start:
            StartView {
                screen = .breathing
            }
            
        case .breathing:
            BreathingView {
                screen = .reflection
            }
            
        case .reflection:
            ReflectionView {
                screen = .start
            }
        }
    }
}


