//
//  StartView.swift
//  haptic_companier_ssc
//
//  Created by GEU on 19/02/26.
//

import SwiftUI

struct StartView: View {
    
    var onStart: () -> Void
    @State private var breathePulse = false
    
    var body: some View {
        ZStack {
             LinearGradient(
                colors: [
                    Color(hue: 0.60, saturation: 0.28, brightness: 0.95),
                    Color(hue: 0.63, saturation: 0.32, brightness: 0.88)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            
            VStack(spacing: 24) {
                
                Spacer()
                
                Text("Take a Moment")
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundColor(.black.opacity(0.85))
                
                
                Text("No pressure. Just breathe.")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.55))
                
                
                Spacer()
               
                Button(action: {
                    onStart()
                }) {
                    Text("Begin")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 18)
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
                        .shadow(color: Color.black.opacity(0.15), radius: 10, y: 6)
                }
                
                Spacer().frame(height: 60)
            }
        }
    }
}


