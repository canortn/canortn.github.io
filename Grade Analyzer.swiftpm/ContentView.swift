import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Scenario 2: Grade Analyzer")
                .font(.title2)
            Text("Average score: \(average)")
            Text("Final letter grade: \(letterGrade)")
        }
        .padding()
    }
    
    var average: Double {
        let quizScores: [Int] = [80, 92, 75, 88]
        let examScores: [Int] = [90, 84]
        
        var totalPoints = 0
        var numberOfScores = 0
        
        for score in quizScores {
            totalPoints += score
            numberOfScores += 1
        }
        
        for score in examScores {
            totalPoints += score
            numberOfScores += 1
        }
        
        return Double(totalPoints) / Double(numberOfScores)
    }
    
    var letterGrade: String {
        let avg = average
        if avg >= 90 {
            return "A"
        } else if avg >= 80 {
            return "B"
        } else if avg >= 70 {
            return "C"
        } else if avg >= 60 {
            return "D"
        } else {
            return "F"
        }
    }
}
