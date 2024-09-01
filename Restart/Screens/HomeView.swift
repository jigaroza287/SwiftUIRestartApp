//
//  HomeView.swift
//  Restart
//
//  Created by Jigar Oza on 22/08/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @AppStorage("Onboarding") var isOnboardingViewActive = true
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 16) {
            
            // MARK: - Header
            
            Spacer()
            
            ZStack {
                CircleGroupView(color: .gray, opacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
            }
            
            // MARK: - Center

            Text("Starve your distractions. Feed your focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - Footer
            
            Spacer()
            
            Button {
                DispatchQueue.global().async {
                    playSound(sound: "success", type: "m4a")
                }
                DispatchQueue.main.async {
                    withAnimation(Animation.easeOut(duration: 0.4)) {
                        isOnboardingViewActive = true
                    }
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded, weight: .bold))
            }//: Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }//: VStack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
