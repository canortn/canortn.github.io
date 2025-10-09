import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct ContentView: View {
    @State private var scoop1: Color? = nil
    @State private var scoop2: Color? = nil
    @State private var scoop3: Color? = nil
    @State private var scoop4: Color? = nil
    @State private var scoop5: Color? = nil
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Scoops: \(count)")
                .font(.title2)
            
            let scoopSize: CGFloat = 110
            let step: CGFloat = 36
            
            ZStack {
                Triangle()
                    .fill(.brown)
                    .frame(width: 120, height: 150)
                    .offset(y: 70)
                
                if let c = scoop1 {
                    Circle()
                        .fill(c)
                        .frame(width: scoopSize, height: scoopSize)
                        .overlay(Text("1").font(.headline).foregroundColor(.white))
                        .offset(y: -step * CGFloat(max(count - 1, 0)))
                }
                if let c = scoop2 {
                    Circle()
                        .fill(c)
                        .frame(width: scoopSize, height: scoopSize)
                        .overlay(Text("2").font(.headline).foregroundColor(.white))
                        .offset(y: -step * CGFloat(max(count - 2, 0)))
                }
                if let c = scoop3 {
                    Circle()
                        .fill(c)
                        .frame(width: scoopSize, height: scoopSize)
                        .overlay(Text("3").font(.headline).foregroundColor(.white))
                        .offset(y: -step * CGFloat(max(count - 3, 0)))
                }
                if let c = scoop4 {
                    Circle()
                        .fill(c)
                        .frame(width: scoopSize, height: scoopSize)
                        .overlay(Text("4").font(.headline).foregroundColor(.white))
                        .offset(y: -step * CGFloat(max(count - 4, 0)))
                }
                if let c = scoop5 {
                    Circle()
                        .fill(c)
                        .frame(width: scoopSize, height: scoopSize)
                        .overlay(Text("5").font(.headline).foregroundColor(.white))
                        .offset(y: -step * CGFloat(max(count - 5, 0)))
                }
            }
            .frame(height: 320)

            .frame(height: 280)
            
            HStack(spacing: 24) {
                Button("Add Scoop") { add() }
                Button("Reset") { reset() }
            }
            .buttonStyle(.plain)
        }
        .padding()
    }
    
    func colorFor(_ i: Int) -> Color {
        let colors: [Color] = [.pink, .yellow, .mint, .purple, .blue]
        return colors[(i - 1) % colors.count]
    }
    
    func add() {
        if scoop1 == nil { scoop1 = colorFor(1); count = 1 }
        else if scoop2 == nil { scoop2 = colorFor(2); count = 2 }
        else if scoop3 == nil { scoop3 = colorFor(3); count = 3 }
        else if scoop4 == nil { scoop4 = colorFor(4); count = 4 }
        else if scoop5 == nil { scoop5 = colorFor(5); count = 5 }
        else { reset() }
    }
    
    func reset() {
        count = 0
        scoop1 = nil; scoop2 = nil; scoop3 = nil; scoop4 = nil; scoop5 = nil
    }
}
