import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Scenario 3: Number Guess Game")
                .font(.title2)
            ForEach(messages, id: \.self) { line in
                Text(line)
            }
        }
        .padding()
    }
    
    var messages: [String] {
        let secretNumber = Int.random(in: 1...20)
        let guesses: [Int] = [3, 10, 15, 18, 19, 20]
        
        var attempts = 0
        var foundCorrect = false
        var lines: [String] = []
        
        for guess in guesses {
            attempts += 1
            
            if guess == secretNumber {
                lines.append("Guess \(guess) is correct! You won in \(attempts) attempts.")
                foundCorrect = true
                break
            } else if guess < secretNumber {
                lines.append("Guess \(guess) is too low.")
            } else {
                lines.append("Guess \(guess) is too high.")
            }
        }
        
        if !foundCorrect {
            lines.append("You ran out of guesses. The secret number was \(secretNumber).")
        }
        
        return lines
    }
}
