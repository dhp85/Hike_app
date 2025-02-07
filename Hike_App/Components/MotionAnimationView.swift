//
//  MotionAnimationView.swift
//  Hike_App
//
//  Created by Diego Herreros Parron on 7/2/25.
//

import SwiftUI

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - Propiedades
    
    /// Número aleatorio de círculos que se generarán en la vista (entre 6 y 12).
    @State private var randomCircle: Int = Int.random(in: 6...12)
    
    /// Estado que controla la animación de los círculos.
    @State private var isAnimating: Bool = false
    
    // MARK: - Funciones auxiliares
    
    /// Genera una coordenada aleatoria dentro del rango de 0 a 256.
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    /// Genera un tamaño aleatorio para los círculos (entre 4 y 80 píxeles).
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    /// Genera un factor de escala aleatorio para los círculos (entre 0.1 y 2.0).
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    /// Genera una velocidad de animación aleatoria (entre 0.05 y 1.0).
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    /// Genera un retraso aleatorio antes de que inicie la animación (entre 0 y 2 segundos).
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    // MARK: - Cuerpo de la Vista
    
    var body: some View {
        ZStack {
            // Itera sobre la cantidad aleatoria de círculos generados
            ForEach(0...randomCircle, id: \.self) { _ in
                Circle()
                    .foregroundStyle(.white) // Color de los círculos
                    .opacity(0.25) // Opacidad reducida para efecto visual
                    .frame(width: randomSize()) // Tamaño aleatorio
                    .position(x: randomCoordinate(), y: randomCoordinate()) // Posición aleatoria
                    .scaleEffect(isAnimating ? randomScale() : 1) // Aplica una escala aleatoria en la animación
                    .onAppear {
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever() // Repite la animación infinitamente
                            .speed(randomSpeed()) // Velocidad aleatoria de la animación
                            .delay(randomDelay())) { // Retraso aleatorio antes de iniciar la animación
                            isAnimating = true
                        }
                    }
            }
        }
        .frame(width: 256, height: 256) // Tamaño del contenedor
        .mask(Circle()) // Aplica una máscara circular para limitar la vista
        .drawingGroup() // Mejora el rendimiento al renderizar gráficos complejos
    }
}

#Preview {
    MotionAnimationView()
        .background(Circle().fill(.teal))
}
