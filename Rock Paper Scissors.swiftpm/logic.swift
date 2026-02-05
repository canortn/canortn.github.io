import Foundation

struct GameLogic {
    let choices = ["✊", "✋", "✌️"]
    
    enum Outcome {
        case win, lose, tie
        
        var text: String {
            switch self {
            case .win: return "Kazandın!"
            case .lose: return "Kaybettin!"
            case .tie: return "Berabere!"
            }
        }
    }
    
    func randomComputerChoice() -> String {
        choices.randomElement() ?? "✊"
    }
    
    func determineWinner(userChoice: String, computerChoice: String) -> Outcome {
        if userChoice == computerChoice { return .tie }
        
        if (userChoice == "✊" && computerChoice == "✌️") ||
            (userChoice == "✋" && computerChoice == "✊") ||
            (userChoice == "✌️" && computerChoice == "✋") {
            return .win
        } else {
            return .lose
        }
    }
}
