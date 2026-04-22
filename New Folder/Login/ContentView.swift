import SwiftUI

struct ContentView: View {
    
    // State untuk menyimpan input user
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var message: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Input Email
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            // Input Password
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            // Button Login
            Button(action: {
                login()
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            // Pesan error / sukses
            Text(message)
                .foregroundColor(.red)
            
        }
        .padding()
    }
    
    // Fungsi login sederhana
    func login() {
        if email.isEmpty || password.isEmpty {
            message = "Email dan password wajib diisi"
        } else if email == "admin@gmail.com" && password == "123456" {
            message = "Login berhasil ✅"
        } else {
            message = "Email atau password salah ❌"
        }
    }
}

#Preview {
    ContentView()
}
