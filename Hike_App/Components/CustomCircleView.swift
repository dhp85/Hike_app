//
//  CustomCircleView.swift
//  Hike_App
//
//  Created by Diego Herreros Parron on 7/2/25.
//

import SwiftUI

struct CustomCircleView: View {
    
    // Estado para controlar la animación del degradado
    @State private var isAnimateGradiet: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    colors: [.customIndigoMedium, .customSalmonLight], // Colores personalizados del degradado
                    startPoint: isAnimateGradiet ? .topLeading : .bottomLeading, // Punto de inicio animado
                    endPoint: isAnimateGradiet ? .bottomTrailing : .topTrailing // Punto de final animado
                ))
                .onAppear {
                    // Inicia la animación cuando la vista aparece
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradiet.toggle() // Alterna el estado para cambiar los puntos del degradado
                    }
                }
            MotionAnimationView()
        } // Tamaño del círculo
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
