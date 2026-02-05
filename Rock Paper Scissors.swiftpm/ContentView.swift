import SwiftUI

struct ContentView: View {
    
    let game = GameLogic()
    @State var userChoice = "—"
    @State var computerChoice = "—"
    @State var resultText = "Seçimini yap"
    @State var hasPlayed = false
    @State var win = ""
    @State var lose = ""
    @State var tie = ""
    
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Taş Kağıt Makas")
                .font(.title)
                .bold()
            
            HStack(spacing: 24) {
                VStack(spacing: 6) {
                    Text("Sen")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(userChoice)
                        .font(.system(size: 52))
                }
                
                VStack(spacing: 6) {
                    Text("PC")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(computerChoice)
                        .font(.system(size: 52))
                }
            }
            
            Text(resultText)
                .font(.headline)
            
            HStack(spacing: 14) {
                ForEach(game.choices, id: \.self) { emoji in
                    Button {
                        play(user: emoji)
                    } label: {
                        Text(emoji)
                            .font(.system(size: 44))
                            .frame(width: 72, height: 60)
                    }
                    .buttonStyle(.bordered)
                    .disabled(hasPlayed)
                }
            }
            
            if hasPlayed {
                Button("Play Again") {
                    playAgain()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 6)
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func play(user: String) {
        guard !hasPlayed else { return }
        
        userChoice = user
        computerChoice = game.randomComputerChoice()
        
        let outcome = game.determineWinner(
            userChoice: userChoice,
            computerChoice: computerChoice
        )
        
        resultText = outcome.text
        hasPlayed = true
    }
    
    private func playAgain() {
        userChoice = "—"
        computerChoice = "—"
        resultText = "Seçimini yap"
        hasPlayed = false
    }
}
