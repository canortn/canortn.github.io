import SwiftUI

struct ContentView: View {
    @State private var plaintext = ""
    @State private var key = ""
    @State private var ciphertext = ""
    var body: some View {
        NavigationView {
        Form {
        Section("Input") {
            TextField("Plaintext", text: $plaintext)
                .textInputAutocapitalization(.never)
            TextField("Key", text: $key)
                .textInputAutocapitalization(.never)
            }
            
            Button("Encrypt") {
            ciphertext = vigenereEncrypt(text: plaintext, key: key)
            }
            
            Section("Output") {
                Text(ciphertext)
                .font(.headline)
            }
        }
        .navigationTitle("Vigenère Cipher")
        }
    }
    
    func vigenereEncrypt(text: String, key: String) -> String {
        let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        
        var result = ""
        
        let keyArray = Array(key.uppercased())
        
        if keyArray.isEmpty { return text }
        
        var keyIndex = 0
        
        for char in text.uppercased() {
        if let textIndex = alphabet.firstIndex(of: char),
           let shift = alphabet.firstIndex(of: keyArray[keyIndex]) {

                let newIndex = (textIndex + shift) % 26
                result.append(alphabet[newIndex])
                
                keyIndex = (keyIndex + 1) % keyArray.count
            } else {
                result.append(char)
            }
        }
        
        return result
    }
}
