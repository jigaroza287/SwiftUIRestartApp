//
//  CircleGroupView.swift
//  Restart
//
//  Created by Jigar Oza on 22/08/24.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - Properties
    @State var color: Color
    @State var opacity: Double
    @State private var isAnimating: Bool = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(opacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(color.opacity(opacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//: ZStack
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    CircleGroupView(color: .red, opacity: 0.2)
}
