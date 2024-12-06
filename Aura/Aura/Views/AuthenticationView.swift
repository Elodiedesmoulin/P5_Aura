//
//  AuthenticationView.swift
//  Aura
//
//  Created by Elo on 28/10/2024.
//

import SwiftUI

struct AuthenticationView: View {
    
    let gradientStart = Color(hex: "#94A684").opacity(0.7)
    let gradientEnd = Color(hex: "#94A684").opacity(0.0) // Fades to transparent
    
    @ObservedObject var viewModel: AuthenticationViewModel
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [gradientStart, gradientEnd]), startPoint: .top, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    Text("Welcome !")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    TextField("Adresse email", text: $viewModel.username)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                    
                    SecureField("Mot de passe", text: $viewModel.password)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                    
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    
                    
                    Button(action: {
                        viewModel.login()
                    }) {
                        Text("Se connecter")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#94A684"))
                            .cornerRadius(8)
                    }
                    
                    
                    
                }
                .padding(.horizontal, 40)
                
            }
            .onTapGesture {
                self.endEditing(true)
            }
        }
    }
}

