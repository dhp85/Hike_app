//
//  CustomBackgroundView.swift
//  Hike_App
//
//  Created by Diego Herreros Parron on 4/2/25.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: - 3. DEPTH
            Color.customGreenDark
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 12)
            
            // MARK: - 2. LIGHT
            Color.customGreenLight
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 3)
                .opacity(0.8)
            
            // MARK: - 3. SURFACE
            
            
            LinearGradient(
                colors: [Color.customGreenLight,
                         Color.customGreeMedium],
                startPoint: .top,
                endPoint: .bottom)
            .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
