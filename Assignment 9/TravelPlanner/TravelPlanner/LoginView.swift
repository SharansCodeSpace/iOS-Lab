import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""
    @State private var showError = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Travel Planner Login")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                if showError {
                    Text("Invalid credentials")
                        .foregroundColor(.red)
                }
                
                Button("Login") {
                    if username == "User" && password == "pass" {
                        withAnimation {
                            isLoggedIn = true
                        }
                    } else {
                        showError = true
                    }
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
            }
            .padding()
        }
    }
}
