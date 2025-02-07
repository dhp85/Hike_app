//
//  GradientButtonStyle.swift
//  Hike_App
//
//  Created by Diego Herreros Parron on 7/2/25.
//

import Foundation
import SwiftUI


struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                :
                    LinearGradient(colors: [.customGrayMedium,.customGrayLight], startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}
