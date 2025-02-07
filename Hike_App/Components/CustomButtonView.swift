//
//  CustomButtonView.swift
//  Hike_App
//
//  Created by Diego Herreros Parron on 4/2/25.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors:
                [.white, Color.customGreenLight,
                 Color.customGreeMedium],
                startPoint: .top,
                endPoint: .bottom))
            Circle()
                .stroke(
                    LinearGradient(colors:
                    [Color.customGrayLight,
                     Color.colorGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom),
                    lineWidth: 4)
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size:30))
                .foregroundStyle(LinearGradient(colors: [Color.customGrayLight, Color.customGrayMedium], startPoint: .top, endPoint: .bottom))
                
        }
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
}
