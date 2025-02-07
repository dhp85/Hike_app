//
//  CardView.swift
//  Hike_App
//
//  Created by Diego Herreros Parron on 4/2/25.
//

import SwiftUI

import SwiftUI

struct CardView: View {
    
    // MARK: - Propiedades
    @State private var imageNumber: Int = 1 // Almacena el número de la imagen actual
    @State private var randomNumber: Int = 1 // Almacena un número aleatorio para cambiar la imagen
    
    // MARK: - Cuerpo de la Vista
    var body: some View {
        ZStack {
            // Fondo personalizado de la tarjeta
            CustomBackgroundView()
            
            VStack {
                // MARK: - Cabecera
                VStack(alignment: .leading) {
                    HStack {
                        // Título principal de la tarjeta
                        Text("SENDERISMO")
                            .fontWeight(.black)
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(
                                colors: [Color.customGrayLight, Color.customGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom))
                        Spacer() // Espaciador para empujar los elementos a los extremos
                        
                        // Botón con acción personalizada
                        Button {
                            print("Presionado") // Acción al presionar el botón
                        } label: {
                            CustomButtonView() // Vista personalizada del botón
                        }
                    }
                    
                    // Descripción de la actividad
                    Text("Actividad al aire libre divertida y agradable para amigos y familia.")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(Color.customGrayMedium)
                }
                .padding() // Añade un poco de espacio alrededor
                
                // MARK: - Imagen Principal
                ZStack {
                    CustomCircleView() // Vista personalizada del fondo circular
                    
                    // Imagen dinámica con animación
                    Image("image-\(imageNumber)")
                        .resizable() // Permite que la imagen cambie de tamaño
                        .scaledToFit() // Ajusta la imagen manteniendo la relación de aspecto
                        .animation(.default, value: imageNumber) // Aplica animación al cambiar la imagen
                }
                
                // MARK: - Botón de Exploración
                Button {
                    getRandomImage() // Llama a la función para cambiar la imagen
                    print("Me voy a explorar") // Mensaje en la consola
                } label: {
                    Text("Explorar Más")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreeMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 1)
                }
                .buttonStyle(GradientButtonStyle()) // Aplica un estilo de botón personalizado
            }
        }
        .frame(width: 320, height: 570) // Define el tamaño de la tarjeta
    }
    
    // MARK: - Métodos
    
    /// Genera un nuevo número aleatorio para cambiar la imagen, asegurando que no se repita la actual.
    func getRandomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5) // Genera un número aleatorio entre 1 y 5
        } while randomNumber == imageNumber // Repite hasta que el número sea diferente
        
        imageNumber = randomNumber // Asigna el nuevo número para actualizar la imagen
    }
}

#Preview {
    CardView()
}
