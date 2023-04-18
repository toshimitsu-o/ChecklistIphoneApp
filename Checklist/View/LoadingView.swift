//
//  LoadingView.swift
//  Checklist
//
//  Created by Toshimitsu Ota on 13/4/2023.
//

import SwiftUI

/// View to display loading status
struct LoadingView: View {
    /// state value loading for animation
    @State private var isLoading = false
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.default.repeatForever(autoreverses: false))
            .onAppear() {
                isLoading = true
                        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
