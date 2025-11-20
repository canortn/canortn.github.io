import SwiftUI
struct ContentView: View {
    let games = ["League Of Legends", "Fortnite", "FC 26", "Valorant"]
    var body: some View {
        VStack(spacing: 20) {
            Text("My Array Map V1 – Gaming")
                .font(.title2)
                .padding(.bottom, 10)
            ForEach(0..<games.count, id: \.self) { i in
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(height: 60)
                    .overlay(
                        HStack {
                            Text("Index \(i):")
                                .font(.headline)
                            Text(games[i])
                                .font(.headline)
                                .foregroundColor(.purple)
                            
                            Spacer()
                        }
                        
                            .padding(.horizontal)
                    )
            }
            Spacer()
        }
        .padding()
    }   
}
