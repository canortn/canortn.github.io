import SwiftUI

struct ContentView: View {
    let gridSize = 10
    let dotSize: CGFloat = 18
    let gap: CGFloat = 8
    let letterSpacing: CGFloat = 48
    let cColor: Color = .yellow
    let oColor: Color = .blue
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 24) {
                Text("My Initials with Code")
                    .font(.title2).bold()
                    .foregroundColor(.white)
                HStack(spacing: letterSpacing) {
                    gridView(for: "C")
                    gridView(for: "O")
                }
                .padding()
            }
        }
    }
    
    @ViewBuilder
    func gridView(for letter: Character) -> some View {
        VStack(spacing: gap) {
            ForEach(0..<gridSize, id: \.self) { row in
                HStack(spacing: gap) {
                    ForEach(0..<gridSize, id: \.self) { col in
                        if shouldDraw(letter: letter, row: row, col: col) {
                            Circle()
                                .fill(letter == "C" ? cColor : oColor)
                                .frame(width: dotSize, height: dotSize)
                        } else {
                            Color.clear
                                .frame(width: dotSize, height: dotSize)
                        }
                    }
                }
            }
        }
    }
    
    func shouldDraw(letter: Character, row: Int, col: Int) -> Bool {
        switch letter {
        case "C":
            let topOrBottom = (row == 0 || row == gridSize - 1) && (1...gridSize-2).contains(col)
            let leftSide = (col == 0) && (1...gridSize-2).contains(row)
            return topOrBottom || leftSide
        case "O":
            let topOrBottom = (row == 0 || row == gridSize - 1) && (1...gridSize-2).contains(col)
            let sides = (col == 0 || col == gridSize - 1) && (1...gridSize-2).contains(row)
            return topOrBottom || sides
        default:
            return false
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

